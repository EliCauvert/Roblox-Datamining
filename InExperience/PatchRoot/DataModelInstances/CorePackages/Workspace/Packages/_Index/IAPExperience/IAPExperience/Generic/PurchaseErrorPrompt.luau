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

function name.getErrorTitle(_, p1, p2, p3)
	-- upvalues: purchaseErrorTypeModule (ref), purchaseFlowTypeModule (ref)
	return if p2 == purchaseErrorTypeModule.FailedRobuxPurchase then p1.robuxFailedPurchaseTitle elseif p2 == purchaseErrorTypeModule.AlreadySubscribed then p1.alreadySubscribedTitle elseif p3 == purchaseFlowTypeModule.Subscription then p1.cantSubscribeTitle else p1.titleText
end

function name.getErrorMessage(_, p1, p2, p3)
	-- upvalues: purchaseErrorTypeModule (ref)
	return if p2 == purchaseErrorTypeModule.AlreadyOwn then p1.alreadyOwnText elseif p2 == purchaseErrorTypeModule.FailedGrant then p1.failedGrantText elseif p2 == purchaseErrorTypeModule.FailedGrantUnknown then p1.failedGrantUnknownText elseif p2 == purchaseErrorTypeModule.Limited then p1.limitedText elseif p2 == purchaseErrorTypeModule.NotEnoughRobux then p1.notEnoughRobuxText elseif p2 == purchaseErrorTypeModule.NotForSale then p1.notForSaleText elseif p2 == purchaseErrorTypeModule.NotForSaleExperience then p1.notForSaleExperienceText elseif p2 == purchaseErrorTypeModule.PremiumOnly then p1.premiumOnlyText elseif p2 == purchaseErrorTypeModule.ThirdPartyDisabled then p1.thirdPartyDisabledText elseif p2 == purchaseErrorTypeModule.Under13 then p1.under13Text elseif p2 == purchaseErrorTypeModule.PremiumPlatformUnavailable then p1.premiumPlatformUnavailable elseif p2 == purchaseErrorTypeModule.AlreadyPremium then p1.alreadyPremium elseif p2 == purchaseErrorTypeModule.PurchaseLimit then p1.purchaseLimitText elseif p2 == purchaseErrorTypeModule.ParentalLimit then p1.parentalLimitText elseif p2 == purchaseErrorTypeModule.FailedRobuxPurchase then p1.robuxFailedPurchaseText elseif p2 == purchaseErrorTypeModule.AlreadySubscribed then p1.alreadySubscribedText elseif p2 == purchaseErrorTypeModule.SubscriptionNotForSale then p1.subscriptionNotForSaleText elseif p2 == purchaseErrorTypeModule.SubscriptionExceededUserSpendLimit then p1.parentalRestrictionSubscriptionText elseif p2 == purchaseErrorTypeModule.SubscriptionUnsupportedLocale then p1.subscriptionUnsupportedLocaleText elseif p2 == purchaseErrorTypeModule.RestrictedUser then p1.restrictedUserText elseif p2 == purchaseErrorTypeModule.SubscriptionPurchasePlatformNotSupported or p2 == purchaseErrorTypeModule.SubscriptionInvalidSaleLocation then p1.subscriptionUnsupportedPlatformText elseif p2 == purchaseErrorTypeModule.VpcRequired then p1.vpcRequiredText elseif p2 == purchaseErrorTypeModule.ExceedParentalSpendLimit then p1.exceedParentalSpendLimitText elseif p2 == purchaseErrorTypeModule.EconomicRestriction then formatEconomicRestrictionText(p1, p3) else p1.unknownText
end

function formatEconomicRestrictionText(p1, p2)
	-- upvalues: default (ref), economicRestrictionsPromptShownCounter (ref), getAppContextModule (ref), loggerModule (ref)
	local timeoutMinutes = p2.timeoutMinutes
	local violationType = p2.violationType
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
		
		return p1.unknownText
	end
	local var1 = getEconomicRestrictionViolationLabel(p1, violationType)
	local ceiled = math.ceil(timeoutMinutes / 60)
	
	return if ceiled >= 24 then p1.economicRestrictionBaseTextDays:gsub("{day}", tostring(math.ceil(ceiled / 24))):gsub("{violation}", var1) else p1.economicRestrictionBaseTextHours:gsub("{hour}", tostring(ceiled)):gsub("{violation}", var1)
end

function getEconomicRestrictionViolationLabel(p1, p2)
	-- upvalues: economicRestrictionsViolationTypeModule (ref), loggerModule (ref)
	if p2 == economicRestrictionsViolationTypeModule.Chargeback then
		return p1.chargebackViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.AbuseOfAffiliateSystem then
		return p1.fraudAbuseOfAffiliateSystemViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.AttemptedUnauthorizedPaymentMethodUse then
		return p1.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.PaymentAuthorizationAttempt then
		return p1.fraudPaymentAbuseViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.RepeatedRefundRequests then
		return p1.fraudRepeatedRefundRequestsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.SuspiciousAccountPatterns then
		return p1.fraudSuspiciousAccountPatternsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.SuspiciousRefundRequests then
		return p1.fraudSuspiciousRefundRequestsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.UnauthorizedPurchase then
		return p1.fraudUnauthorizedPurchaseViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.UseOfUnauthorizedOffPlatformTransactions then
		return p1.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel
	elseif p2 == economicRestrictionsViolationTypeModule.VirtualEconomyAbuse then
		return p1.fraudVirtualEconomyAbuseViolationLabel
	end
	loggerModule.error({ message = "Invalid violation type", violationType = p2 })
	
	return ""
end

function getIsAlreadyOwnedError(p1)
	-- upvalues: purchaseErrorTypeModule (ref)
	return if p1 ~= purchaseErrorTypeModule.AlreadyOwn then if p1 ~= purchaseErrorTypeModule.AlreadyPremium then p1 == purchaseErrorTypeModule.AlreadySubscribed else true else true
end

function getErrorTitleIcon(p1)
	-- upvalues: images (ref)
	return if getIsAlreadyOwnedError(p1) then images["icons/status/success_large"] else images["icons/status/error_large"]
end

function name.renderNewAlertWithLocalization(p1)
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
	})(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderAlert(p2)
	end)
end

function name.render(p1)
	-- upvalues: roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref)
	return roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, { Alert = p1:renderNewAlertWithLocalization() })
end

function name.renderAlert(p1, p2)
	-- upvalues: purchaseErrorTypeModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), purchaseErrorPromptShownCounter (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref)
	local props = p1.props
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
		title = p1:getErrorTitle(p2, props.errorType, props.flowType),
		titleIcon = getErrorTitleIcon(props.errorType),
		bodyText = p1:getErrorMessage(p2, props.errorType, props.economicRestrictionError),
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = props.doneActivated,
						text = p2.okText,
						inputIcon = props.doneControllerIcon
					}
				}
			}
		}
	})
end

return name