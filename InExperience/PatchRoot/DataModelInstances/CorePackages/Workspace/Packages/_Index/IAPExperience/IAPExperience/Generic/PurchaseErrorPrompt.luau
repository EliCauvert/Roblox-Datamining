local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local UIBloxModule = require(parent_2.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_2.AppLocales).Localization
local localizationProvider = require(parent_2.Localization).LocalizationProvider
local withLocalization = require(parent_2.Localization).withLocalization
local purchaseErrorTypeModule = require(parent_1.Enums.PurchaseErrorType)
local economicRestrictionsViolationTypeModule = require(parent_1.Enums.EconomicRestrictionsViolationType)
local purchaseFlowTypeModule = require(parent.PurchaseFlowType)
local default = require(parent_2.LoggingProtocol).default
local loggerModule = require(parent_1.Utility.logger)
local getAppContextModule = require(parent_1.Utility.getAppContext)
local name = roactModule.Component:extend(script.Name)
local purchaseErrorPromptCounterModule = require(parent_1.Generic.Events.PurchaseErrorPromptCounter)
local purchaseErrorPromptShownCounter = purchaseErrorPromptCounterModule.PurchaseErrorPromptShownCounter
local economicRestrictionsPromptShownCounter = purchaseErrorPromptCounterModule.EconomicRestrictionsPromptShownCounter
name.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.getErrorTitle(_, p0, p1, p2)
	-- upvalues: purchaseErrorTypeModule (ref), purchaseFlowTypeModule (ref)
	return if p1 == purchaseErrorTypeModule.FailedRobuxPurchase then p0.robuxFailedPurchaseTitle elseif p1 == purchaseErrorTypeModule.AlreadySubscribed then p0.alreadySubscribedTitle elseif p2 == purchaseFlowTypeModule.Subscription then p0.cantSubscribeTitle else p0.titleText
end

function name.getErrorMessage(_, p3, p4, p5)
	-- upvalues: purchaseErrorTypeModule (ref)
	return if p4 == purchaseErrorTypeModule.AlreadyOwn then p3.alreadyOwnText elseif p4 == purchaseErrorTypeModule.FailedGrant then p3.failedGrantText elseif p4 == purchaseErrorTypeModule.FailedGrantUnknown then p3.failedGrantUnknownText elseif p4 == purchaseErrorTypeModule.Limited then p3.limitedText elseif p4 == purchaseErrorTypeModule.NotEnoughRobux then p3.notEnoughRobuxText elseif p4 == purchaseErrorTypeModule.NotForSale then p3.notForSaleText elseif p4 == purchaseErrorTypeModule.NotForSaleExperience then p3.notForSaleExperienceText elseif p4 == purchaseErrorTypeModule.PremiumOnly then p3.premiumOnlyText elseif p4 == purchaseErrorTypeModule.ThirdPartyDisabled then p3.thirdPartyDisabledText elseif p4 == purchaseErrorTypeModule.Under13 then p3.under13Text elseif p4 == purchaseErrorTypeModule.PremiumPlatformUnavailable then p3.premiumPlatformUnavailable elseif p4 == purchaseErrorTypeModule.AlreadyPremium then p3.alreadyPremium elseif p4 == purchaseErrorTypeModule.PurchaseLimit then p3.purchaseLimitText elseif p4 == purchaseErrorTypeModule.ParentalLimit then p3.parentalLimitText elseif p4 == purchaseErrorTypeModule.FailedRobuxPurchase then p3.robuxFailedPurchaseText elseif p4 == purchaseErrorTypeModule.AlreadySubscribed then p3.alreadySubscribedText elseif p4 == purchaseErrorTypeModule.SubscriptionNotForSale then p3.subscriptionNotForSaleText elseif p4 == purchaseErrorTypeModule.SubscriptionExceededUserSpendLimit then p3.parentalRestrictionSubscriptionText elseif p4 == purchaseErrorTypeModule.SubscriptionUnsupportedLocale then p3.subscriptionUnsupportedLocaleText elseif p4 == purchaseErrorTypeModule.RestrictedUser then p3.restrictedUserText elseif p4 == purchaseErrorTypeModule.SubscriptionPurchasePlatformNotSupported or p4 == purchaseErrorTypeModule.SubscriptionInvalidSaleLocation then p3.subscriptionUnsupportedPlatformText elseif p4 == purchaseErrorTypeModule.VpcRequired then p3.vpcRequiredText elseif p4 == purchaseErrorTypeModule.ExceedParentalSpendLimit then p3.exceedParentalSpendLimitText elseif p4 == purchaseErrorTypeModule.EconomicRestriction then formatEconomicRestrictionText(p3, p5) else p3.unknownText
