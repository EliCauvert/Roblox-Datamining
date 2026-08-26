return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_RESPAWN_BEHAVIOR", function(p1, p2)
	return { respawnEnabled = p1, customCallback = p2 }
end)