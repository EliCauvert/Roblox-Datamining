local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(false, {
	[require(PurchasePrompt.Actions.PurchaseCompleteRecieved).name] = function(_, _): boolean
		return true
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _): boolean
		return false
	end
})