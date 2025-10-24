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
    };

    environment.systemPackages = with pkgs; [
        starship
    ];

    programs.starship = {
        enable = true;
        settings = {
            add_newline = true;
            command_timeout = 1300;
            scan_timeout = 50;
            format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
            character = {
            success_symbol = "[](bold green) ";
            error_symbol = "[✗](bold red) ";
            };
        };
    };
}