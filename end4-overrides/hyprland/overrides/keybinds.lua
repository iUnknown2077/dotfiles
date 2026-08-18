-- Apps
hl.unbind("SUPER + C")
hl.bind("SUPER + C", hl.dsp.exec_cmd("kitty nvim")) -- Code Editor
hl.unbind("SUPER + X")
hl.bind("SUPER + X", hl.dsp.exec_cmd("obsidian --disable-gpu --enable-wayland-ime")) -- Text Editor
hl.unbind("CTRL + SHIFT + ESCAPE")
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty -1 fish -c btop")) -- Task manager
