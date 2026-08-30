hl.on("hyprland.start", function()
	-- Daemons
	hl.exec_cmd("sleep 3 && protonvpn-app")
	hl.exec_cmd("sleep 3 && pika-backup-monitor")
	hl.exec_cmd("sleep 3 && cachy-update --tray")

	-- Apps
end)
