local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, p0)
		return {
			products = p0.products,
			selection = p0.selection,
			virtualItemBadgeType = p0.virtualItemBadgeType
		}
	end
})