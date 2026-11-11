return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_RESPAWN_BEHAVIOR", function(RespawnEnabled, CustomCallback)
	return {
		respawnEnabled = RespawnEnabled,
		customCallback = CustomCallback
	}
end)