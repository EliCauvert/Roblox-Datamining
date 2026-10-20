local MarketplaceService = game:GetService("MarketplaceService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Roact = require(PurchasePrompt.Parent.PurchasePromptDeps).Roact
local RetryAfterUpsellModule = require(PurchasePrompt.Thunks.retryAfterUpsell)
local HandleNativePurchaseFailureOrCancelModule = require(PurchasePrompt.Thunks.handleNativePurchaseFailureOrCancel)
local ExternalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local FFlagLuaAppEnableNativePurchaseFinishedV2Signals = require(PurchasePrompt.Parent.SharedFlags).FFlagLuaAppEnableNativePurchaseFinishedV2Signals

return (require(PurchasePrompt.connectToStore)(nil, function(Callback)
	-- upvalues: RetryAfterUpsellModule (copy), HandleNativePurchaseFailureOrCancelModule (copy)
	return {
		nativePurchaseFinished = function(_, _, p1, _)
			-- upvalues: Callback (copy), RetryAfterUpsellModule (upval), HandleNativePurchaseFailureOrCancelModule (upval)
			if p1 then
				Callback(RetryAfterUpsellModule())
				
				return
			else
				Callback(HandleNativePurchaseFailureOrCancelModule())
			end
		end,
		nativePurchaseFinishedWithLocalPlayer = function(_, p1, _)
			-- upvalues: Callback (copy), RetryAfterUpsellModule (upval), HandleNativePurchaseFailureOrCancelModule (upval)
			if p1 then
				Callback(RetryAfterUpsellModule())
				
				return
			else
				Callback(HandleNativePurchaseFailureOrCancelModule())
			end
		end
	}
end)(function(p1)
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), MarketplaceService (copy), FFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy)
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
		}),
		NativePurchaseV2 = if FFlagLuaAppEnableNativePurchaseFinishedV2Signals then Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinishedV2,
			callback = NativePurchaseFinished
		}) else nil,
		NativePurchaseWithLocalPlayerV2 = if FFlagLuaAppEnableNativePurchaseFinishedV2Signals then Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinishedWithLocalPlayerV2,
			callback = NativePurchaseFinishedWithLocalPlayer
		}) else nil
	}) elseif FFlagLuaAppEnableNativePurchaseFinishedV2Signals then Roact.createFragment({
		NativePurchase = Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinished,
			callback = NativePurchaseFinished
		}),
		NativePurchaseV2 = Roact.createElement(ExternalEventConnectionModule, {
			event = MarketplaceService.NativePurchaseFinishedV2,
			callback = NativePurchaseFinished
		})
	}) else Roact.createElement(ExternalEventConnectionModule, {
		event = MarketplaceService.NativePurchaseFinished,
		callback = NativePurchaseFinished
	})
end))