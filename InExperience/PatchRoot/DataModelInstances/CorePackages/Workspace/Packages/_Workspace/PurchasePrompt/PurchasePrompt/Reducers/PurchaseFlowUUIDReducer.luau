local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer("", {
	[require(purchasePrompt.Actions.SetPurchaseFlowUUID).name] = function(_, p1)
		return p1.purchaseFlowUUID
	end
})