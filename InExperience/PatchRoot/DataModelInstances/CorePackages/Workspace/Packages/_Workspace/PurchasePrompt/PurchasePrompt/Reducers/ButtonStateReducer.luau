local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(require(purchasePrompt.Enums.ButtonState).Enabled, {
	[require(purchasePrompt.Actions.SetButtonState).name] = function(_, p1)
		return p1.state
	end
})