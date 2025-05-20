{ lib, buildNpmPackage, fetchFromGitHub }:

buildNpmPackage rec {
  pname = "filen-desktop";
  version = "2.0.24";

  src = fetchFromGitHub {
    owner = "FilenCloudDienste";
    repo = "filen-desktop";
    rev = "v${version}";
    sha256 = "sha256-3OHL0cJoXPCYTyads/oDreMTelfRcm5qOsQ87CxRQLg=";
  };

  postPatch = "	cp ${
       ./package-lock.json
     } package-lock.json\n	chmod +w package-lock.json\n";

  npmDepsHash = "sha256-hDDvnLaCQRFtYA+7wUsO7M7gSc847aI6lW2xlrKlVqc=";

  meta = with lib; {
    description = "Filen Desktop Client for Linux";
    homepage = "https://filen.io";
    license = lib.licenses.agpl3Only;
    maintainers = [ lib.maintainers.vtp ];
  };
}
