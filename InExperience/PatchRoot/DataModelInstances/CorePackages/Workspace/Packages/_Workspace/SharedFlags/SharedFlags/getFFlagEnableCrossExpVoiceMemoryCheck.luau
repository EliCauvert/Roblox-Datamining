game:DefineFastFlag("EnableCrossExpVoiceMemoryCheck", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("PerformanceControlService") and game:GetFastFlag("EnableCrossExpVoiceMemoryCheck")
end