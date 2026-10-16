local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local UIBloxModule = require(Parent2.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent2.AppLocales).Localization
local LocalizationProvider = require(Parent2.Localization).LocalizationProvider
local WithLocalizationFunction = require(Parent2.Localization).withLocalization
local PurchaseErrorTypeModule = require(Parent1.Enums.PurchaseErrorType)
local EconomicRestrictionsViolationTypeModule = require(Parent1.Enums.EconomicRestrictionsViolationType)
local PurchaseFlowTypeModule = require(Parent.PurchaseFlowType)
local Default = require(Parent2.LoggingProtocol).default
local LoggerModule = require(Parent1.Utility.logger)
local GetAppContextModule = require(Parent1.Utility.getAppContext)
local ExtendResult = RoactModule.Component:extend(script.Name)
local PurchaseErrorPromptCounterModule = require(Parent1.Generic.Events.PurchaseErrorPromptCounter)
local PurchaseErrorPromptShownCounter = PurchaseErrorPromptCounterModule.PurchaseErrorPromptShownCounter
local EconomicRestrictionsPromptShownCounter = PurchaseErrorPromptCounterModule.EconomicRestrictionsPromptShownCounter
ExtendResult.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult:getErrorTitle(p1, ErrorType, FlowType) --[[ Line: 49 ]]
	-- upvalues: PurchaseErrorTypeModule (copy), PurchaseFlowTypeModule (copy)
	return if ErrorType == PurchaseErrorTypeModule.FailedRobuxPurchase then p1.robuxFailedPurchaseTitle elseif ErrorType == PurchaseErrorTypeModule.AlreadySubscribed then p1.alreadySubscribedTitle elseif FlowType == PurchaseFlowTypeModule.Subscription then p1.cantSubscribeTitle else p1.titleText
end

function ExtendResult:getErrorMessage(p1, ErrorType, EconomicRestrictionError) --[[ Line: 61 ]]
	-- upvalues: PurchaseErrorTypeModule (copy)
	return if ErrorType == PurchaseErrorTypeModule.AlreadyOwn then p1.alreadyOwnText elseif ErrorType == PurchaseErrorTypeModule.FailedGrant then p1.failedGrantText elseif ErrorType == PurchaseErrorTypeModule.FailedGrantUnknown then p1.failedGrantUnknownText elseif ErrorType == PurchaseErrorTypeModule.Limited then p1.limitedText elseif ErrorType == PurchaseErrorTypeModule.NotEnoughRobux then p1.notEnoughRobuxText elseif ErrorType == PurchaseErrorTypeModule.NotForSale then p1.notForSaleText elseif ErrorType == PurchaseErrorTypeModule.NotForSaleExperience then p1.notForSaleExperienceText elseif ErrorType == PurchaseErrorTypeModule.PremiumOnly then p1.premiumOnlyText elseif ErrorType == PurchaseErrorTypeModule.ThirdPartyDisabled then p1.thirdPartyDisabledText elseif ErrorType == PurchaseErrorTypeModule.Under13 then p1.under13Text elseif ErrorType == PurchaseErrorTypeModule.PremiumPlatformUnavailable then p1.premiumPlatformUnavailable elseif ErrorType == PurchaseErrorTypeModule.AlreadyPremium then p1.alreadyPremium elseif ErrorType == PurchaseErrorTypeModule.PurchaseLimit then p1.purchaseLimitText elseif ErrorType == PurchaseErrorTypeModule.ParentalLimit then p1.parentalLimitText elseif ErrorType == PurchaseErrorTypeModule.FailedRobuxPurchase then p1.robuxFailedPurchaseText elseif ErrorType == PurchaseErrorTypeModule.AlreadySubscribed then p1.alreadySubscribedText elseif ErrorType == PurchaseErrorTypeModule.SubscriptionNotForSale then p1.subscriptionNotForSaleText elseif ErrorType == PurchaseErrorTypeModule.SubscriptionExceededUserSpendLimit then p1.parentalRestrictionSubscriptionText elseif ErrorType == PurchaseErrorTypeModule.SubscriptionUnsupportedLocale then p1.subscriptionUnsupportedLocaleText elseif ErrorType == PurchaseErrorTypeModule.RestrictedUser then p1.restrictedUserText elseif ErrorType == PurchaseErrorTypeModule.SubscriptionPurchasePlatformNotSupported or ErrorType == PurchaseErrorTypeModule.SubscriptionInvalidSaleLocation then p1.subscriptionUnsupportedPlatformText elseif ErrorType == PurchaseErrorTypeModule.VpcRequired then p1.vpcRequiredText elseif ErrorType == PurchaseErrorTypeModule.ExceedParentalSpendLimit then p1.exceedParentalSpendLimitText elseif ErrorType == PurchaseErrorTypeModule.EconomicRestriction then formatEconomicRestrictionText(p1, EconomicRestrictionError) else p1.unknownText
end

