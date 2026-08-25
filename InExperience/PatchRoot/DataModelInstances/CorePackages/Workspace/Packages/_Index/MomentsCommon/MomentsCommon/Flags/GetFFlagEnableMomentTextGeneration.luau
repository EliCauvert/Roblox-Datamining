game:DefineFastFlag("EnableMomentTextGeneration3", false)

return function()
	return game:GetFastFlag("EnableMomentTextGeneration3") and game:GetEngineFeature("CaptureServiceGenerateMomentText")
end