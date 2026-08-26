local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(false, {
	[require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow).name] = function(_, p1)
		return p1.isUserEligibleForUnifiedPurchaseFlow
	end
})