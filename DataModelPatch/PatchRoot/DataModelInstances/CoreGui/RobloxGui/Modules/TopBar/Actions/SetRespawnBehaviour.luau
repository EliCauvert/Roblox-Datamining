return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(RespawnEnabled, CustomCallback)
	return {
		respawnEnabled = RespawnEnabled,
		customCallback = CustomCallback
	}
end)