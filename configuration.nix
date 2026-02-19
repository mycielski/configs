{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./k3s.nix
      ./gnome.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-3b57e8c2-496e-4cc6-8233-70e7b2165181".device = "/dev/disk/by-uuid/3b57e8c2-496e-4cc6-8233-70e7b2165181";
  networking.hostName = "t14";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Taipei";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  console.keyMap = "pl2";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.tomaszjm = {
    isNormalUser = true;
    description = "tomaszjm";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  environment.variables.EDITOR = "vim";

  system.stateVersion = "25.11";

}
