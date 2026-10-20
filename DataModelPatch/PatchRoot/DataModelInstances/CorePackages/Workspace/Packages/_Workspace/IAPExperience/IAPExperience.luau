local _ = require(script.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local _ = require(script.Enums.CheckUserPurchaseSettingsFailureReason)
local _ = require(script.Enums.EconomicRestrictionsViolationType)
local _ = require(script.ProductPurchase.v3.UnifiedProductPurchaseModalTypes)
local _ = require(script.ProductPurchase.v4.cartPricingResponseLineItem)

return {
	["jest.config"] = script["jest.config"],
	DiscountType = require(script.ProductPurchase.PricingTypes).DiscountType,
	Animator = require(script.Generic.Animator),
	DiscountSummary = require(script.Generic.DiscountSummary),
	UnifiedProductPurchaseModal = require(script.ProductPurchase.v3.UnifiedProductPurchaseModal),
	UnifiedPurchaseCompletionModal = require(script.Generic.UnifiedPurchaseCompletionModal),
	UnifiedPurchaseCompletionModalV2 = require(script.Generic.UnifiedPurchaseCompletionModalV2),
	UnifiedProductPurchaseModalV2 = require(script.ProductPurchase.v4.UnifiedProductPurchaseModalV2),
	aggregateCartPricingForMultiItem = require(script.ProductPurchase.v4.aggregateCartPricingForMultiItem),
	deriveCartPricingView = require(script.ProductPurchase.v4.deriveCartPricingView),
	UnifiedRobuxUpsellModalV2 = require(script.ProductPurchaseRobuxUpsell.v4.UnifiedRobuxUpsellModalV2),
	ProductPurchaseModal = require(script.ProductPurchase.v2.ProductPurchaseModal),
	RobuxUpsellModal = require(script.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModal),
	RobuxUpsellModalMultiplePackage = require(script.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalMultiplePackage),
	RobuxUpsellModalTooExpensiveFallback = require(script.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalTooExpensiveFallback),
	ProductPurchase = require(script.ProductPurchase.ProductPurchasePrompt),
	ProductPurchaseRobuxUpsell = require(script.ProductPurchaseRobuxUpsell.ProductPurchaseRobuxUpsell),
	LeaveRobloxAlert = require(script.Generic.LeaveRobloxPrompt),
	PreparePaymentCheck = require(script.Generic.PreparePaymentCheck),
	Api = {
		PaymentsGateway = {
			GetUpsellSuggestions = require(script.Api.PaymentsGateway.GetUpsellSuggestions)
		}
	},
	Flags = {
		FFlagMobilePopularItemBadgingExperimentEnabled = require(script.Flags.FFlagMobilePopularItemBadgingExperimentEnabled),
		GetFStringMobilePopularItemBadgingLayer = require(script.Flags.GetFStringMobilePopularItemBadgingLayer),
		FFlagPopularFillIconEnabled = require(script.Flags.FFlagPopularFillIconEnabled),
		GetFStringPopularFillIconLocation = require(script.Flags.GetFStringPopularFillIconLocation),
		FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience = require(script.Flags.FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience)
	},
	GetEnableConsolePreparePaymentCheck = require(script.Flags.getEnableConsolePreparePaymentCheck),
	PurchaseFlow = {
		BuyRobuxFlow = require(script.PurchaseFlow.BuyRobux.BuyRobuxFlow),
		BuyRobuxFlowState = require(script.PurchaseFlow.BuyRobux.BuyRobuxFlowState),
		RobuxUpsellFlow = require(script.PurchaseFlow.RobuxUpsell.RobuxUpsellFlow),
		RobuxUpsellFlowState = require(script.PurchaseFlow.RobuxUpsell.RobuxUpsellFlowState),
		PremiumUpsellFlow = require(script.PurchaseFlow.PremiumUpsell.PremiumUpsellFlow),
		PremiumUpsellFlowState = require(script.PurchaseFlow.PremiumUpsell.PremiumUpsellFlowState),
		PurchaseErrorType = require(script.Enums.PurchaseErrorType),
		U13ConfirmType = require(script.Generic.U13ConfirmType),
		SubscriptionPurchaseFlow = require(script.PurchaseFlow.Subscription.SubscriptionPurchaseFlow),
		SubscriptionPurchaseFlowState = require(script.PurchaseFlow.Subscription.SubscriptionPurchaseFlowState)
	},
	Enums = {
		EconomicRestrictionsViolationType = require(script.Enums.EconomicRestrictionsViolationType),
		CheckUserPurchaseSettingsFailureReason = require(script.Enums.CheckUserPurchaseSettingsFailureReason),
		UnifiedPurchaseModalTypeEnum = require(script.Enums.UnifiedPurchaseModalTypeEnum)
	},
	Counters = {
		EconomicRestrictionsCounter = require(script.Generic.Events.EconomicRestrictionsCounter),
		ProductPurchasePromptCounter = require(script.Generic.Events.ProductPurchasePromptCounter)
	},
	Utility = {
		decodeLuauUnicodeEscapes = require(script.Utility.decodeLuauUnicodeEscapes),
		DesktopUpsellExperiment = require(script.Utility.Experiments.DesktopUpsellExperiment),
		mapCheckUserPurchaseSettingsFailureReasonToViolationType = require(script.Utility.EconomicRestriction.mapCheckUserPurchaseSettingsFailureReasonToViolationType),
		isErrorReasonPrefixWithEconomicRestrictions = require(script.Utility.EconomicRestriction.isErrorReasonPrefixWithEconomicRestrictions),
		parseErrorReasonToEconomicRestriction = require(script.Utility.EconomicRestriction.parseErrorReasonToEconomicRestriction),
		isEconomicRestrictionResponse = require(script.Utility.EconomicRestriction.isEconomicRestrictionResponse),
		addEconomicRestrictionKeysToLocalization = require(script.Utility.EconomicRestriction.addEconomicRestrictionKeysToLocalization),
		formatEconomicRestrictionText = require(script.Utility.EconomicRestriction.formatEconomicRestrictionText),
		parseEconomicRestrictionsFailureReason = require(script.Utility.EconomicRestriction.parseEconomicRestrictionsFailureReason),
		parseEconomicRestrictionsExpirationTimeInMinutes = require(script.Utility.EconomicRestriction.parseEconomicRestrictionsExpirationTimeInMinutes),
		isErrorReasonContainsEconomicRestrictions = require(script.Utility.EconomicRestriction.isErrorReasonContainsEconomicRestrictions)
	},
	Locale = { LocaleProvider = require(script.Locale.LocaleProvider) }
}