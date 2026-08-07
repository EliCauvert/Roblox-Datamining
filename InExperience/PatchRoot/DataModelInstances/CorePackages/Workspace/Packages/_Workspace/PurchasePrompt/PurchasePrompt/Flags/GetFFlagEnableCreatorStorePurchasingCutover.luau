game:DefineFastFlag("EnableCreatorStorePurchasingCutover", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("EnableCreatorStorePurchasingCutover") and game:GetEngineFeature("EnableCreatorStorePurchasing")
end