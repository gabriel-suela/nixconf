{self, inputs, ...}: {
  flake.nixosModules.mainConfiguration = {
    imports = [
      self.nixosModules.mainHardware
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.audio
      self.nixosModules.boot
      self.nixosModules.docker
      self.nixosModules.gnome
      self.nixosModules.locale
      self.nixosModules.nixSettings
      self.nixosModules.nvidia
      self.nixosModules.printing
      self.nixosModules.suelaUser
      self.nixosModules.suelaHome
      self.nixosModules.systemPrograms
    ];

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
