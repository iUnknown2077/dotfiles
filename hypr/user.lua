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

-- Workspace 4, Messaging
hl.window_rule({
	match = { class = "^([Ss]ignal|[Vv]esktop)$" },
	workspace = "4 silent",
})

-- Workspace 5, Game launchers
hl.window_rule({
	match = { class = "^([Ss]team|[Hh]eroic|net.lutris.Lutris|io.github.Faugus.faugus-launcher)$" },
	workspace = "5",
	no_blur = true,
	no_shadow = true,
	opaque = true,
	idle_inhibit = "fullscreen",
	immediate = true,
})

-- Workspace 6, Games
hl.window_rule({
	match = { class = "^(steam_app.*|gamescope)$" },
	workspace = "6",
	no_blur = true,
	no_shadow = true,
	opaque = true,
	idle_inhibit = "fullscreen",
	immediate = true,
})

-- Workspace 7, Virtualization
hl.window_rule({
	match = { class = "^(virt-manager|winboat)$" },
	workspace = "7",
})

-- Workspace 8, VMs / remote desktops
hl.window_rule({
	match = { title = "^(.*QEMU/KVM.*|.*FreeRDP.*)$" },
	workspace = "8",
	float = true,
	center = true,
	size = { 1600, 900 },
})

-- Workspace 9, Roblox
hl.window_rule({
	match = { class = "^(org.vinegarhq.Sober)$" },
	workspace = "9 silent",
})

-- Workspace Special, Proton VPN
hl.window_rule({
	match = { class = "^(proton.vpn.app.gtk)$" },
	workspace = "special silent",
})

-- Floating, File manager
hl.window_rule({
	match = { class = "^(org.kde.dolphin)$" },
	float = true,
	center = true,
	size = { 1500, 850 },
})

-- Floating, Volume control
hl.window_rule({
	match = { class = "^(pavucontrol-qt)$" },
	float = true,
	center = true,
	size = { 1280, 800 },
})

-- Floating, Steam settings & friends list
hl.window_rule({
	match = { title = "^(Ustawienia Steam|Lista znajomych)$" },
	float = true,
	center = true,
})
