## Usefull commands 

To rebuild the system use 
```bash
sudo nixos-rebuild switch --flake ~/nixos/systems/#pluto
```

If the hostname is the same as the name of the config then the following will suffice.
```bash
sudo nixos-rebuild switch --flake .
```