--@meta
--@module 'oxwm'

local colors = require("colors");
local bar_font = "Maple Mono NF:style=Bold:size=11"
local tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9", }
local modkey = "Mod4"

-- Basic Settings
oxwm.set_terminal("kitty")
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)


-- Layout symbol overrides
oxwm.set_layout_symbol("tiling", "󰝘")
oxwm.set_layout_symbol("normie", "")

-- Border configuration
oxwm.border.set_width(0)
oxwm.border.set_focused_color(colors.accent1)
oxwm.border.set_unfocused_color(colors.bg)

-- Gap configuration
oxwm.gaps.set_enabled(true)
oxwm.gaps.set_inner(5, 5)
oxwm.gaps.set_outer(5, 5)

-- Bar configuration
oxwm.bar.set_font(bar_font)

-- Color Scheme
oxwm.bar.set_scheme_normal(colors.fg, colors.bg, "#444444")
oxwm.bar.set_scheme_occupied(colors.fg, colors.bg, colors.bgh)
oxwm.bar.set_scheme_selected(colors.accent1, colors.bg, colors.bgh)

-- Keybindings

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

-- Multi-monitor support
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

-- Keychord example: Mod4+Space then T to spawn terminal
oxwm.key.chord({
    { { modkey }, "Space" },
    { {},         "T" }
}, oxwm.spawn("st"))

-- Status
-- bar
-- blocks
oxwm.bar.set_blocks({
  oxwm.bar.block.shell({
    command = "cat /sys/class/power_supply/BAT1/capacity",
    format = " {}%",
    interval = 30,
    color = colors.fg,
    underline = false
  }),
  oxwm.bar.block.static({
    format = " |  ",
    text = "",
    interval = 999999999,
    color = colors.bgh,
    underline = false
  }),
  oxwm.bar.block.ram({
    format = " {}GB",
    interval = 5,
    color = colors.fg,
    underline = false
  }),
  oxwm.bar.block.static({
    format = " |  ",
    text = "",
    interval = 999999999,
    color = colors.bgh,
    underline = false
  }),
  oxwm.bar.block.shell({
    command = "uname -r",
    format = " {}",
    interval = 999999999,
    color = colors.fg,
    underline = false
  }),
  oxwm.bar.block.static({
    format = " |  ",
    text = "",
    interval = 999999999,
    color = colors.bgh,
    underline = false
  }),
  oxwm.bar.block.datetime({
    format = " {}",
    interval = 1,
    color = colors.fg,
    underline = false,
    date_format = "%a %b %d"
  }),
  oxwm.bar.block.static({
    format = " |  ",
    text = "",
    interval = 999999999,
    color = colors.bgh,
    underline = false
  }),
  oxwm.bar.block.datetime({
    format = " {}",
    interval = 1,
    color = colors.fg,
    underline = false,
    date_format = "%H:%M"
  })
})

-- Autostart commands
oxwm.autostart("picom")
oxwm.autostart("feh --bg-scale --randomize ~/.config/feh/wallpapers/*")
oxwm.autostart("dunst")
