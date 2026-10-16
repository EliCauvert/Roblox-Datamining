local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(require(PurchasePrompt.Enums.ButtonState).Enabled, {
	[require(PurchasePrompt.Actions.SetButtonState).name] = function(_, p1) --[[ Line: 11 ]]
		return p1.state
	end
})