{
  services.xserver.enable = false;

  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.xterm.enable = false;

  #  services.xserver.xkb = {
  #    layout = "pl";
  #    variant = "";
  #  };
}
