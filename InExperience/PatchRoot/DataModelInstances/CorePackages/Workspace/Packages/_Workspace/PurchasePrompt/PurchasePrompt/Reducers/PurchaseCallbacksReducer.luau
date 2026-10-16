local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(PurchasePrompt.Parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local FFlagEnableLaunchAfterPurchase = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableLaunchAfterPurchase

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.SetPurchaseCallbacks).name] = function(_, p1) --[[ Line: 13 ]]
		-- upvalues: FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), FFlagEnableLaunchAfterPurchase (copy)
		return {
			onFlowComplete = p1.purchaseCallbacks.onFlowComplete,
			onPurchaseSuccess = p1.purchaseCallbacks.onPurchaseSuccess,
			onBuyItemButtonMounted = p1.purchaseCallbacks.onBuyItemButtonMounted,
			onPurchaseAttempt = p1.purchaseCallbacks.onPurchaseAttempt,
			onRobloxSubscriptionUpsellSuccess = if FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal then p1.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil,
			fetchProductInfo = p1.purchaseCallbacks.fetchProductInfo,
			onLaunchAfterPurchase = if FFlagEnableLaunchAfterPurchase then p1.purchaseCallbacks.onLaunchAfterPurchase else nil
		}
	end
}))