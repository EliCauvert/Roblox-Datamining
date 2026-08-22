game:DefineFastFlag("EnableMomentTextGeneration3", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("EnableMomentTextGeneration3") and game:GetEngineFeature("CaptureServiceGenerateMomentText")
end