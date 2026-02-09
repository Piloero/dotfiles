# Build Command
# nix build .#gitbutler
# ./result/bin/gitbutler

{ appimageTools
, fetchzip
, lib
, gtk3
, glib
, atk
, at-spi2-core
, libappindicator-gtk3
, libsecret
, libxkbcommon
, copyDesktopItems
, makeWrapper
, mesa
, libglvnd
, libX11
, nss
, makeDesktopItem
, curl
, nghttp2
, fontconfig
, freetype
, libxcb
, expat
, harfbuzz
, libgbm
, libdrm
, libgpg-error
, e2fsprogs
}:

let
  pname = "gitbutler";
  version = "0.19.1";

  src = fetchzip {
    url = "https://releases.gitbutler.com/releases/release/0.19.1-2847/linux/x86_64/GitButler_0.19.1_amd64.AppImage.tar.gz";

    stripRoot = false;
    
    # nix-prefetch-url --unpack [url]
    # nix hash convert --hash-algo sha256 --from nix32 --to sri <base32>
    hash = "sha256-Nj9nnAhmBRiox33hPsz0lyFZFitDkmJbzmUdPK5R2mo=";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version;
    src = "${src}/GitButler_${version}_amd64.AppImage";
  };
in
appimageTools.wrapType2 {
  inherit pname version;

  # 2. Use the AppImage file extracted from the tarball
  src = "${src}/GitButler_${version}_amd64.AppImage";

  # 3. Add necessary runtime dependencies
  extraPkgs = _: [
    fontconfig
    freetype
    harfbuzz
    gtk3
    glib
    atk
    at-spi2-core
    libsecret
    libappindicator-gtk3
    libxkbcommon
    libxcb
    libX11
    expat
    libgbm
    libdrm
    libgpg-error
    libglvnd
    mesa
    nss
    curl
    nghttp2
    e2fsprogs
  ];

  nativeBuildInputs = [ makeWrapper copyDesktopItems ];

  desktopItems = [
    (makeDesktopItem {
      name = "gitbutler";
      desktopName = "GitButler";
      exec = "gitbutler";
      icon = "gitbutler";
      categories = [ "Development" "RevisionControl" ];
    })
  ];

  extraInstallCommands = ''
    if [ -d "${appimageContents}/usr/lib/git-core" ]; then
      wrapProgram $out/bin/gitbutler \
        --set GDK_BACKEND wayland,x11 \
        --set NO_AT_BRIDGE 1 \
        --set GIT_EXEC_PATH "${appimageContents}/usr/lib/git-core" \
        --prefix PATH : "${appimageContents}/usr/bin"
    else
      wrapProgram $out/bin/gitbutler \
        --set GDK_BACKEND wayland,x11 \
        --set NO_AT_BRIDGE 1 \
        --prefix PATH : "${appimageContents}/usr/bin"
    fi

    if [ -x "${appimageContents}/usr/bin/gitbutler-tauri" ]; then
      ln -sfn "${appimageContents}/usr/bin/gitbutler-tauri" "$out/bin/but"
      wrapProgram $out/bin/but \
        --set GDK_BACKEND x11 \
        --set NO_AT_BRIDGE 1 \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ glib atk at-spi2-core e2fsprogs libX11 libglvnd libdrm libgbm libgpg-error fontconfig freetype harfbuzz gtk3 libsecret libappindicator-gtk3 libxkbcommon libxcb expat mesa nss curl nghttp2 ]}"
    fi
  '';
}