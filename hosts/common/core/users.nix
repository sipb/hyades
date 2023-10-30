{ self, config, pkgs, lib, ... }:

{
  users.mutableUsers = false;
  users.users."sipbadmin" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    
    # TODO: (ryang2) Remove hardcoded keys and passwords
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhhv9n6p6i/WM0fgeL/hidJy+6bam/EXrt4K8jWsU15moxQTjMjKri8wLAUYxAwjQvziR2FbdmJPYvd/Uz18AZQPSs+ESA6MRbbEMou+citayiQCGDrm+vp6Q+wG1fUjz1V0p6pLJzC3Bxr7YMnfOn3JtDSQGrum8EnLSzzEaLvulk3e6GjWNHr7bLw0hTyPus2ZLCkQnnbwz8Bc6Iu/JWIFWn3NPHqsheBC08dLVVWexvyBSDwwp2qfO/dm0SrEz1n8RMD8g7uaLrgFGMPU4KJ2rUij+YWBf6pyq13kZIcKR6DMv6mETm5KPJNGUUX/YLLqZDwOkhac8ldDovqphGQ=="
    ];
    initialPassword = "password"; 
  };
}
