local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local WindowStateModule = require(PurchasePrompt.Enums.WindowState)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(WindowStateModule.Hidden, {
	[require(PurchasePrompt.Actions.SetPromptState).name] = function(_, p1)
		-- upvalues: PromptStateModule (copy), WindowStateModule (copy)
		return if p1.promptState == PromptStateModule.None then WindowStateModule.Hidden else WindowStateModule.Shown
	end,
	[require(PurchasePrompt.Actions.SetWindowState).name] = function(_, p1)
		return p1.state
	end,
	[require(PurchasePrompt.Actions.ErrorOccurred).name] = function(_, _)
		-- upvalues: WindowStateModule (copy)
		return WindowStateModule.Shown
	end,
	[require(PurchasePrompt.Actions.StartPurchase).name] = function(_, _)
		-- upvalues: WindowStateModule (copy)
		return WindowStateModule.Shown
	end,
	[require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, _)
		-- upvalues: WindowStateModule (copy)
		return WindowStateModule.Shown
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		-- upvalues: WindowStateModule (copy)
		return WindowStateModule.Hidden
	end
})