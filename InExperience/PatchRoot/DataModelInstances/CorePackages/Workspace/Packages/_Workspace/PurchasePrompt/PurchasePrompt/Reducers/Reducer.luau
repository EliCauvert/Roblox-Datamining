local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent

return require(parent.PurchasePromptDeps).Rodux.combineReducers({
	promptRequest = require(script.Parent.PromptRequestReducer),
	purchaseFlow = require(script.Parent.PurchaseFlowReducer),
	productInfo = require(script.Parent.ProductInfoReducer),
	premiumProductInfo = require(script.Parent.PremiumProductsReducer),
	robuxUpsellSuggestions = require(script.Parent.NativeUpsellSuggestionsReducer),
	promptState = require(script.Parent.PromptStateReducer),
	purchaseFlowUUID = require(script.Parent.PurchaseFlowUUIDReducer),
	purchaseError = require(script.Parent.PurchaseErrorReducer),
	economicRestrictionError = require(script.Parent.EconomicRestrictionErrorReducer),
	accountInfo = require(script.Parent.AccountInfoReducer),
	purchasingStartTime = require(script.Parent.PurchasingStartTimeReducer),
	hasCompletedPurchase = require(script.Parent.HasCompletedPurchaseReducer),
	gamepadEnabled = require(script.Parent.GamepadEnabledReducer),
	abVariations = require(script.Parent.ABVariationReducer),
	windowState = require(script.Parent.WindowStateReducer),
	buttonState = require(script.Parent.ButtonStateReducer),
	subscriptionPurchaseInfo = require(script.Parent.SubscriptionPurchaseInfoReducer),
	currentToastMessages = if require(purchasePrompt.Flags.GetFFlagEnableToastLiteRender)() then require(parent.ToastLite).Reducers.CurrentToastMessagesReducer else nil,
	purchaseCallbacks = require(script.Parent.PurchaseCallbacksReducer),
	postPurchaseActions = require(script.Parent.PostPurchaseActionsReducer),
	productPayload = require(script.Parent.ProductPayloadReducer),
	isUserEligibleForUnifiedPurchaseFlow = require(script.Parent.UnifiedPurchaseEligibilityReducer),
	purchaseAnalyticsMetadata = require(script.Parent.PurchaseAnalyticsMetadataReducer),
	purchaseOptions = if require(purchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then require(script.Parent.PurchaseOptionsReducer) else nil,
	robloxSubscriptionProducts = if require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then require(script.Parent.RobloxSubscriptionProductsReducer) else nil,
	cartPricing = if require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled) then require(script.Parent.CartPricingReducer) else nil
})