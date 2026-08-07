local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.ErrorOccurred).name] = function(_, p0) --[[ line: 12 ]]
		return p0.purchaseError
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ line: 15 ]]
		return {}
	end
})