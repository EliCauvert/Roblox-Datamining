game:DefineFastFlag("DisablePurchasePromptFunctionForMaquettes", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("DisablePurchasePromptFunctionForMaquettes") or not game:GetEngineFeature("MaquettesPurchaseFeature")
end