game:DefineFastFlag("SystemTrayDeviceSettings2", false)

return function()
	return game:GetEngineFeature("EnableSystemTray") and game:GetFastFlag("SystemTrayDeviceSettings2")
end