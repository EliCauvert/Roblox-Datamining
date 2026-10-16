local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(PromptStateModule.None, {
	[require(PurchasePrompt.Actions.SetPromptState).name] = function(_, p1) --[[ Line: 14 ]]
		return p1.promptState
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ Line: 17 ]]
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.None
	end,
	[require(PurchasePrompt.Actions.ErrorOccurred).name] = function(_, _) --[[ Line: 20 ]]
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.Error
	end,
	[require(PurchasePrompt.Actions.StartPurchase).name] = function(_, _) --[[ Line: 23 ]]
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.PurchaseInProgress
	end,
	[require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, _) --[[ Line: 26 ]]
		-- upvalues: PromptStateModule (copy)
		return PromptStateModule.RobuxUpsell
	end
}))