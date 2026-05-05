{self, ...}: {
  flake.nixosModules.suelaHome = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.users.suela = {
      imports = [
        self.homeModules.desktopPackages
        self.homeModules.devPackages
        self.homeModules.firefox
        self.homeModules.git
        self.homeModules.zsh
      ];

      home.username = "suela";
      home.homeDirectory = "/home/suela";
      home.stateVersion = "25.11";
    };
  };
}
