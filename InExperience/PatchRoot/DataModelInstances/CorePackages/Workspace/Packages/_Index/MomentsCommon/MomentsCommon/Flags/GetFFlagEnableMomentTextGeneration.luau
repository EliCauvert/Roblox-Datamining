game:DefineFastFlag("EnableMomentTextGeneration3", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("EnableMomentTextGeneration3") and game:GetEngineFeature("CaptureServiceGenerateMomentText")
end