--@meta
--@module 'oxwm'

local colors = require("colors");
local font = "Maple Mono NF:style=Bold:size=10"
local tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9", }
local modkey = "Mod4"

-- Basic settings
oxwm.set_terminal("kitty")
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)

-- Layout symbol overrides
oxwm.set_layout_symbol("tiling", "󰝘")
oxwm.set_layout_symbol("normie", "")

oxwm.set_terminal("kitty")

-- Border configuration
oxwm.border.set_width(1)
oxwm.border.set_focused_color(colors.accent1)
oxwm.border.set_unfocused_color(colors.bg)

-- Gap configuration
oxwm.gaps.set_enabled(true)
oxwm.gaps.set_inner(5, 5)
oxwm.gaps.set_outer(5, 5)

-- Color Scheme
oxwm.bar.set_scheme_normal(colors.fg, colors.bg, "#444444")
oxwm.bar.set_scheme_occupied(colors.fg, colors.bg, colors.bgh)
oxwm.bar.set_scheme_selected(colors.accent1, colors.bg, colors.bgh)

-- Keychords
oxwm.key.chord({
  { { modkey }, "Space" },
  { {}, "T" }
}, oxwm.spawn("alacritty"))

oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "D", oxwm.spawn({ "sh", "-c", "rofi -show drun" }))
oxwm.key.bind({ modkey }, "S", oxwm.spawn({ "sh", "-c", "maim ~/Pictures/$(date +%s).png" }))
oxwm.key.bind({ modkey }, "Q", oxwm.client.kill())

oxwm.key.bind({ modkey, "Shift" }, "Slash", oxwm.show_keybinds())

oxwm.key.bind({ modkey, "Shift" }, "F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ modkey, "Shift" }, "Space", oxwm.client.toggle_floating())

oxwm.key.bind({ modkey }, "F", oxwm.layout.set("normie"))
oxwm.key.bind({ modkey }, "C", oxwm.layout.set("tiling"))
oxwm.key.bind({ modkey }, "N", oxwm.layout.cycle())

oxwm.key.bind({ modkey }, "A", oxwm.toggle_gaps())

oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())

oxwm.key.bind({ modkey }, "J", oxwm.client.focus_stack("1"))
oxwm.key.bind({ modkey }, "K", oxwm.client.focus_stack("-1"))

-- View tag
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

-- Custom
oxwm.key.bind({ modkey }, "B", oxwm.spawn({ "sh", "-c", "./.config/scripts/bookmarks.sh" }))

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
    date_format = "%a, %b %d - %H:%M"
  }),
})

oxwm.bar.set_font(font)

-- Autostart commands
oxwm.autostart("picom")
oxwm.autostart("feh --bg-scale --randomize ~/.config/feh/wallpapers/*")
oxwm.autostart("dunst")
oxwm.autostart("nm-applet")
