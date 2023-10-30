{ self, config, pkgs, lib, ... }:

{
  services.vnstat.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
    extraConfig = ''
      AllowTcpForwarding yes
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
    '';
  };

  # systemd-networkd
  systemd.network = {
    enable = lib.mkOverride 2000 true;

    networks."10-lan" = {
      matchConfig.Name = "en*";
      networkConfig.DHCP = "ipv4";
      linkConfig.RequiredForOnline = "yes";
    };
  };
  networking = {
    hostName = lib.mkOverride 2000 "";  # Use DHCP provided hostname. Has a priority lower than mkDefault.
    firewall.enable = true;
    nftables.enable = true;
  };

  #warning: The combination of `systemd.network.enable = true`, `networking.useDHCP = true` and `networking.useNetworkd = false` can cause both networkd and dhcpcd to manage the same interfaces. This can lead to loss of networking. It is recommended you choose only one of networkd (by also enabling `networking.useNetworkd`) or scripting (by disabling `systemd.network.enable`)
}
