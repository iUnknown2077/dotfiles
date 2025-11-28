-- Variables
local colors = require("colors");

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

-- Color Scheme
oxwm.bar.set_scheme_normal(colors.fg, colors.bg, "#444444")
oxwm.bar.set_scheme_occupied(colors.fg, colors.bg, colors.bgh)
oxwm.bar.set_scheme_selected(colors.accent1, colors.bg, colors.bgh)
