local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local FFlagAddFetchProductInfoAsACallback = require(PurchasePrompt.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback
local FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(PurchasePrompt.Parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.SetPurchaseCallbacks).name] = function(_, p1)
		-- upvalues: FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), FFlagAddFetchProductInfoAsACallback (copy)
		return {
			onFlowComplete = p1.purchaseCallbacks.onFlowComplete,
			onPurchaseSuccess = p1.purchaseCallbacks.onPurchaseSuccess,
			onBuyItemButtonMounted = p1.purchaseCallbacks.onBuyItemButtonMounted,
			onPurchaseAttempt = p1.purchaseCallbacks.onPurchaseAttempt,
			onRobloxSubscriptionUpsellSuccess = if FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal then p1.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil,
			fetchProductInfo = if FFlagAddFetchProductInfoAsACallback then p1.purchaseCallbacks.fetchProductInfo else nil
		}
	end
}))