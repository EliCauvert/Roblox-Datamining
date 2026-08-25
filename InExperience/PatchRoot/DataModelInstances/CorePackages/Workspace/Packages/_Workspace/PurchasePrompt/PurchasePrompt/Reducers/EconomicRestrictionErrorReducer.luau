local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetEconomicRestrictionError).name] = function(_, p0)
		return {
			timeoutMinutes = p0.timeoutMinutes,
			violationType = p0.violationType
		}
	end
})