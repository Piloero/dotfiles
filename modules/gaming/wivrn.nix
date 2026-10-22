{ pkgs, ... }:
{
  services.wivrn = {
    enable = true;
    openFirewall = true;
    autoStart = false;
    # Leave this disabled for now.
    highPriority = false;

    # Saturn uses NVIDIA, so enable CUDA for GPU encoding.
    package = pkgs.wivrn.override {
      cudaSupport = true;
    };

    steam = {
      enable = true;
      importOXRRuntimes = true;
    };

    # Translate OpenVR applications such as Elite Dangerous to OpenXR.
    config = {
      enable = true;
      json = {
        "openvr-compat-path" = "${pkgs.opencomposite}/lib/opencomposite";
        "encoder" = {
          "encoder" = "nvenc";
          "codec" = "h265";
        };
      };
    };
  };
}
