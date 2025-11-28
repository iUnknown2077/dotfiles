-- Variables
local modkey = "Mod4"

-- Basic Settings
oxwm.set_terminal("kitty")
oxwm.set_modkey(modkey)

-- Basic window management
oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "D", oxwm.spawn({ "sh", "-c", "rofi -show drun" }))
oxwm.key.bind({ modkey }, "S", oxwm.spawn({ "sh", "-c", "maim ~/Obrazy/$(date +%s).png" }))
oxwm.key.bind({ modkey }, "Q", oxwm.client.kill())

-- Keybind overlay
oxwm.key.bind({ modkey, "Shift" }, "Slash", oxwm.show_keybinds())

-- Client actions
oxwm.key.bind({ modkey, "Shift" }, "F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ modkey, "Shift" }, "Space", oxwm.client.toggle_floating())

-- Layout management
oxwm.key.bind({ modkey }, "F", oxwm.layout.set("normie"))
oxwm.key.bind({ modkey }, "C", oxwm.layout.set("tiling"))
oxwm.key.bind({ modkey }, "N", oxwm.layout.cycle())

-- Gaps toggle
oxwm.key.bind({ modkey }, "A", oxwm.toggle_gaps())

-- WM controls
oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())

-- Focus direction
oxwm.key.bind({ modkey }, "H", oxwm.client.focus_direction("left"))
oxwm.key.bind({ modkey }, "J", oxwm.client.focus_direction("down"))
oxwm.key.bind({ modkey }, "K", oxwm.client.focus_direction("up"))
oxwm.key.bind({ modkey }, "L", oxwm.client.focus_direction("right"))

-- Monitor focus
oxwm.key.bind({ modkey }, "Comma", oxwm.focus_monitor(-1))
oxwm.key.bind({ modkey }, "Period", oxwm.focus_monitor(1))

-- Tag viewing
oxwm.key.bind({ modkey }, "1", oxwm.tag.view(0))
oxwm.key.bind({ modkey }, "2", oxwm.tag.view(1))
oxwm.key.bind({ modkey }, "3", oxwm.tag.view(2))
oxwm.key.bind({ modkey }, "4", oxwm.tag.view(3))
oxwm.key.bind({ modkey }, "5", oxwm.tag.view(4))
oxwm.key.bind({ modkey }, "6", oxwm.tag.view(5))
oxwm.key.bind({ modkey }, "7", oxwm.tag.view(6))
oxwm.key.bind({ modkey }, "8", oxwm.tag.view(7))
oxwm.key.bind({ modkey }, "9", oxwm.tag.view(8))

-- Move window to tag
oxwm.key.bind({ modkey, "Shift" }, "1", oxwm.tag.move_to(0))
oxwm.key.bind({ modkey, "Shift" }, "2", oxwm.tag.move_to(1))
oxwm.key.bind({ modkey, "Shift" }, "3", oxwm.tag.move_to(2))
oxwm.key.bind({ modkey, "Shift" }, "4", oxwm.tag.move_to(3))
oxwm.key.bind({ modkey, "Shift" }, "5", oxwm.tag.move_to(4))
oxwm.key.bind({ modkey, "Shift" }, "6", oxwm.tag.move_to(5))
oxwm.key.bind({ modkey, "Shift" }, "7", oxwm.tag.move_to(6))
oxwm.key.bind({ modkey, "Shift" }, "8", oxwm.tag.move_to(7))
oxwm.key.bind({ modkey, "Shift" }, "9", oxwm.tag.move_to(8))

-- Swap windows in direction
oxwm.key.bind({ modkey, "Shift" }, "H", oxwm.client.swap_direction("left"))
oxwm.key.bind({ modkey, "Shift" }, "J", oxwm.client.swap_direction("down"))
oxwm.key.bind({ modkey, "Shift" }, "K", oxwm.client.swap_direction("up"))
oxwm.key.bind({ modkey, "Shift" }, "L", oxwm.client.swap_direction("right"))
