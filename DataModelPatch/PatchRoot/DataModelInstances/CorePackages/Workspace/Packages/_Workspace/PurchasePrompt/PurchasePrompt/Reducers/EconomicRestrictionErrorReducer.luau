local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.SetEconomicRestrictionError).name] = function(_, p1)
		return {
			timeoutMinutes = p1.timeoutMinutes,
			violationType = p1.violationType
		}
	end
})