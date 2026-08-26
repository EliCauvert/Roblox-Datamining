local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(nil, {
	[require(purchasePrompt.Actions.SetRobloxSubscriptionProducts).name] = function(_, p1)
		return p1.robloxSubscriptionProducts
	end
})