local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(nil, {
	[require(purchasePrompt.Actions.SetRobloxSubscriptionProducts).name] = function(_, p0)
		return p0.robloxSubscriptionProducts
	end
})