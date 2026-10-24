local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local CurrentToastMessagesReducer = require(Parent.ToastLite).Reducers.CurrentToastMessagesReducer
local PurchaseOptionsReducerModule = require(script.Parent.PurchaseOptionsReducer)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow

return (require(Parent.PurchasePromptDeps).Rodux.combineReducers({
	promptRequest = require(script.Parent.PromptRequestReducer),
	purchaseFlow = require(script.Parent.PurchaseFlowReducer),
	productInfo = require(script.Parent.ProductInfoReducer),
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
	currentToastMessages = if require(PurchasePrompt.Flags.GetFFlagEnableToastLiteRender)() then CurrentToastMessagesReducer else nil,
	purchaseCallbacks = require(script.Parent.PurchaseCallbacksReducer),
	postPurchaseActions = require(script.Parent.PostPurchaseActionsReducer),
	productPayload = require(script.Parent.ProductPayloadReducer),
	isUserEligibleForUnifiedPurchaseFlow = require(script.Parent.UnifiedPurchaseEligibilityReducer),
	purchaseAnalyticsMetadata = require(script.Parent.PurchaseAnalyticsMetadataReducer),
	purchaseOptions = if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then PurchaseOptionsReducerModule else nil,
	robloxSubscriptionProducts = require(script.Parent.RobloxSubscriptionProductsReducer),
	cartPricing = require(script.Parent.CartPricingReducer)
}))