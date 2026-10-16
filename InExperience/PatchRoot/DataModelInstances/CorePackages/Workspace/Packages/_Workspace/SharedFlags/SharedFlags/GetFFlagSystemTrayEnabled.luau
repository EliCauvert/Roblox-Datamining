game:DefineFastFlag("SystemTrayDeviceSettings2", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("EnableSystemTray") and game:GetFastFlag("SystemTrayDeviceSettings2")
end