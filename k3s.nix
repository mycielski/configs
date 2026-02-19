{ pkgs, ... }:

{
  users.users.k3s-admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  services.k3s = {
    enable = true;
    role = "server";
    #    extraFlags = "--disable traefik";
  };

}
