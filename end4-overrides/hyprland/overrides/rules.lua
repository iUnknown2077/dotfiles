-- Transparency and blur
--hl.window_rule({ match = { class = ".*" }, opacity = "0.89 override 0.89 override" })
--hl.window_rule({ match = { class = ".*" }, no_blur = false })

-- Apps
hl.window_rule({ match = { class = "^(proton.vpn.app.gtk)$" }, workspace = "special silent" })
hl.window_rule({ match = { class = "^([Ss]ignal)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^([Vv]esktop)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(org.vinegarhq.Sober)$" }, workspace = "9 silent" })
