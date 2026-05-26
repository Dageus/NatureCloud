{
  description = "CNV Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        system = "x86_64-linux"; # Adjust to your architecture
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            packer
            terraform
            docker
            awscli2
            tflint
          ];
        };

        shellHook = ''
          echo "========== CNV Dev Environment Loaded =========="
          terraform --version
          packer --version
        '';
      }
    );
}
