{ self, inputs, ... }: {

  flake.nixosModules.mainConfiguration = { config, pkgs, lib, ... }: {
    imports = [
      self.nixosModules.mainHardware
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.suelaHome
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Sao_Paulo";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };

    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "intl";
    };

    # Nvidia
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings = true;
    };

    console.keyMap = "us-acentos";

    services.printing.enable = true;

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    users.users.suela = {
      isNormalUser = true;
      description = "suela";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
    };

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    programs.zsh.enable = true;
    programs.steam.enable = true;

    nixpkgs.config.allowUnfree = true;

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    virtualisation.docker.enable = true;

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    services.openssh.enable = true;

    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
