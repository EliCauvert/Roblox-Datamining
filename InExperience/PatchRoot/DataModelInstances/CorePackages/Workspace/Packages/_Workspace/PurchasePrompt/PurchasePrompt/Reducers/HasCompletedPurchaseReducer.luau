local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(false, {
	[require(purchasePrompt.Actions.PurchaseCompleteRecieved).name] = function(_, _) --[[ line: 10 ]]
		return true
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ line: 13 ]]
		return false
	end
})