game:DefineFastFlag("EnableMomentTextGeneration2", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("EnableMomentTextGeneration2") and game:GetEngineFeature("CaptureServiceGenerateMomentText")
end