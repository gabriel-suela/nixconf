{
  flake.homeModules.zsh = {pkgs, ...}: {
    home.sessionPath = [
      "$HOME/.local/state/nix/profiles/home-manager/home-path/bin"
    ];

    programs = {
      fzf.enable = true;

      zoxide.enable = true;

      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        history = {
          path = "$HOME/.history";
          size = 100000;
          save = 100000;
          share = true;
        };

        shellAliases = {
          diff = "diff --color=auto";
          grep = "grep --color=auto";
          ip = "ip -c=auto";
          k = "kubectl";
          ls = "ls --color=auto -hv";
          v = "$EDITOR";
        };

        initContent = ''
          fpath+=(${pkgs.pure-prompt}/share/zsh/site-functions)
          autoload -U promptinit; promptinit
          prompt pure

          export XCOMPOSEFILE="$HOME/.XCompose"
          export GTK_IM_MODULE=cedilla
          export QT_IM_MODULE=cedilla
          export EDITOR=nvim
          export TERMINAL=alacritty
          export PATH="/usr/lib/ccache/bin:$HOME/bin:$HOME/.local/bin:$HOME/.local/scripts:''${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
          export HELM_DIFF_THREE_WAY_MERGE=true
          export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:''${PKG_CONFIG_PATH:-}"

          # Onlinefix vars
          export WINEDLLOVERRIDES="OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam\_api64=n"
          export GAMEID=480

          # Fix for appimage on wayland
          export QT_QPA_PLATFORM=xcb

          setopt append_history inc_append_history share_history
          setopt auto_menu menu_complete
          setopt autocd
          setopt auto_param_slash
          setopt no_case_glob no_case_match
          setopt globdots
          setopt extended_glob
          setopt interactive_comments
          unsetopt prompt_sp
          stty stop undef

          zstyle ':completion:*' menu select
          zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS} ma=0\;33
          zstyle ':completion:*' squeeze-slashes false

          bindkey "\e[A" history-beginning-search-backward
          bindkey "\e[B" history-beginning-search-forward
          bindkey '^[[1;5C' emacs-forward-word
          bindkey '^[[1;5D' emacs-backward-word
          bindkey "^[[3~" delete-char
          bindkey -s "^F" "tmux-sessionizer\n"

          export NVM_DIR="$HOME/.nvm"
          [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
          [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

          if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
            . "$HOME/google-cloud-sdk/path.zsh.inc"
          fi

          if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
            . "$HOME/google-cloud-sdk/completion.zsh.inc"
          fi

        '';
      };
    };
  };
}
