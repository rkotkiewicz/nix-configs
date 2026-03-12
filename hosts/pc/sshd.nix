{ inputs, lib, config, pkgs, ... }:
{
  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = true;
#    kbdInteractiveAuthentication = false;
    #permitRootLogin = "yes";
  };
}