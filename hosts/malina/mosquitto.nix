{ ... }:

{
  sops.secrets.mosquitto_shadow = {
      owner = "mosquitto";
  };

  services.mosquitto = {
    enable = true;
    listeners = [{
      port = 1883;
      address = "0.0.0.0";
      users.mosquitto_listener = {
        acl = [ "readwrite #" ];
        hashedPasswordFile = config.sops.secrets.mosquitto_shadow.path;
      };
      settings.allow_anonymous = false;
    }];
  };
}