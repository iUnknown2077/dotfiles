-------------------------------------------------------------------------------
-- OXWM Configuration File
-------------------------------------------------------------------------------

---@meta
---@module 'oxwm'

--- Variables ---
local modkey = "Mod4"
local terminal = "alacritty"
local colors = require("custom-colors");
local tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
local bar_font = "BlexMono Nerd Font Propo:style=Bold:size=10"

--- Status Bar ---
local blocks = {
  oxwm.bar.block.shell({
    format = " {}",
    command = "uname -r",
    interval = 999999999,
    color = colors.white,
    underline = false,
  }),
  oxwm.bar.block.static({
    text = "|",
    interval = 999999999,
    color = colors.bg,
    underline = false,
  }),
  oxwm.bar.block.ram({
    format = " {used}/{total} GB",
    interval = 5,
    color = colors.white,
    underline = false,
  }),
  oxwm.bar.block.static({
    text = "|",
    interval = 999999999,
    color = colors.bg,
    underline = false,
  }),
  oxwm.bar.block.datetime({
    format = " {}",
    date_format = "%Y %b %d",
    interval = 1,
    color = colors.white,
    underline = false,
  }),
  oxwm.bar.block.static({
    text = "|",
    interval = 999999999,
    color = colors.bg,
    underline = false,
  }),
  oxwm.bar.block.datetime({
    format = " {}",
    date_format = "%H:%M",
    interval = 1,
    color = colors.white,
    underline = false,
  }),
};

--- Basic Settings ---
oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)

--- Layouts ---
oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")
oxwm.set_layout_symbol("monocle", "[M]")
oxwm.set_layout_symbol("grid", "[G]")
oxwm.set_layout_symbol("tabbed", "[=]")
oxwm.set_layout_symbol("scrolling", "[>>]")

--- Appearance ---
oxwm.border.set_width(2)
oxwm.border.set_focused_color(colors.blue)
oxwm.border.set_unfocused_color(colors.bg)

oxwm.gaps.set_smart(true)
oxwm.gaps.set_inner(5, 5)
oxwm.gaps.set_outer(5, 5)

--- Window Rules ---
-- -- oxwm.rule.add({})

--- Status Bar Configuration ---
oxwm.bar.set_font(bar_font)
oxwm.bar.set_blocks(blocks)

oxwm.bar.set_scheme_normal(colors.white, colors.bg, colors.bg)
oxwm.bar.set_scheme_occupied(colors.white, colors.bg, colors.bg)
oxwm.bar.set_scheme_selected(colors.blue, colors.fg, colors.blue)

oxwm.bar.set_hide_vacant_tags(false)

--- Keybindings ---

-- Basic window management
oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "D", oxwm.spawn({ "sh", "-c", "rofi -show drun" }))
oxwm.key.bind({ modkey }, "S", oxwm.spawn({ "sh", "-c", "maim -s | xclip -selection clipboard -t image/png" }))
oxwm.key.bind({ modkey }, "Q", oxwm.client.kill())

-- Keybind overlay - Shows important keybindings on screen
oxwm.key.bind({ modkey, "Shift" }, "Slash", oxwm.show_keybinds())

-- Window state toggles
oxwm.key.bind({ modkey, "Shift" }, "F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ modkey, "Shift" }, "Space", oxwm.client.toggle_floating())

-- Layout management
oxwm.key.bind({ modkey }, "C", oxwm.layout.set("tiling"))
oxwm.key.bind({ modkey }, "N", oxwm.layout.cycle())

-- Master area controls (tiling layout)
-- Decrease/Increase master area width
oxwm.key.bind({ modkey }, "H", oxwm.set_master_factor(-5))
oxwm.key.bind({ modkey }, "L", oxwm.set_master_factor(5))
-- Increment/Decrement number of master windows
oxwm.key.bind({ modkey }, "I", oxwm.inc_num_master(1))
oxwm.key.bind({ modkey }, "P", oxwm.inc_num_master(-1))

-- Gaps toggle
oxwm.key.bind({ modkey }, "A", oxwm.toggle_gaps())

-- Window manager controls
oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())

-- Focus movement [1 for up in the stack, -1 for down]
oxwm.key.bind({ modkey }, "J", oxwm.client.focus_stack(1))
oxwm.key.bind({ modkey }, "K", oxwm.client.focus_stack(-1))

-- Window movement (swap position in stack)
oxwm.key.bind({ modkey, "Shift" }, "J", oxwm.client.move_stack(1))
oxwm.key.bind({ modkey, "Shift" }, "K", oxwm.client.move_stack(-1))

