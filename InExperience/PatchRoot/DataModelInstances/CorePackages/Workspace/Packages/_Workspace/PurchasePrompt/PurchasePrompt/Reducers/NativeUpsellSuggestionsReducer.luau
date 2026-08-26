local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, p1)
		return {
			products = p1.products,
			selection = p1.selection,
			virtualItemBadgeType = p1.virtualItemBadgeType
		}
	end
})