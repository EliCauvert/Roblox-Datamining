game:DefineFastFlag("EnableCrossExpVoiceMemoryCheck", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("PerformanceControlService") and game:GetFastFlag("EnableCrossExpVoiceMemoryCheck")
end