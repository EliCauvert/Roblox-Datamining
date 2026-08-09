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

return connectToStoreModule(nil, function(p1) --[[ line: 51 | named "mapDispatchToProps" ]]
	-- upvalues: retryAfterUpsellModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), handleNativePurchaseFailureOrCancelModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), sendCounterModule (ref), counterModule (ref)
	return {
		nativePurchaseFinished = function(_, _, p2) --[[ line: 53 ]]
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
		nativePurchaseFinishedWithLocalPlayer = function(_, p3) --[[ line: 65 ]]
			-- upvalues: p1 (ref), retryAfterUpsellModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), handleNativePurchaseFailureOrCancelModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy)
			if p3 then
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
end)(function(p0) --[[ line: 28 | named "NativePurchaseFinishedConnector" ]]
	-- upvalues: roact (ref), externalEventConnectionModule (ref), marketplaceService (ref)
	local nativePurchaseFinished = p0.nativePurchaseFinished
	
	return if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then roact.createFragment({
		NativePurchase = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinished,
			callback = nativePurchaseFinished
		}),
		NativePurchaseWithLocalPlayer = roact.createElement(externalEventConnectionModule, {
			event = marketplaceService.NativePurchaseFinishedWithLocalPlayer,
			callback = p0.nativePurchaseFinishedWithLocalPlayer
		})
	}) else roact.createElement(externalEventConnectionModule, {
		event = marketplaceService.NativePurchaseFinished,
		callback = nativePurchaseFinished
	})
end)