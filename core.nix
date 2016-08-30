{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Need this to clone the home directory
    git
  ];
  programs = {
    zsh.enable = true;
  };
  time.timeZone = "Europe/London";
  users.mutableUsers = false;
  users.extraUsers.tcsavage = {
    description = "Tom Savage";
    createHome = true;
    home = "/home/tcsavage";
    group = "users";
    extraGroups = ["wheel" "networkmanager" "adb" "video" "power"];
    shell = "${pkgs.zsh}/bin/zsh";
    uid = 1000;
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5l9CRr1i+sx7PnvWBnVDc3sXk2RreTWInQGt9RStOARPoIou3ediZc/mjY5dHY7F55/rRZF2w9xLGkvt8OFczAX2Jy/zrw2Mc0FM81/uXbo+vg4ekNslbbPrJT1r8kDBgu8iEMuEsB+D62F4TbWgke6ewusRJDqkNs4CWK0MmZY3YJImIGExdLRqyJJEr4ZjXG2Rae/DPEukz7hFhb61780TCK0OOoFY7a3oLdKP7fVIWTqBObntkzpNIv+ZXtpkYRhd9ETzlm3PH9xSV412HGU/1x7EDR6MGRIAbMsoaIZccI6yDS0kfiGn3c0f7PGir8er6zz4gKBpWp9U+ZEdgQ== tcsavage@gmail.com"];
    password = "changeme";
  };
}
