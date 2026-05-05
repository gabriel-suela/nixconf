{
  flake.homeModules.firefox = {
    programs.firefox = {
      enable = true;
      configPath = ".mozilla/firefox";
    };
  };
}
