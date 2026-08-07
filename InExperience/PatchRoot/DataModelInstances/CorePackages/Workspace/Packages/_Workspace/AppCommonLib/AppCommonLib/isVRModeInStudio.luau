game:DefineFastFlag("DebugVRModeInStudio", false)

return function() --[[ line: 4 | named "isVRModeInStudio" ]]
	return game:GetFastFlag("DebugVRModeInStudio") and UserSettings().GameSettings:InStudioMode()
end