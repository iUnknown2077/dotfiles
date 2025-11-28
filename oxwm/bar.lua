-- Variables
local colors = require("colors");
local font = "Maple Mono NF:style=Bold:size=10"
local tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9", }

-- Basic Settings
oxwm.set_tags(tags)

-- Bar configuration
oxwm.bar.set_font(font)

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
