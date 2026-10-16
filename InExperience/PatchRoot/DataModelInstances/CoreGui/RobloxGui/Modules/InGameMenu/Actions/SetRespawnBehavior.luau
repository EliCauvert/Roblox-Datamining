return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_RESPAWN_BEHAVIOR", function(RespawnEnabled, CustomCallback) --[[ Line: 5 ]]
	return {
		respawnEnabled = RespawnEnabled,
		customCallback = CustomCallback
	}
end)