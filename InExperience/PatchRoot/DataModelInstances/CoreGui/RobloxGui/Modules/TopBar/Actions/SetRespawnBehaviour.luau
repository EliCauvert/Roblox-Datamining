return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(RespawnEnabled, CustomCallback) --[[ Line: 5 ]]
	return {
		respawnEnabled = RespawnEnabled,
		customCallback = CustomCallback
	}
end)