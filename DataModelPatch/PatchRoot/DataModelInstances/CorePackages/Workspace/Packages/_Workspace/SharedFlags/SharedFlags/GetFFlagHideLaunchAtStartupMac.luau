game:DefineFastFlag("HideLaunchAtStartupMac", false)

return function()
	return game:GetEngineFeature("HideLaunchAtStartupMac") and game:GetFastFlag("HideLaunchAtStartupMac")
end