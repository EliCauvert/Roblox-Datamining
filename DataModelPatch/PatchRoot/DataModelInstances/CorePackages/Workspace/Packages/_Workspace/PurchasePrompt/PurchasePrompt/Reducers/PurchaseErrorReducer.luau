local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.ErrorOccurred).name] = function(_, p1)
		return p1.purchaseError
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
})