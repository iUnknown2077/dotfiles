-- Apps
hl.unbind("SUPER + C")
hl.bind("SUPER + C", hl.dsp.exec_cmd("kitty nvim")) -- Code editor
hl.unbind("SUPER + X")
hl.bind("SUPER + X", hl.dsp.exec_cmd("obsidian --disable-gpu --enable-wayland-ime")) -- Text editor
hl.unbind("CTRL + SHIFT + ESCAPE")
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty -1 fish -c btop")) -- Task manager
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("~/.config/fish/scripts/kitty.fish")) -- Small floating kitty
