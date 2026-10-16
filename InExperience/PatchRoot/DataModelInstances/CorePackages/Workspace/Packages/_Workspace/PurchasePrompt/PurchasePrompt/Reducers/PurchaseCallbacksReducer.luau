local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local rodux = require(purchasePrompt.Parent.PurchasePromptDeps).Rodux
local setPurchaseCallbacksModule = require(purchasePrompt.Actions.SetPurchaseCallbacks)
local fFlagAddFetchProductInfoAsACallback = require(purchasePrompt.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback
local fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local fFlagEnableLaunchAfterPurchase = require(purchasePrompt.Parent.SharedFlags).FFlagEnableLaunchAfterPurchase

return rodux.createReducer({}, {
	[setPurchaseCallbacksModule.name] = function(_, p1)
		-- upvalues: fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (ref), fFlagAddFetchProductInfoAsACallback (ref), fFlagEnableLaunchAfterPurchase (ref)
		return {
			onFlowComplete = p1.purchaseCallbacks.onFlowComplete,
			onPurchaseSuccess = p1.purchaseCallbacks.onPurchaseSuccess,
			onBuyItemButtonMounted = p1.purchaseCallbacks.onBuyItemButtonMounted,
			onPurchaseAttempt = p1.purchaseCallbacks.onPurchaseAttempt,
			onRobloxSubscriptionUpsellSuccess = if fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal then p1.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil,
			fetchProductInfo = if fFlagAddFetchProductInfoAsACallback then p1.purchaseCallbacks.fetchProductInfo else nil,
			onLaunchAfterPurchase = if fFlagEnableLaunchAfterPurchase then p1.purchaseCallbacks.onLaunchAfterPurchase else nil
		}
	end
})