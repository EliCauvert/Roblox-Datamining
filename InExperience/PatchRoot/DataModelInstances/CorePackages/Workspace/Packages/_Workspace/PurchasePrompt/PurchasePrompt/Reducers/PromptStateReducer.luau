local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(PromptStateModule.None, {
	[require(PurchasePrompt.Actions.SetPromptState).name] = function(_, p1)
		return p1.promptState
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.None
	end,
	[require(PurchasePrompt.Actions.ErrorOccurred).name] = function(_, _)
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.Error
	end,
	[require(PurchasePrompt.Actions.StartPurchase).name] = function(_, _)
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.PurchaseInProgress
	end,
	[require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, _)
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.RobuxUpsell
	end
}))