function formatEconomicRestrictionText(p1, p2) --[[ Line: 123 ]]
	-- upvalues: Default (copy), EconomicRestrictionsPromptShownCounter (copy), GetAppContextModule (copy), LoggerModule (copy)
	local TimeoutMinutes: number = p2.timeoutMinutes
	local ViolationType = p2.violationType
	Default:logRobloxTelemetryCounter(EconomicRestrictionsPromptShownCounter, 1, {
		violationType = tostring(ViolationType),
		appContext = GetAppContextModule()
	})
	
	if TimeoutMinutes and ViolationType then
		local EconomicRestrictionViolationLabel = getEconomicRestrictionViolationLabel(p1, ViolationType)
		local Ceiled = math.ceil(TimeoutMinutes / 60)
		
		return if Ceiled >= 24 then p1.economicRestrictionBaseTextDays:gsub("{day}", (tostring((math.ceil(Ceiled / 24))))):gsub("{violation}", EconomicRestrictionViolationLabel) else p1.economicRestrictionBaseTextHours:gsub("{hour}", (tostring(Ceiled))):gsub("{violation}", EconomicRestrictionViolationLabel)
	else
		LoggerModule.error({
			error = "Timeout and violationType is required for economic restriction text. Showing unknown error.",
			timeoutMinutes = TimeoutMinutes,
			violationType = ViolationType
		})
		
		return p1.unknownText
	end
end

function getEconomicRestrictionViolationLabel(p1, ViolationType) --[[ Line: 154 ]]
	-- upvalues: EconomicRestrictionsViolationTypeModule (copy), LoggerModule (copy)
	if ViolationType == EconomicRestrictionsViolationTypeModule.Chargeback then
		return p1.chargebackViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.AbuseOfAffiliateSystem then
		return p1.fraudAbuseOfAffiliateSystemViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.AttemptedUnauthorizedPaymentMethodUse then
		return p1.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.PaymentAuthorizationAttempt then
		return p1.fraudPaymentAbuseViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.RepeatedRefundRequests then
		return p1.fraudRepeatedRefundRequestsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.SuspiciousAccountPatterns then
		return p1.fraudSuspiciousAccountPatternsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.SuspiciousRefundRequests then
		return p1.fraudSuspiciousRefundRequestsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.UnauthorizedPurchase then
		return p1.fraudUnauthorizedPurchaseViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.UseOfUnauthorizedOffPlatformTransactions then
		return p1.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.VirtualEconomyAbuse then
		return p1.fraudVirtualEconomyAbuseViolationLabel
	else
		LoggerModule.error({
			message = "Invalid violation type",
			violationType = ViolationType
		})
		
		return ""
	end
end

function getIsAlreadyOwnedError(AlreadyOwn): boolean --[[ Line: 185 ]]
	-- upvalues: PurchaseErrorTypeModule (copy)
	return AlreadyOwn == PurchaseErrorTypeModule.AlreadyOwn or (AlreadyOwn == PurchaseErrorTypeModule.AlreadyPremium or AlreadyOwn == PurchaseErrorTypeModule.AlreadySubscribed)
end

function getErrorTitleIcon(p1) --[[ Line: 191 ]]
	-- upvalues: Images (copy)
	return if getIsAlreadyOwnedError(p1) then Images["icons/status/success_large"] else Images["icons/status/error_large"]
end

function ExtendResult.renderNewAlertWithLocalization(p1) --[[ Line: 198 ]]
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
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
	})(function(p2) --[[ Line: 241 ]]
		-- upvalues: p1 (copy)
		return p1:renderAlert(p2)
	end)
end

function ExtendResult.render(p1) --[[ Line: 246 ]]
	-- upvalues: RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy)
	return RoactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, { Alert = p1:renderNewAlertWithLocalization() })
end

function ExtendResult.renderAlert(p1, p2) --[[ Line: 254 ]]
	-- upvalues: PurchaseErrorTypeModule (copy), LoggerModule (copy), GetAppContextModule (copy), Default (copy), PurchaseErrorPromptShownCounter (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local Props = p1.props
	local RawValue = Props.errorType and PurchaseErrorTypeModule.toRawValue(Props.errorType) or tostring(Props.errorType)
	LoggerModule.debug({
		message = "Purchase Error Prompt Shown",
		errorType = tostring(Props.errorType),
		errorLabel = RawValue,
		flowType = tostring(Props.flowType),
		screenHeight = Props.screenSize.Y,
		screenWidth = Props.screenSize.X,
		portrait = Props.screenSize.X < Props.screenSize.Y,
		appContext = GetAppContextModule()
	})
	Default:logRobloxTelemetryCounter(PurchaseErrorPromptShownCounter, 1, {
		errorType = tostring(Props.errorType),
		errorLabel = RawValue,
		flowType = tostring(Props.flowType),
		screenHeight = Props.screenSize.Y,
		screenWidth = Props.screenSize.X,
		portrait = Props.screenSize.X < Props.screenSize.Y,
		appContext = GetAppContextModule()
	})
	
	return RoactModule.createElement(InteractiveAlert, {
		anchorPoint = Props.anchorPoint,
		position = Props.position,
		screenSize = Props.screenSize,
		title = p1:getErrorTitle(p2, Props.errorType, Props.flowType),
		titleIcon = getErrorTitleIcon(Props.errorType),
		bodyText = p1:getErrorMessage(p2, Props.errorType, Props.economicRestrictionError),
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = Props.doneActivated,
						text = p2.okText,
						inputIcon = Props.doneControllerIcon
					}
				}
			}
		}
	})
end

return ExtendResult