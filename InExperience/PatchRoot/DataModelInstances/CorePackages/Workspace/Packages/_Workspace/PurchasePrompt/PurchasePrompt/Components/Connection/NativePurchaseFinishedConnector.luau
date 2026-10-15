local marketplaceService = game:GetService("MarketplaceService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local roact = require(purchasePrompt.Parent.PurchasePromptDeps).Roact
local retryAfterUpsellModule = require(purchasePrompt.Thunks.retryAfterUpsell)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local handleNativePurchaseFailureOrCancelModule = require(purchasePrompt.Thunks.handleNativePurchaseFailureOrCancel)
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local fFlagLuaAppEnableNativePurchaseFinishedV2Signals = require(purchasePrompt.Parent.SharedFlags).FFlagLuaAppEnableNativePurchaseFinishedV2Signals

return connectToStoreModule(nil, function(p1)
	-- upvalues: retryAfterUpsellModule (ref), handleNativePurchaseFailureOrCancelModule (ref)
	return {
		nativePurchaseFinished = function(_, _, p2, _)
			-- upvalues: p1 (ref), retryAfterUpsellModule (copy), handleNativePurchaseFailureOrCancelModule (copy)
			if p2 then
				p1(retryAfterUpsellModule())
				
				return
			end
			p1(handleNativePurchaseFailureOrCancelModule())
		end,
		nativePurchaseFinishedWithLocalPlayer = function(_, p2, _)
			-- upvalues: p1 (ref), retryAfterUpsellModule (copy), handleNativePurchaseFailureOrCancelModule (copy)
			if p2 then
				p1(retryAfterUpsellModule())
				
				return
			end
			p1(handleNativePurchaseFailureOrCancelModule())
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