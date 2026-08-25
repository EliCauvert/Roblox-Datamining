local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.PremiumInfoRecieved).name] = function(_, p0)
		return p0.premiumInfo
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
})