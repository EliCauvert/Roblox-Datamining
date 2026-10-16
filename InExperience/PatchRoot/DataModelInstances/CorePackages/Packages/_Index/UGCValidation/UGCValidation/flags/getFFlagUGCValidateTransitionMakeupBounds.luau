game:DefineFastFlag("UGCValidateTransitionMakeupBounds", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("EngineUGCValidationUseFIntsInUVMinMaxBounds") and game:GetFastFlag("UGCValidateTransitionMakeupBounds")
end