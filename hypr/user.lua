--- Env ---
-- Editor
hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")

--- Execs ---
hl.on("hyprland.start", function()
	-- Daemons
	hl.exec_cmd("protonvpn-app")
	hl.exec_cmd("pika-backup-monitor")
	hl.exec_cmd("sleep 3 && shelly-notifications")

	-- Apps
end)

--- General ---
-- Input
hl.config({
	input = {
		kb_layout = "pl",
		kb_options = "compose:caps",
		numlock_by_default = true,
		repeat_delay = 250,
		repeat_rate = 35,

		follow_mouse = 1,
		off_window_axis_events = 2,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
			scroll_factor = 0.7,
		},
	},
})

--- Keybinds ---
-- Apps
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("~/.config/fish/scripts/small-kitty.fish")) -- Small floating kitty
hl.unbind("SUPER + E")
hl.bind("SUPER + E", hl.dsp.exec_cmd("kitty -1 fish -c yazi")) -- File manager
hl.unbind("SUPER + W")
hl.bind("SUPER + W", hl.dsp.exec_cmd("firefox")) -- Browser
hl.unbind("SUPER + C")
hl.bind("SUPER + C", hl.dsp.exec_cmd("kitty -1 fish -c nvim")) -- Code editor
hl.unbind("SUPER + X")
hl.bind("SUPER + X", hl.dsp.exec_cmd("obsidian -disable-gpu --enable-wayland-ime")) -- Text editor
hl.unbind("CTRL + SHIFT + ESCAPE")
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty -1 fish -c btop")) -- Task manager

--- Rules ---
-- Transparency and blur
--hl.window_rule({ match = { class = ".*" }, opacity = "0.89 override 0.89 override" })
--hl.window_rule({ match = { class = ".*" }, no_blur = false })

-- Apps
hl.window_rule({ match = { class = "^(proton.vpn.app.gtk)$" }, workspace = "special silent" })
hl.window_rule({ match = { class = "^([Ss]ignal)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^([Vv]esktop)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(org.vinegarhq.Sober)$" }, workspace = "9 silent" })
