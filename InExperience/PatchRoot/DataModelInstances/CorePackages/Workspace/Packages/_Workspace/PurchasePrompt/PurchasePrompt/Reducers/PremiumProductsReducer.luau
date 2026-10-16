local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.PremiumInfoRecieved).name] = function(_, p1) --[[ Line: 11 ]]
		return p1.premiumInfo
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ Line: 14 ]]
		return {}
	end
}))