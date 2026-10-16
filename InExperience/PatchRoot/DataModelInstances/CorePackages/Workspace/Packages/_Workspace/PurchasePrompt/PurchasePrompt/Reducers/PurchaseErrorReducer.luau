local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.ErrorOccurred).name] = function(_, p1) --[[ Line: 12 ]]
		return p1.purchaseError
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ Line: 15 ]]
		return {}
	end
})