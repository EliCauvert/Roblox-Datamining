game:DefineFastFlag("EnableCreatorStorePurchasingCutover", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("EnableCreatorStorePurchasingCutover") and game:GetEngineFeature("EnableCreatorStorePurchasing")
end