local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, p1) --[[ Line: 9 ]]
		return {
			products = p1.products,
			selection = p1.selection,
			virtualItemBadgeType = p1.virtualItemBadgeType,
			experimentVariant = p1.experimentVariant
		}
	end
})