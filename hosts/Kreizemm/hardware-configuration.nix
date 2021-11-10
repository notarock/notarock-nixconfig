# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # This machine has a name:
  networking.hostName = "Kreizemm";

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e634d8ea-3374-4051-9724-8bf22c50049d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0B0E-37DD";
    fsType = "vfat";
  };

  fileSystems."/mnt/Cassette" = {
    device = "/dev/disk/by-label/Cassette";
    fsType = "ext4";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/44b14860-eaa1-4956-bf47-3b7c69aac097"; }];

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  nix.maxJobs = lib.mkDefault 8;

  services.xserver.xrandrHeads = [
    {
      output = "DisplayPort-0";
      primary = true;
      monitorConfig = ''
        Option "PreferredMode" "3840x2160"
        Option "Position" "1080 0"
      '';
    }
    {
      output = "DisplayPort-1";
      primary = false;
      monitorConfig = ''
        Option "PreferredMode" "1920x1080"
        Option "Position" "0 0"
        Option "Rotate" "right"
      '';
    }
  ];

  my.dpi = 144;

}
