local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer("", {
	[require(PurchasePrompt.Actions.SetPurchaseFlowUUID).name] = function(_, p1) --[[ Line: 10 ]]
		return p1.purchaseFlowUUID
	end
}))