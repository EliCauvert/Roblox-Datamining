local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.SetProduct).name] = function(_, p1)
		return {
			id = p1.id,
			infoType = p1.infoType,
			equipIfPurchased = p1.equipIfPurchased
		}
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
}))