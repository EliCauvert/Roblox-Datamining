game:DefineFastFlag("HideLaunchAtStartupMac", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("HideLaunchAtStartupMac") and game:GetFastFlag("HideLaunchAtStartupMac")
end