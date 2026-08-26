local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetProduct).name] = function(_, p1)
		return {
			id = p1.id,
			infoType = p1.infoType,
			equipIfPurchased = p1.equipIfPurchased
		}
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
})