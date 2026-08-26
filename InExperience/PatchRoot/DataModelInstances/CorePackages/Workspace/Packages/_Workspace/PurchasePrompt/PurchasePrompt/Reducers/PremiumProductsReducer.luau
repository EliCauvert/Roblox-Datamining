local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.PremiumInfoRecieved).name] = function(_, p1)
		return p1.premiumInfo
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
})