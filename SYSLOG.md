### 24th June 2020 Wednesday

- Vim setup for golang and python
- Autocomplete for both languages using `ycm_core` pkg
- Config files pushed to github for bspwm, vimrc, polybar etc
- The power of ignorance-- .gitignore!!!
- Pckgs required for bluetooth-- pulseaudio-bluetooth, bluez, bluez-utils

### 28th June 2020 Sunday

- Notification theme that matches terminal, polybar
- Battery notifications using `systemctl` and `dunst` and `notify-send`
- Start using `$ systemctl --user start iwantpower.service`
- Nautilus disable recent files, use urxvt as default terminal: 
    - `$ gsettings set org.gnome.desktop.privacy remember-recent-files false`
    - `$ gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal urxvt`
- `.service` files, or systemd atleast use `%h` for `home` rather than 
the conventional `~` sign.


### 16th July 2020 Thursday

- Lots of changes, switched terminal to kitty, emulator to tmux
- Added devicons for vim, support for js-- likes of `emmet` etc
- Nord theme for tmux, Batman + wal theme for Terminal and vim
- Bluetooth issue was fixed-- `bluez-hid2hci` or something
- If you're gui session is not starting, use: `$ sudo startx`


### 24th December 2020 Thursday

#monogame #gamedev

- Nautlius `open in terminal` is now set to kitty using `gsettings`
- Vim now supports Haxe, the autocomplete is garbage and so slow
- NPM global packages are now stored in the user's home directory
- Command to build openfl projects:
    - `$ openfl test linux`
- Monogame and vscode ext installation:
    - Link: [Monogame Website](https://docs.monogame.net/articles/getting_started/1_setting_up_your_development_environment_ubuntu.html)
    - Getting Started [guide](https://docs.monogame.net/articles/getting_started/2_creating_a_new_project_netcore.html)
    - `$ sudo pacman -S dotnet-sdk-3.1`
    - `$ code --install-extension ms-dotnettools.csharp`
    - `$ dotnet tool install --global dotnet-mgcb-editor`
    - `$ mgcb-editor --register` <- Didn't work :/ Fix below
    - `$ chmod +x ~/.nuget/packages/monogame.content.builder/3.7.0.4/build/MGCB/build/ffprobe`
    - `$ chmod +x ~/.nuget/packages/monogame.content.builder/3.7.0.4/build/MGCB/build/ffmpeg`
    - `$ sudo pacman -S mono` for Hevadea
    - And then to build the project, go to Hevadea.Launcher:
    - `$ dotnet build .`
