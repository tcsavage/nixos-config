{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.slim = {
    enable = true;
    defaultUser = "tcsavage";
  };
  services.xserver.windowManager = {
    default = "xmonad";
    xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
}
