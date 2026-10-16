local marketplaceService = game:GetService("MarketplaceService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local roact = require(purchasePrompt.Parent.PurchasePromptDeps).Roact
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local retryAfterUpsellModule = require(purchasePrompt.Thunks.retryAfterUpsell)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local counterModule = require(purchasePrompt.Enums.Counter)
local sendCounterModule = require(purchasePrompt.Thunks.sendCounter)
local handleNativePurchaseFailureOrCancelModule = require(purchasePrompt.Thunks.handleNativePurchaseFailureOrCancel)
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local fFlagLuaAppEnableNativePurchaseFinishedV2Signals = require(purchasePrompt.Parent.SharedFlags).FFlagLuaAppEnableNativePurchaseFinishedV2Signals

return connectToStoreModule(nil, function(p1)
	-- upvalues: retryAfterUpsellModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), handleNativePurchaseFailureOrCancelModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), sendCounterModule (ref), counterModule (ref)
	return {
		nativePurchaseFinished = function(_, _, p2, _)
			-- upvalues: p1 (ref), retryAfterUpsellModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), handleNativePurchaseFailureOrCancelModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy)
			if p2 then
				p1(retryAfterUpsellModule())
				
				return
			elseif fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				p1(handleNativePurchaseFailureOrCancelModule())
				
				return
			end
			p1(errorOccurredModule(purchaseErrorModule.InvalidFundsUnknown))
			p1(sendCounterModule(counterModule.UpsellFailedNativePurchase))
		end,
		nativePurchaseFinishedWithLocalPlayer = function(_, p2, _)
			-- upvalues: p1 (ref), retryAfterUpsellModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), handleNativePurchaseFailureOrCancelModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy)
			if p2 then
				p1(retryAfterUpsellModule())
				
				return
			elseif fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				p1(handleNativePurchaseFailureOrCancelModule())
				
				return
			end
			p1(errorOccurredModule(purchaseErrorModule.InvalidFundsUnknown))
			p1(sendCounterModule(counterModule.UpsellFailedNativePurchase))
		end
	}
end)(function(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), marketplaceService (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (ref)
	local nativePurchaseFinished = p1.nativePurchaseFinished
	local nativePurchaseFinishedWithLocalPlayer = p1.nativePurchaseFinishedWithLocalPlayer
	
	return if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then roact.createFragment({
		NativePurchase = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinished,
			callback = nativePurchaseFinished
		}),
		NativePurchaseWithLocalPlayer = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinishedWithLocalPlayer,
			callback = nativePurchaseFinishedWithLocalPlayer
		}),
		NativePurchaseV2 = if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinishedV2,
			callback = nativePurchaseFinished
		}) else nil,
		NativePurchaseWithLocalPlayerV2 = if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinishedWithLocalPlayerV2,
			callback = nativePurchaseFinishedWithLocalPlayer
		}) else nil
	}) elseif fFlagLuaAppEnableNativePurchaseFinishedV2Signals then roact.createFragment({
		NativePurchase = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinished,
			callback = nativePurchaseFinished
		}),
		NativePurchaseV2 = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinishedV2,
			callback = nativePurchaseFinished
		})
	}) else roact.createElement(externalEventConnectionModule, {
		event = marketplaceService.NativePurchaseFinished,
		callback = nativePurchaseFinished
	})
end)