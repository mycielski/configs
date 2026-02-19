{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./kubernetes.nix

    ./system/audio.nix
    ./system/bootloader.nix
    ./system/gnome.nix
    ./system/hostname.nix
    ./system/kernel.nix
    ./system/locale.nix
    ./system/luks.nix
    ./system/networking.nix
    ./system/packages.nix
    ./system/timezone.nix
    ./system/wayland.nix
    ./system/xorg.nix
  ];

  system.stateVersion = "25.11";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  console.keyMap = "pl2";

  nixpkgs.config.allowUnfree = true;

  environment.variables.EDITOR = "vim";

  users.users.tomaszjm = {
    isNormalUser = true;
    description = "tomaszjm";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

}
