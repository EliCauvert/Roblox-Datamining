game:DefineFastFlag("DisablePurchasePromptFunctionForMaquettes", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("DisablePurchasePromptFunctionForMaquettes") or not game:GetEngineFeature("MaquettesPurchaseFeature")
end