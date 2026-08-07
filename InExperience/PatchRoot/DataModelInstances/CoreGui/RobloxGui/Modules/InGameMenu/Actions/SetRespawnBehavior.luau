return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_RESPAWN_BEHAVIOR", function(p0, p1) --[[ line: 5 ]]
	return { respawnEnabled = p0, customCallback = p1 }
end)