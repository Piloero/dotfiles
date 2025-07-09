# Usefull commands 

## nix
To rebuild the system use 
```bash
sudo nixos-rebuild switch --flake ~/.dotfiles/systems/#pluto
```

If the hostname is the same as the name of the config then the following will suffice.
```bash
sudo nixos-rebuild switch --flake .
```
## stow
To link the dotfiles directory to the home dirextory use
```
stow -t ~ ~/.dotfiles/dotfiles
```