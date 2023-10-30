{ ... }:

{
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
    };
    channel.enable = false;
    gc.automatic = false;
  };
  #nixpkgs = {
  #  config = { allowUnfree = true; };
  #};
}
