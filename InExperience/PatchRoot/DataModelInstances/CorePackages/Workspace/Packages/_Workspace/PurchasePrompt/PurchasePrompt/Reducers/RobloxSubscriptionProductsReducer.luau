local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(nil, {
	[require(purchasePrompt.Actions.SetRobloxSubscriptionProducts).name] = function(_, p0) --[[ line: 10 ]]
		return p0.robloxSubscriptionProducts
	end
})