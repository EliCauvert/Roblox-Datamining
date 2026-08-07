local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local promptStateModule = require(purchasePrompt.Enums.PromptState)

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(promptStateModule.None, {
	[require(purchasePrompt.Actions.SetPromptState).name] = function(_, p0) --[[ line: 14 ]]
		return p0.promptState
	end,
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _) --[[ line: 17 ]]
		-- upvalues: promptStateModule (ref)
		return promptStateModule.None
	end,
	[require(purchasePrompt.Actions.ErrorOccurred).name] = function(_, _) --[[ line: 20 ]]
		-- upvalues: promptStateModule (ref)
		return promptStateModule.Error
	end,
	[require(purchasePrompt.Actions.StartPurchase).name] = function(_, _) --[[ line: 23 ]]
		-- upvalues: promptStateModule (ref)
		return promptStateModule.PurchaseInProgress
	end,
	[require(purchasePrompt.Actions.PromptNativeUpsellSuggestions).name] = function(_, _) --[[ line: 26 ]]
		-- upvalues: promptStateModule (ref)
		return promptStateModule.RobuxUpsell
	end
})