local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetProduct).name] = function(_, p0) --[[ line: 11 ]]
		return {
			id = p0.id,
			infoType = p0.infoType,
			equipIfPurchased = p0.equipIfPurchased
		}
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ line: 18 ]]
		return {}
	end
})