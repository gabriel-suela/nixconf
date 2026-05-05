{
  flake.nixosModules.gnome = {
    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "intl";
    };

    i18n.inputMethod.enable = false;

    console.keyMap = "us-acentos";
  };
}
