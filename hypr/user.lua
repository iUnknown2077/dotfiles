--- Env ---
hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")

--- Execs ---
hl.on("hyprland.start", function()
	hl.exec_cmd("protonvpn-app")
	hl.exec_cmd("pika-backup-monitor")
	hl.exec_cmd("sleep 3 && shelly-notifications")
end)

--- General ---
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
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("kitty", { float = true, center = true, size = { 900, 600 } })) -- Floating terminal
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
hl.window_rule({ match = { class = "^(proton.vpn.app.gtk)$" }, workspace = "special silent" })
hl.window_rule({ match = { class = "^([Ss]ignal)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^([Vv]esktop)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(org.vinegarhq.Sober)$" }, workspace = "9 silent" })
hl.window_rule({ match = { class = "^(pavucontrol-qt)$" }, float = true, center = true, size = { 1280, 800 } })
