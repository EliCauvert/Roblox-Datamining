local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.PremiumInfoRecieved).name] = function(_, p0) --[[ line: 11 ]]
		return p0.premiumInfo
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ line: 14 ]]
		return {}
	end
})