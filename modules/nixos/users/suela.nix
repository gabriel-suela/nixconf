{
  flake.nixosModules.suelaUser = {pkgs, ...}: {
    users.users.suela = {
      isNormalUser = true;
      description = "suela";
      extraGroups = ["networkmanager" "wheel" "docker"];
      shell = pkgs.zsh;
    };
  };
}
