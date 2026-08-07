local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local rodux = require(purchasePrompt.Parent.PurchasePromptDeps).Rodux
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local startPurchaseModule = require(purchasePrompt.Actions.StartPurchase)
local promptNativeUpsellSuggestionsModule = require(purchasePrompt.Actions.PromptNativeUpsellSuggestions)
local setWindowStateModule = require(purchasePrompt.Actions.SetWindowState)
local windowStateModule = require(purchasePrompt.Enums.WindowState)
local promptStateModule = require(purchasePrompt.Enums.PromptState)

return rodux.createReducer(windowStateModule.Hidden, {
	[setPromptStateModule.name] = function(_, p0) --[[ line: 18 ]]
		-- upvalues: promptStateModule (ref), windowStateModule (ref)
		return if p0.promptState == promptStateModule.None then windowStateModule.Hidden else windowStateModule.Shown
	end,
	[setWindowStateModule.name] = function(_, p1) --[[ line: 25 ]]
		return p1.state
	end,
	[errorOccurredModule.name] = function(_, _) --[[ line: 28 ]]
		-- upvalues: windowStateModule (ref)
		return windowStateModule.Shown
	end,
	[startPurchaseModule.name] = function(_, _) --[[ line: 31 ]]
		-- upvalues: windowStateModule (ref)
		return windowStateModule.Shown
	end,
	[promptNativeUpsellSuggestionsModule.name] = function(_, _) --[[ line: 34 ]]
		-- upvalues: windowStateModule (ref)
		return windowStateModule.Shown
	end,
	[completeRequestModule.name] = function(_, _) --[[ line: 37 ]]
		-- upvalues: windowStateModule (ref)
		return windowStateModule.Hidden
	end
})