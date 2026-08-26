local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.ErrorOccurred).name] = function(_, p1)
		return p1.purchaseError
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
})