end

function formatEconomicRestrictionText(p6, p7)
	-- upvalues: default (ref), economicRestrictionsPromptShownCounter (ref), getAppContextModule (ref), loggerModule (ref)
	local timeoutMinutes = p7.timeoutMinutes
	local violationType = p7.violationType
	default:logRobloxTelemetryCounter(economicRestrictionsPromptShownCounter, 1, {
		violationType = tostring(violationType),
		appContext = getAppContextModule()
	})
	
	if not timeoutMinutes or not violationType then
		loggerModule.error({
			error = "Timeout and violationType is required for economic restriction text. Showing unknown error.",
			timeoutMinutes = timeoutMinutes,
			violationType = violationType
		})
		
		return p6.unknownText
	end
	local var10 = getEconomicRestrictionViolationLabel(p6, violationType)
	local ceiled = math.ceil(timeoutMinutes / 60)
	
	return if ceiled >= 24 then p6.economicRestrictionBaseTextDays:gsub("{day}", tostring(math.ceil(ceiled / 24))):gsub("{violation}", var10) else p6.economicRestrictionBaseTextHours:gsub("{hour}", tostring(ceiled)):gsub("{violation}", var10)
end

function getEconomicRestrictionViolationLabel(p8, p9)
	-- upvalues: economicRestrictionsViolationTypeModule (ref), loggerModule (ref)
	if p9 == economicRestrictionsViolationTypeModule.Chargeback then
		return p8.chargebackViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.AbuseOfAffiliateSystem then
		return p8.fraudAbuseOfAffiliateSystemViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.AttemptedUnauthorizedPaymentMethodUse then
		return p8.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.PaymentAuthorizationAttempt then
		return p8.fraudPaymentAbuseViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.RepeatedRefundRequests then
		return p8.fraudRepeatedRefundRequestsViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.SuspiciousAccountPatterns then
		return p8.fraudSuspiciousAccountPatternsViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.SuspiciousRefundRequests then
		return p8.fraudSuspiciousRefundRequestsViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.UnauthorizedPurchase then
		return p8.fraudUnauthorizedPurchaseViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.UseOfUnauthorizedOffPlatformTransactions then
		return p8.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel
	elseif p9 == economicRestrictionsViolationTypeModule.VirtualEconomyAbuse then
		return p8.fraudVirtualEconomyAbuseViolationLabel
	end
	loggerModule.error({ message = "Invalid violation type", violationType = p9 })
	
	return ""
end

function getIsAlreadyOwnedError(p10)
	-- upvalues: purchaseErrorTypeModule (ref)
	return if p10 ~= purchaseErrorTypeModule.AlreadyOwn then if p10 ~= purchaseErrorTypeModule.AlreadyPremium then p10 == purchaseErrorTypeModule.AlreadySubscribed else true else true
end

function getErrorTitleIcon(p11)
	-- upvalues: images (ref)
	return if getIsAlreadyOwnedError(p11) then images["icons/status/success_large"] else images["icons/status/error_large"]
end

