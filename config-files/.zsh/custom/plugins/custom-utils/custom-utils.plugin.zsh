# ==========================================
# Custom Project Navigation & Interop Utils
# ==========================================

# 1. Projects Listing (Optimized sorting)
projects() { 
    echo "$HOME/dotfiles"

    if [ -d "$HOME/projects" ]; then
        find "$HOME/projects" -maxdepth 4 -type d -name .git -printf "%Ts %p\n" \
            | sort -n \
            | sed 's:^[0-9]\+ ::g' \
            | sed 's:/.git$::g'
    fi
} 

# 2. Fuzzy Finding Projects with CTRL+P
find_projects() { 
    local selected_dir
    selected_dir=$(projects \
        | sed "s:^$HOME:~:g" \
        | fzf --preview "cat \$(echo {} | sed 's:^~:'$HOME':')/README.md 2>/dev/null || echo 'No README found'" \
        | sed "s:^~:$HOME:g")

    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        # Safely force Zsh to clear and redraw the prompt in a widget context
        zle reset-prompt
    fi
}

# Bind to Ctrl + P
zle -N find_projects
bindkey '^P' find_projects


# 3. WSL Environment Cross-Interop Utilities
explorer() {
    if ! command -v explorer.exe > /dev/null 2>&1; then
        echo "Windows explorer could not be found!" >&2
        return 1
    fi

    if [ $# -gt 0 ]; then
        explorer.exe "$@"
    else
        explorer.exe .
    fi
}
alias e=explorer

vscode() {
    if ! command -v code > /dev/null 2>&1; then
        echo "VSCode 'code' command could not be found!" >&2
        return 1
    fi

    if [ $# -gt 0 ]; then
        code "$@"
    else
        code .
    fi
}
alias c=vscode