{ self, config, pkgs, lib, ... }:

{
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;
  hardware.cpu.amd.updateMicrocode = true;
  boot.tmp.useTmpfs = true;

  boot.initrd.systemd.enable = true;
  boot.initrd.availableKernelModules = [
    # Virtio (QEMU, KVM etc.) support.
    "virtio_net" "virtio_pci" "virtio_mmio" "virtio_blk" "virtio_scsi" "virtio_balloon" "virtio_console"
  ];
  environment.systemPackages = [
    config.boot.kernelPackages.cpupower
  ];

  boot.kernelModules =[
    # Virtualization
    "kvm_intel" "kvm_amd"
  ];
  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_amd nested=1
  '';


  #boot.loader.systemd-boot.enable = true;
  #fileSystems."/" = {
  #  device = "/tmpfs";
  #  fsType = "tmpfs";
  #  options = [ "mode=755" ];
  #};

  virtualisation.vmVariant = {
    virtualisation.graphics = false;
    virtualisation.useBootLoader = false;
    virtualisation.cores = 2;
    virtualisation.memorySize = 2048;
  };
}
