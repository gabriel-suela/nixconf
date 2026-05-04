{ self, inputs, ... }: {
  flake.nixosModules.suelaHome = { pkgs, ... }: {
    home-manager.users.suela = { pkgs, ... }: {
      home.username = "suela";
      home.homeDirectory = "/home/suela";

      programs.firefox = {
        enable = true;
        configPath = ".mozilla/firefox";
      };

      programs.git = {
        enable = true;
      };

      programs.zsh = {
        enable = true;
      };

      home.packages = with pkgs; [
        alacritty
        cargo
        docker-compose
        gcc
        gh
        git
        go
        google-chrome
        gnumake
        jq
        k9s
        kind
        kubectl
        kubernetes-helm
        lazydocker
        lazygit
        neovim
        nodejs
        prettier
        protontricks
        pyright
        ripgrep
        shfmt
        stylua
        tmux
        tree-sitter
        unzip
        wget
        wine
        winetricks
        wl-clipboard
        yq-go
      ];

      home.stateVersion = "25.11";
    };
  };
}
