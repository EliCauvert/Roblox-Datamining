local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, p1)
		return {
			products = p1.products,
			selection = p1.selection,
			virtualItemBadgeType = p1.virtualItemBadgeType
		}
	end
})