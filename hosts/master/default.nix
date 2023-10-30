{ self, config, pkgs, lib, ... }:

{
  imports = [
    ../common/core/default.nix
  ];

  boot.kernelModules = [ "overlay" "br_netfilter" ];
  boot.kernel.sysctl = {
    "net.bridge.bridge-nf-call-iptables" = true;
    "net.bridge.bridge-nf-call-ip6tables" = true;
    "net.ipv4.ip_forward" = true;
  };
}
