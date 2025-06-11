
#!/bin/sh

swayidle -w \
  timeout 120 'light -O && light -S 5 && hyprlock' \
  timeout 300 'brightnessctl --device=kbd_backlight set 0 && niri msg output eDP-1 off' \
    resume 'light -I && brightnessctl --device=kbd_backlight set 10 && niri msg output eDP-1 on' \
  before-sleep 'hyprlock'

