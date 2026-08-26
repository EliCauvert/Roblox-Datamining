local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local promptStateModule = require(purchasePrompt.Enums.PromptState)

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(promptStateModule.None, {
	[require(purchasePrompt.Actions.SetPromptState).name] = function(_, p1)
		return p1.promptState
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		-- upvalues: promptStateModule (ref)
		return promptStateModule.None
	end,
	[require(purchasePrompt.Actions.ErrorOccurred).name] = function(_, _)
		-- upvalues: promptStateModule (ref)
		return promptStateModule.Error
	end,
	[require(purchasePrompt.Actions.StartPurchase).name] = function(_, _)
		-- upvalues: promptStateModule (ref)
		return promptStateModule.PurchaseInProgress
	end,
	[require(purchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, _)
		-- upvalues: promptStateModule (ref)
		return promptStateModule.RobuxUpsell
	end
})