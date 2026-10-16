local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(nil, {
	[require(PurchasePrompt.Actions.SetRobloxSubscriptionProducts).name] = function(_, p1) --[[ Line: 10 ]]
		return p1.robloxSubscriptionProducts
	end
}))