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
  services.xserver.displayManager.sessionCommands = with pkgs; lib.mkAfter ''
    ${feh}/bin/feh --bg-scale ${config.users.extraUsers.tcsavage.home}/wallpaper/background.png
    xscreensaver -no-splash &
    parcellite &
  '';

  environment.systemPackages = with pkgs; [
    xscreensaver
    parcellite
  ];
}
