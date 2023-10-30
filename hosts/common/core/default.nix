{ self, config, pkgs, lib, ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./shell.nix
    ./users.nix
    #./zramswap.nix
  ];

  system.stateVersion = "23.10";
}
