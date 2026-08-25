local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(require(purchasePrompt.Enums.ButtonState).Enabled, {
	[require(purchasePrompt.Actions.SetButtonState).name] = function(_, p0)
		return p0.state
	end
})