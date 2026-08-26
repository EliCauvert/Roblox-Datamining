local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetEconomicRestrictionError).name] = function(_, p1)
		return {
			timeoutMinutes = p1.timeoutMinutes,
			violationType = p1.violationType
		}
	end
})