game:DefineFastFlag("HideLaunchAtStartupMac", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("HideLaunchAtStartupMac") and game:GetFastFlag("HideLaunchAtStartupMac")
end