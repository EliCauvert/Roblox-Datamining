local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(false, {
	[require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow).name] = function(_, p0) --[[ line: 10 ]]
		return p0.isUserEligibleForUnifiedPurchaseFlow
	end
})