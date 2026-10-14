local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local rodux = require(purchasePrompt.Parent.PurchasePromptDeps).Rodux
local setPurchaseCallbacksModule = require(purchasePrompt.Actions.SetPurchaseCallbacks)
local fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local fFlagEnableLaunchAfterPurchase = require(purchasePrompt.Parent.SharedFlags).FFlagEnableLaunchAfterPurchase

return rodux.createReducer({}, {
	[setPurchaseCallbacksModule.name] = function(_, p1)
		-- upvalues: fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (ref), fFlagEnableLaunchAfterPurchase (ref)
		return {
			onFlowComplete = p1.purchaseCallbacks.onFlowComplete,
			onPurchaseSuccess = p1.purchaseCallbacks.onPurchaseSuccess,
			onBuyItemButtonMounted = p1.purchaseCallbacks.onBuyItemButtonMounted,
			onPurchaseAttempt = p1.purchaseCallbacks.onPurchaseAttempt,
			onRobloxSubscriptionUpsellSuccess = if fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal then p1.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil,
			fetchProductInfo = p1.purchaseCallbacks.fetchProductInfo,
			onLaunchAfterPurchase = if fFlagEnableLaunchAfterPurchase then p1.purchaseCallbacks.onLaunchAfterPurchase else nil
		}
	end
})