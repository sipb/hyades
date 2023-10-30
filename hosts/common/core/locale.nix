{ self, config, pkgs, lib, ... }:

{
  time.timeZone = lib.mkDefault "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = lib.mkDefault "us";

  environment.etc."issue".text = lib.mkForce ''
    \e{lightgreen}\S{NAME} \S{BUILD_ID} -- \l\e{reset}
    \e{gray}\s \r \v \m\e{reset}

  '';
}
