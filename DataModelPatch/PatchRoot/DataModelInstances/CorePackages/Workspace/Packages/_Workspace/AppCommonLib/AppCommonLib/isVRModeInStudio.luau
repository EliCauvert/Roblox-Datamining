game:DefineFastFlag("DebugVRModeInStudio", false)

return function()
	return game:GetFastFlag("DebugVRModeInStudio") and UserSettings().GameSettings:InStudioMode()
end