-- Multi-monitor support
-- Focus next/previous Monitors
oxwm.key.bind({ modkey }, "Comma", oxwm.monitor.focus(-1))
oxwm.key.bind({ modkey }, "Period", oxwm.monitor.focus(1))
-- Move window to next/previous Monitors
oxwm.key.bind({ modkey, "Shift" }, "Comma", oxwm.monitor.tag(-1))
oxwm.key.bind({ modkey, "Shift" }, "Period", oxwm.monitor.tag(1))

-- Workspace (tag) navigation
oxwm.key.bind({ modkey }, "1", oxwm.tag.view(0))
oxwm.key.bind({ modkey }, "2", oxwm.tag.view(1))
oxwm.key.bind({ modkey }, "3", oxwm.tag.view(2))
oxwm.key.bind({ modkey }, "4", oxwm.tag.view(3))
oxwm.key.bind({ modkey }, "5", oxwm.tag.view(4))
oxwm.key.bind({ modkey }, "6", oxwm.tag.view(5))
oxwm.key.bind({ modkey }, "7", oxwm.tag.view(6))
oxwm.key.bind({ modkey }, "8", oxwm.tag.view(7))
oxwm.key.bind({ modkey }, "9", oxwm.tag.view(8))

-- Move focused window to workspace N
oxwm.key.bind({ modkey, "Shift" }, "1", oxwm.tag.move_to(0))
oxwm.key.bind({ modkey, "Shift" }, "2", oxwm.tag.move_to(1))
oxwm.key.bind({ modkey, "Shift" }, "3", oxwm.tag.move_to(2))
oxwm.key.bind({ modkey, "Shift" }, "4", oxwm.tag.move_to(3))
oxwm.key.bind({ modkey, "Shift" }, "5", oxwm.tag.move_to(4))
oxwm.key.bind({ modkey, "Shift" }, "6", oxwm.tag.move_to(5))
oxwm.key.bind({ modkey, "Shift" }, "7", oxwm.tag.move_to(6))
oxwm.key.bind({ modkey, "Shift" }, "8", oxwm.tag.move_to(7))
oxwm.key.bind({ modkey, "Shift" }, "9", oxwm.tag.move_to(8))

-- Combo view (view multiple tags at once) {argos_nothing}
oxwm.key.bind({ modkey, "Control" }, "1", oxwm.tag.toggleview(0))
oxwm.key.bind({ modkey, "Control" }, "2", oxwm.tag.toggleview(1))
oxwm.key.bind({ modkey, "Control" }, "3", oxwm.tag.toggleview(2))
oxwm.key.bind({ modkey, "Control" }, "4", oxwm.tag.toggleview(3))
oxwm.key.bind({ modkey, "Control" }, "5", oxwm.tag.toggleview(4))
oxwm.key.bind({ modkey, "Control" }, "6", oxwm.tag.toggleview(5))
oxwm.key.bind({ modkey, "Control" }, "7", oxwm.tag.toggleview(6))
oxwm.key.bind({ modkey, "Control" }, "8", oxwm.tag.toggleview(7))
oxwm.key.bind({ modkey, "Control" }, "9", oxwm.tag.toggleview(8))

-- Multi tag (window on multiple tags)
oxwm.key.bind({ modkey, "Control", "Shift" }, "1", oxwm.tag.toggletag(0))
oxwm.key.bind({ modkey, "Control", "Shift" }, "2", oxwm.tag.toggletag(1))
oxwm.key.bind({ modkey, "Control", "Shift" }, "3", oxwm.tag.toggletag(2))
oxwm.key.bind({ modkey, "Control", "Shift" }, "4", oxwm.tag.toggletag(3))
oxwm.key.bind({ modkey, "Control", "Shift" }, "5", oxwm.tag.toggletag(4))
oxwm.key.bind({ modkey, "Control", "Shift" }, "6", oxwm.tag.toggletag(5))
oxwm.key.bind({ modkey, "Control", "Shift" }, "7", oxwm.tag.toggletag(6))
oxwm.key.bind({ modkey, "Control", "Shift" }, "8", oxwm.tag.toggletag(7))
oxwm.key.bind({ modkey, "Control", "Shift" }, "9", oxwm.tag.toggletag(8))

--- Advanced: Keychords ---
oxwm.key.chord({
  { { modkey }, "Space" },
  { {},         "T" }
}, oxwm.spawn_terminal())

--- Autostart ---
oxwm.autostart("picom")
oxwm.autostart("feh --bg-scale ~/dotfiles/wallpapers/wall-1.png")
oxwm.autostart("dunst")
