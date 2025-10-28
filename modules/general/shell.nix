{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            edit = "sudo -e";
            # update = "sudo nixos-rebuild switch";
        };

        histSize = 10000;
        histFile = "$HOME/.zsh_history";
        setOptions = [
            "HIST_IGNORE_ALL_DUPS"
        ];
        ohMyZsh = {
            enable = true;
        };
    };

    environment.systemPackages = with pkgs; [
        starship
        oh-my-zsh

        # =====================
        # Command Line Tools
        # =====================
        stow

        fzf

        jq

        fd
        eza
        tldr
        duf
        lsd
        ripgrep
        tmux
        zellij
        helix
        yazi
        bat

        fastfetch
    ];  
    
    programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    flags = [
      "--cmd cd"
    ];
  };
}