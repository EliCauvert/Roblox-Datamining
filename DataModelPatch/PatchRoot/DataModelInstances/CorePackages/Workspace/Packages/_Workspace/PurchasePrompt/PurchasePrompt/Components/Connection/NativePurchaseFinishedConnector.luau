local MarketplaceService = game:GetService("MarketplaceService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Roact = require(PurchasePrompt.Parent.PurchasePromptDeps).Roact
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local RetryAfterUpsellModule = require(PurchasePrompt.Thunks.retryAfterUpsell)
local CounterModule = require(PurchasePrompt.Enums.Counter)
local SendCounterModule = require(PurchasePrompt.Thunks.sendCounter)
local HandleNativePurchaseFailureOrCancelModule = require(PurchasePrompt.Thunks.handleNativePurchaseFailureOrCancel)
local ExternalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal

return (require(PurchasePrompt.connectToStore)(nil, function(Callback)
	-- upvalues: RetryAfterUpsellModule (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), HandleNativePurchaseFailureOrCancelModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), SendCounterModule (copy), CounterModule (copy)
	return {
		nativePurchaseFinished = function(_, _, p1)
			-- upvalues: Callback (copy), RetryAfterUpsellModule (upval), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), HandleNativePurchaseFailureOrCancelModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), SendCounterModule (upval), CounterModule (upval)
			if p1 then
				Callback(RetryAfterUpsellModule())
				
				return
			end
			if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				Callback(HandleNativePurchaseFailureOrCancelModule())
				
				return
			else
				Callback(ErrorOccurredModule(PurchaseErrorModule.InvalidFundsUnknown))
				Callback(SendCounterModule(CounterModule.UpsellFailedNativePurchase))
			end
		end,
		nativePurchaseFinishedWithLocalPlayer = function(_, p1)
			-- upvalues: Callback (copy), RetryAfterUpsellModule (upval), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), HandleNativePurchaseFailureOrCancelModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), SendCounterModule (upval), CounterModule (upval)
			if p1 then
				Callback(RetryAfterUpsellModule())
				
				return
			end
			if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				Callback(HandleNativePurchaseFailureOrCancelModule())
				
				return
			else
				Callback(ErrorOccurredModule(PurchaseErrorModule.InvalidFundsUnknown))
				Callback(SendCounterModule(CounterModule.UpsellFailedNativePurchase))
			end
		end
	}
end)(function(p1)
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), MarketplaceService (copy)
	local NativePurchaseFinished = p1.nativePurchaseFinished
	local NativePurchaseFinishedWithLocalPlayer = p1.nativePurchaseFinishedWithLocalPlayer
	
	return if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then Roact.createFragment({
		NativePurchase = Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinished,
			callback = NativePurchaseFinished
		}),
		NativePurchaseWithLocalPlayer = Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinishedWithLocalPlayer,
			callback = NativePurchaseFinishedWithLocalPlayer
		})
	}) else Roact.createElement(ExternalEventConnectionModule, {
		event = MarketplaceService.NativePurchaseFinished,
		callback = NativePurchaseFinished
	})
end))