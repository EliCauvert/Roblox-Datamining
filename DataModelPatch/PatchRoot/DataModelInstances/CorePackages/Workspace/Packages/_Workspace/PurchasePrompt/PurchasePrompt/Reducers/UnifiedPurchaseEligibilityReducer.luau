local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(false, {
	[require(PurchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow).name] = function(_, p1)
		return p1.isUserEligibleForUnifiedPurchaseFlow
	end
}))