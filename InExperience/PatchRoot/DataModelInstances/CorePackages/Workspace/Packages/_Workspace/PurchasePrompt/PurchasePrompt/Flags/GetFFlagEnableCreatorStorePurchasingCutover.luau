game:DefineFastFlag("EnableCreatorStorePurchasingCutover", false)

return function()
	return game:GetFastFlag("EnableCreatorStorePurchasingCutover") and game:GetEngineFeature("EnableCreatorStorePurchasing")
end