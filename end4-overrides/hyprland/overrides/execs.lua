hl.on("hyprland.start", function()
	-- Daemons
	hl.exec_cmd("sleep 2 && protonvpn-app")
	hl.exec_cmd("sleep 2 && pika-backup-monitor")
	hl.exec_cmd("sleep 4 && cachy-update --tray")

	-- Apps
end)
