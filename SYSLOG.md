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

