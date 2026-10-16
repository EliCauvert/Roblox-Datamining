local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local CounterModule = require(PurchasePrompt.Enums.Counter)
local SendCounterModule = require(PurchasePrompt.Thunks.sendCounter)
local ThunkModule = require(PurchasePrompt.Thunk)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local list = {
	require(PurchasePrompt.Services.Analytics),
	require(PurchasePrompt.Services.Network),
	(require(PurchasePrompt.Services.ExternalSettings))
}

return function() --[[ Line: 21 | Named "handleNativePurchaseFailureOrCancel" ]]
	-- upvalues: ThunkModule (copy), list (copy), PromptStateModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), SendCounterModule (copy), CounterModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, _) --[[ Line: 22 ]]
		-- upvalues: PromptStateModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), SendCounterModule (upval), CounterModule (upval)
		if p1:getState().promptState ~= PromptStateModule.BlackbirdUpsellInProgress then
			p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.InvalidFundsUnknown))
			p1:dispatch(SendCounterModule(CounterModule.UpsellFailedNativePurchase))
			
			return
		end
	end)
end