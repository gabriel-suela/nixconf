{
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      settings.user = {
        email = "gscsuela@gmail.com";
        name = "gabriel-suela";
      };
      signing.key = "D4033338";
      signing.signByDefault = true;
    };
  };
}
