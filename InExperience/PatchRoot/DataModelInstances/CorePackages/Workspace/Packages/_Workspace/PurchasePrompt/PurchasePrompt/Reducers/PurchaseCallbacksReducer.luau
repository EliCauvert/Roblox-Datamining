local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local rodux = require(purchasePrompt.Parent.PurchasePromptDeps).Rodux
local setPurchaseCallbacksModule = require(purchasePrompt.Actions.SetPurchaseCallbacks)
local fFlagAddFetchProductInfoAsACallback = require(purchasePrompt.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback
local fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local fFlagEnableLaunchAfterPurchase = require(purchasePrompt.Parent.SharedFlags).FFlagEnableLaunchAfterPurchase

return rodux.createReducer({}, {
	[setPurchaseCallbacksModule.name] = function(_, p0)
		-- upvalues: fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (ref), fFlagAddFetchProductInfoAsACallback (ref), fFlagEnableLaunchAfterPurchase (ref)
		return {
			onFlowComplete = p0.purchaseCallbacks.onFlowComplete,
			onPurchaseSuccess = p0.purchaseCallbacks.onPurchaseSuccess,
			onBuyItemButtonMounted = p0.purchaseCallbacks.onBuyItemButtonMounted,
			onPurchaseAttempt = p0.purchaseCallbacks.onPurchaseAttempt,
			onRobloxSubscriptionUpsellSuccess = if fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal then p0.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil,
			fetchProductInfo = if fFlagAddFetchProductInfoAsACallback then p0.purchaseCallbacks.fetchProductInfo else nil,
			onLaunchAfterPurchase = if fFlagEnableLaunchAfterPurchase then p0.purchaseCallbacks.onLaunchAfterPurchase else nil
		}
	end
})