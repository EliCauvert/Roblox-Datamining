local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer("", {
	[require(purchasePrompt.Actions.SetPurchaseFlowUUID).name] = function(_, p0)
		return p0.purchaseFlowUUID
	end
})