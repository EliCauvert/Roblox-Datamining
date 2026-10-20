game:DefineFastFlag("EnableCrossExpVoiceMemoryCheck", false)

return function()
	return game:GetEngineFeature("PerformanceControlService") and game:GetFastFlag("EnableCrossExpVoiceMemoryCheck")
end