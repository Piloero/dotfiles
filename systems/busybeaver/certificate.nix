{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  rootCA = builtins.toFile "RootCA.crt" (builtins.readFile /home/nixos/.secrets/RootCA.crt);
in
{
  security.pki.certificateFiles = [
    rootCA
  ];

  nixpkgs.overlays = [
    (final: prev: {
      cacert = prev.cacert.override {
        extraCertificateFiles = [
          rootCA
        ];
      };
    })
  ];

  nix.settings.ssl-cert-file = "/etc/ssl/certs/ca-bundle.crt";

  environment.sessionVariables = {
    SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
    NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
    CURL_CA_BUNDLE = "/etc/ssl/certs/ca-bundle.crt";
    GIT_SSL_CAINFO = "/etc/ssl/certs/ca-bundle.crt";
    REQUESTS_CA_BUNDLE = "/etc/ssl/certs/ca-bundle.crt";
  };
}