function name.renderNewAlertWithLocalization(p12)
	-- upvalues: withLocalization (ref)
	return withLocalization({
		titleText = "IAPExperience.PurchaseError.Title.Error",
		robuxFailedPurchaseTitle = "IAPExperience.PurchaseError.Title.RobuxPurchaseFailed",
		robuxFailedPurchaseText = "IAPExperience.PurchaseError.Text.FailedRobuxPurchase",
		unknownText = "IAPExperience.PurchaseError.Text.UnknownError",
		okText = "IAPExperience.PurchaseError.Text.Ok",
		alreadyOwnText = "IAPExperience.PurchaseError.Text.AlreadyOwn",
		failedGrantText = "IAPExperience.PurchaseError.Text.FailedGrant",
		failedGrantUnknownText = "IAPExperience.PurchaseError.Text.FailedGrantUnknown",
		limitedText = "IAPExperience.PurchaseError.Text.Limited",
		notEnoughRobuxText = "IAPExperience.PurchaseError.Text.NotEnoughRobux",
		notForSaleText = "IAPExperience.PurchaseError.Text.NotForSale",
		notForSaleExperienceText = "IAPExperience.PurchaseError.Text.NotForSaleExperience",
		premiumOnlyText = "IAPExperience.PurchaseError.Text.PremiumOnly",
		thirdPartyDisabledText = "IAPExperience.PurchaseError.Text.ThirdPartyDisabled",
		under13Text = "IAPExperience.PurchaseError.Text.Under13",
		premiumPlatformUnavailable = "IAPExperience.PurchaseError.Text.PremiumPlatformUnavailable",
		alreadyPremium = "IAPExperience.PurchaseError.AlreadyPremium",
		purchaseLimitText = "IAPExperience.PurchaseError.Text.PurchaseLimit",
		parentalLimitText = "IAPExperience.PurchaseError.Text.ParentalLimit",
		alreadySubscribedTitle = "IAPExperience.PurchaseError.Title.AlreadySubscribed",
		cantSubscribeTitle = "IAPExperience.PurchaseError.Title.CantSubscribe",
		alreadySubscribedText = "IAPExperience.PurchaseError.Text.AlreadySubscribed",
		subscriptionNotForSaleText = "IAPExperience.PurchaseError.Text.SubscriptionNotForSale",
		parentalRestrictionSubscriptionText = "IAPExperience.PurchaseError.Text.ParentalRestrictionSubscription",
		subscriptionUnsupportedLocaleText = "IAPExperience.PurchaseError.Text.SubscriptionUnsupportedLocale",
		restrictedUserText = "IAPExperience.PurchaseError.Text.RestrictedUser",
		subscriptionUnsupportedPlatformText = "IAPExperience.PurchaseError.Text.SubscriptionUnsupportedPlatform",
		vpcRequiredText = "IAPExperience.PurchaseError.Text.VpcRequired",
		exceedParentalSpendLimitText = "Feature.Subscription.Message.MonthlySpendRestrictionsMonthlyLimitExceed",
		chargebackViolationLabel = "Feature.NotApproved.Label.AbuseType.Chargeback",
		fraudAbuseOfAffiliateSystemViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudAbuseOfTheAffiliateSystem",
		fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudAttemptedUnauthorizedPaymentMethodUse",
		fraudPaymentAbuseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudPaymentAbuse",
		fraudRepeatedRefundRequestsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudRepeatedRefundRequests",
		fraudSuspiciousAccountPatternsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudSuspiciousAccountPatterns",
		fraudSuspiciousRefundRequestsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudSuspiciousRefundRequests",
		fraudUnauthorizedPurchaseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudUnauthorizedPurchase",
		fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudUseOfUnauthorizedOffPlatformTransactions",
		fraudVirtualEconomyAbuseViolationLabel = "Feature.NotApproved.Label.Sublabel.FraudVirtualEconomyAbuse",
		economicRestrictionBaseTextHours = "IAPExperience.PurchaseError.Text.EconomicRestrictionsHours",
		economicRestrictionBaseTextDays = "IAPExperience.PurchaseError.Text.EconomicRestrictionsDays"
	})(function(p13)
		-- upvalues: p12 (ref)
		return p12:renderAlert(p13)
	end)
end

function name.render(p14)
	-- upvalues: roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref)
	return roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, { Alert = p14:renderNewAlertWithLocalization() })
end

function name.renderAlert(p15, p16)
	-- upvalues: purchaseErrorTypeModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), purchaseErrorPromptShownCounter (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref)
	local props = p15.props
	local errorType = props.errorType and purchaseErrorTypeModule.toRawValue(props.errorType) or tostring(props.errorType)
	loggerModule.debug({
		message = "Purchase Error Prompt Shown",
		errorType = tostring(props.errorType),
		errorLabel = errorType,
		flowType = tostring(props.flowType),
		screenHeight = props.screenSize.Y,
		screenWidth = props.screenSize.X,
		portrait = props.screenSize.X < props.screenSize.Y,
		appContext = getAppContextModule()
	})
	default:logRobloxTelemetryCounter(purchaseErrorPromptShownCounter, 1, {
		errorType = tostring(props.errorType),
		errorLabel = errorType,
		flowType = tostring(props.flowType),
		screenHeight = props.screenSize.Y,
		screenWidth = props.screenSize.X,
		portrait = props.screenSize.X < props.screenSize.Y,
		appContext = getAppContextModule()
	})
	
	return roactModule.createElement(interactiveAlert, {
		anchorPoint = props.anchorPoint,
		position = props.position,
		screenSize = props.screenSize,
		title = p15:getErrorTitle(p16, props.errorType, props.flowType),
		titleIcon = getErrorTitleIcon(props.errorType),
		bodyText = p15:getErrorMessage(p16, props.errorType, props.economicRestrictionError),
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = props.doneActivated,
						text = p16.okText,
						inputIcon = props.doneControllerIcon
					}
				}
			}
		}
	})
end

return name