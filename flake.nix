{
  description = "hyades Nix Files";

  outputs = inputs @ { self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # self' and inputs' provide easy access to attributes of same system

        # checks: Executed by `nix flake check`
        # apps
        apps."test-e2e-example" = {
	  type = "app";
	  program = (pkgs.nixosTest {
            name = "test-e2e-example";
            nodes.machine1 = {...}: { imports = [./hosts/master]; documentation.enable = false; };
            nodes.machine2 = {...}: { imports = [./hosts/master]; documentation.enable = false; };
            testScript = ''
              start_all()
              for machine in machines:
                  machine.wait_for_unit("default.target")
            ''; 
          }).config.driver;
	};

        # formatter
        #packages.vm = self.nixosConfigurations.master.config.system.build.vm;
        # packages.default = pkgs.hello;
        # devShells = 
      };

      flake = {
        # overlays = import ./overlays { inherit self; };
        # nixosModules = import ./modules/nixos { inherit self; };
        nixosConfigurations = import ./hosts { inherit self; };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    flake-parts = {
      url = "github:hercules-ci/flake-parts"; 
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # github:nix-community/vulnix 

    # Pinned Packages
    # Find using `nix run github:nix-community/nix-index-database bin/kubectl`
    # Find using https://nixhub.io

    # k8s 1.28.2
    nixpkgs-kubernetes.url = "github:nixos/nixpkgs/f902cb49892d300ff15cb237e48aa1cad79d68c3";

    # cilium-cli 0.15.8
    nixpkgs-cilium.url = "github:nixos/nixpkgs/8b5ab8341e33322e5b66fb46ce23d724050f6606";

    # ceph / ceph-client / ceph-csi
  };
}

