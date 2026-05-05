{
  flake.nixosModules.systemPrograms = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    programs.steam.enable = true;
    programs.zsh.enable = true;

    services.openssh.enable = true;
  };
}
