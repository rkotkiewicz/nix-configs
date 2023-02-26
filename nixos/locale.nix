{ inputs, lib, config, pkgs, ... }: {

  time.timeZone = "Europe/Warsaw";
  i18n = {
    supportedLocales = [ "all" ];
    defaultLocale = "pl_PL.UTF-8";
    extraLocaleSettings = {
        LANGUAGE = "pl_PL.UTF-8";
        LC_ALL = "pl_PL.UTF-8";
    };
  };

}