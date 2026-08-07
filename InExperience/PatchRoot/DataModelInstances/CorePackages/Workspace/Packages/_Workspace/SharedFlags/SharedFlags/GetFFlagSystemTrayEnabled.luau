game:DefineFastFlag("SystemTrayDeviceSettings2", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("EnableSystemTray") and game:GetFastFlag("SystemTrayDeviceSettings2")
end