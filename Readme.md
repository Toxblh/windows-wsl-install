
# Configure Windows WSL for Frontend Development

Location .zshrc in windows

Win+R > `%USERPROFILE%\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home`

next open `%UbuntuUser%\.zshrc`

Change bash to zsh
in bash `nano ~/.bashrc` or in the folder from the previous point
and put to top of the file

```shell
# Launch Zsh
if [ -t 1 ]; then
exec zsh
fi
```

Or simple
```shell
wget -O - https://raw.githubusercontent.com/Toxblh/windows-wsl-install/master/install.sh | sudo bash
```
