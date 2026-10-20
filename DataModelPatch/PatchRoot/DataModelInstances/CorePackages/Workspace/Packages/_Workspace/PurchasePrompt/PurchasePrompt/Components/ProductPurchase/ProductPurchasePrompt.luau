local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local ReactModule = require(Parent.React)
local UseMemoFunction = ReactModule.useMemo
local UseEffectFunction = ReactModule.useEffect
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LocalizationService = game:GetService("LocalizationService")
local LocalizationModule = require(Parent.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local IAPExperienceModule = require(Parent.IAPExperience)
local FormatEconomicRestrictionTextFunction = IAPExperienceModule.Utility.formatEconomicRestrictionText
local AddEconomicRestrictionKeysToLocalizationFunction = IAPExperienceModule.Utility.addEconomicRestrictionKeysToLocalization
local FormatTextWithParamsModule = require(PurchasePrompt.Utils.formatTextWithParams)
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local ProductPurchasePromptCounter = IAPExperienceModule.Counters.ProductPurchasePromptCounter.ProductPurchasePromptCounter
local Default = require(Parent.LoggingProtocol).default
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagPurchaseModalTimedOptionExtension = require(Parent.SharedFlags).FFlagPurchaseModalTimedOptionExtension
local UnifiedPurchaseCompletionModal = IAPExperienceModule.UnifiedPurchaseCompletionModal
local UnifiedPurchaseCompletionModalV2 = IAPExperienceModule.UnifiedPurchaseCompletionModalV2
local FFlagFixPurchasingErrorCounterModule = require(PurchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local _ = require(Parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local AppContextModule = require(PurchasePrompt.Utils.AppContext)
local FFlagAddCenterDialogForUnifiedPurchaseModal = require(Parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase = require(Parent.SharedFlags).FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase

local function getPurchaseErrorText(p1, PurchaseError)
	-- upvalues: PurchaseErrorModule (copy)
	return if PurchaseError == PurchaseErrorModule.CannotGetBalance then p1.PurchaseErrorCannotGetBalanceText elseif PurchaseError == PurchaseErrorModule.CannotGetItemPrice then p1.PurchaseErrorCannotGetItemPriceText elseif PurchaseError == PurchaseErrorModule.NotForSale then p1.PurchaseErrorNotForSaleText elseif PurchaseError == PurchaseErrorModule.NotForSaleHere then p1.PurchaseErrorNotForSaleHereText elseif PurchaseError == PurchaseErrorModule.AlreadyOwn then p1.PurchaseErrorAlreadyOwnText elseif PurchaseError == PurchaseErrorModule.Under13 then p1.PurchaseErrorUnder13Text elseif PurchaseError == PurchaseErrorModule.Limited then p1.PurchaseErrorLimitedText elseif PurchaseError == PurchaseErrorModule.ThirdPartyDisabled then p1.PurchaseErrorThirdPartyDisabledText elseif PurchaseError == PurchaseErrorModule.NotEnoughRobux then p1.PurchaseErrorNotEnoughRobuxText elseif PurchaseError == PurchaseErrorModule.NotEnoughRobuxXbox then p1.PurchaseErrorNotEnoughRobuxXboxText elseif PurchaseError == PurchaseErrorModule.NotEnoughRobuxNoUpsell then p1.PurchaseErrorNotEnoughRobuxNoUpsellText elseif PurchaseError == PurchaseErrorModule.TwoFactorNeeded then p1.PurchaseErrorTwoFactorNeededText elseif PurchaseError == PurchaseErrorModule.TwoFactorNeededSettings then p1.PurchaseErrorTwoFactorNeededSettingsText elseif PurchaseError == PurchaseErrorModule.UnknownFailure then p1.PurchaseErrorUnknownFailureText elseif PurchaseError == PurchaseErrorModule.UnknownFailureNoItemName then p1.PurchaseErrorUnknownFailureNoItemNameText elseif PurchaseError == PurchaseErrorModule.PurchaseDisabled then p1.PurchaseErrorPurchaseDisabledText elseif PurchaseError == PurchaseErrorModule.InvalidFunds then p1.PurchaseErrorInvalidFundsText elseif PurchaseError == PurchaseErrorModule.InvalidFundsUnknown then p1.PurchaseErrorInvalidFundsUnknownText elseif PurchaseError == PurchaseErrorModule.PremiumOnly then p1.PurchaseErrorPremiumOnlyText else p1.PurchaseErrorUnknownFailureNoItemNameText
end

local function getModalContent(p1, p2)
	-- upvalues: PromptStateModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagPurchaseModalTimedOptionExtension (copy), FormatTextWithParamsModule (copy), PurchaseErrorModule (copy), FormatEconomicRestrictionTextFunction (copy), FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (copy), getPurchaseErrorText (copy)
	local PromptState = p2.promptState
	local PurchaseError = p2.purchaseError
	local IsGenericChallengeResponseFunction = p2.isGenericChallengeResponse
	local ProductInfo = p2.productInfo
	
	return if PromptState == PromptStateModule.PurchaseComplete then if FFlagEnableUnifiedProductPurchaseFlow and p2.useUnifiedPurchaseCompletionModal then if p2.isMultiItem then {
		messageText = p1.MultiItemPurchaseCompleteBody,
		titleText = p1.PurchaseCompleteTitle
	} elseif FFlagPurchaseModalTimedOptionExtension and p2.completionMessage then {
		messageText = p2.completionMessage,
		titleText = p1.PurchaseCompleteTitle
	} else {
		messageText = FormatTextWithParamsModule(p1.PurchaseCompleteBody, { ITEM_NAME = p2.productInfo.name }),
		titleText = p1.PurchaseCompleteTitle
	} else {
		messageText = FormatTextWithParamsModule(p1.PurchaseCompleteSucceededText, { ITEM_NAME = p2.productInfo.name }),
		titleText = p1.BuyItemTitle
	} elseif PromptState == PromptStateModule.U13PaymentModal then {
		messageText = p1.ScaryModalOneText,
		titleText = p1.BuyItemTitle
	} elseif PromptState == PromptStateModule.U13MonthlyThreshold1Modal then {
		messageText = p1.ScaryModalTwoText,
		titleText = p1.BuyItemTitle
	} elseif PromptState == PromptStateModule.U13MonthlyThreshold2Modal then {
		messageText = p1.ScaryModalParentalText,
		titleText = p1.BuyItemTitle
	} elseif PromptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then {
		messageText = p1.ParentalConsentText,
		titleText = p1.BuyItemTitle
	} elseif PromptState == PromptStateModule.Error then if PurchaseError == PurchaseErrorModule.UnknownFailure then {
		messageText = FormatTextWithParamsModule(p1.PurchaseErrorUnknownFailureText, { ITEM_NAME = ProductInfo.name }),
		titleText = p1.ErrorTitle
	} elseif PurchaseError == PurchaseErrorModule.TwoFactorNeededSettings or IsGenericChallengeResponseFunction(PurchaseError) then {
		messageText = p1.Enable2SVLogoutText,
		titleText = p1.ErrorTitle
	} elseif PurchaseError == PurchaseErrorModule.EconomicRestriction then {
		messageText = FormatEconomicRestrictionTextFunction(p1, {
			violationType = p2.economicRestrictionError.violationType,
			timeoutMinutes = p2.economicRestrictionError.timeoutMinutes
		}, true),
		titleText = p1.ErrorTitle
	} elseif FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase and PurchaseError == PurchaseErrorModule.PendingProductsLimitExceeded then {
		messageText = p1.DevProductPendingProductsLimitExceededMessageText,
		titleText = p1.DevProductPendingProductsLimitExceededTitleText
	} else {
		messageText = getPurchaseErrorText(p1, PurchaseError),
		titleText = p1.ErrorTitle
	} else {
		messageText = p1.PurchaseErrorUnknownFailureNoItemNameText,
		titleText = p1.ErrorTitle
	}
end

local function getButtonStackInfo(p1, p2)
	-- upvalues: ButtonType (copy)
	return if p1.includeCancelButton then {
		{
			props = {
				onActivated = p1.cancelButtonPressed,
				text = p2.CancelPurchaseText,
				inputIcon = if p1.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
			}
		},
		{
			buttonType = ButtonType.PrimarySystem,
			props = {
				onActivated = p1.confirmButtonPressed,
				text = p2.OkButtonText,
				inputIcon = if p1.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			}
		}
	} else {
		{
			buttonType = ButtonType.PrimarySystem,
			props = {
				onActivated = p1.confirmButtonPressed,
				text = p2.OkButtonText,
				inputIcon = if p1.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			}
		}
	}
end

local function ProductPurchasePrompt(p1)
	-- upvalues: FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (copy), AddEconomicRestrictionKeysToLocalizationFunction (copy), UseLocalizationFunction (copy), UseMemoFunction (copy), getModalContent (copy), UseEffectFunction (copy), FFlagFixPurchasingErrorCounterModule (copy), Default (copy), ProductPurchasePromptCounter (copy), PurchaseErrorModule (copy), PromptStateModule (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagAddCenterDialogForUnifiedPurchaseModal (copy), AppContextModule (copy), ReactModule (copy), UnifiedPurchaseCompletionModalV2 (copy), UnifiedPurchaseCompletionModal (copy), InteractiveAlert (copy), getButtonStackInfo (copy)
	local config = {
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		PurchaseCompleteSucceededText = "CoreScripts.PurchasePrompt.PurchaseMessage.Succeeded",
		BuyItemTitle = "CoreScripts.PurchasePrompt.Title.BuyItem",
		VerificationRequiredTitle = "CoreScripts.PurchasePrompt.Title.VerificationRequired",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		SettingsButtonText = "CoreScripts.PurchasePrompt.Button.Settings",
		CancelPurchaseText = "CoreScripts.PurchasePrompt.CancelPurchase.Cancel",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		ScaryModalOneText = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne",
		ScaryModalTwoText = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo",
		ScaryModalParentalText = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental",
		Enable2SVLogoutText = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SVLogout",
		PurchaseErrorCannotGetBalanceText = "CoreScripts.PurchasePrompt.PurchaseFailed.CannotGetBalance",
		PurchaseErrorCannotGetItemPriceText = "CoreScripts.PurchasePrompt.PurchaseFailed.CannotGetItemPrice",
		PurchaseErrorNotForSaleText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotForSale",
		PurchaseErrorNotForSaleHereText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotForSaleHere",
		PurchaseErrorAlreadyOwnText = "CoreScripts.PurchasePrompt.PurchaseFailed.AlreadyOwn",
		PurchaseErrorUnder13Text = "CoreScripts.PurchasePrompt.PurchaseFailed.Under13",
		PurchaseErrorLimitedText = "CoreScripts.PurchasePrompt.PurchaseFailed.Limited",
		PurchaseErrorThirdPartyDisabledText = "CoreScripts.PurchasePrompt.PurchaseFailed.ThirdPartyDisabled",
		PurchaseErrorNotEnoughRobuxText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobux",
		PurchaseErrorNotEnoughRobuxXboxText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobuxXbox",
		PurchaseErrorNotEnoughRobuxNoUpsellText = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobuxNoUpsell",
		PurchaseErrorTwoFactorNeededText = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SV",
		PurchaseErrorTwoFactorNeededSettingsText = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SV",
		PurchaseErrorUnknownFailureText = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailure",
		PurchaseErrorUnknownFailureNoItemNameText = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		PurchaseErrorPurchaseDisabledText = "CoreScripts.PurchasePrompt.PurchaseFailed.PurchaseDisabled",
		PurchaseErrorInvalidFundsText = "CoreScripts.PurchasePrompt.PurchaseFailed.InvalidFunds",
		PurchaseErrorInvalidFundsUnknownText = "CoreScripts.PurchasePrompt.PurchaseFailed.InvalidFunds",
		PurchaseErrorPremiumOnlyText = "CoreScripts.PurchasePrompt.PurchaseFailed.PremiumOnly",
		DevProductPendingProductsLimitExceededTitleText = if FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase then "Purchasing.PurchaseDialog.Heading.PendingDeveloperProductLimitReached" else nil,
		DevProductPendingProductsLimitExceededMessageText = if FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase then "Purchasing.PurchaseDialog.Message.PendingDeveloperProductLimitReached" else nil,
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	}
	AddEconomicRestrictionKeysToLocalizationFunction(config)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: getModalContent (upval), UseLocalizationResult (copy), p1 (copy)
		return (getModalContent(UseLocalizationResult, p1))
	end, { p1 })
	UseEffectFunction(function()
		-- upvalues: FFlagFixPurchasingErrorCounterModule (upval), Default (upval), ProductPurchasePromptCounter (upval), p1 (copy), PurchaseErrorModule (upval), PromptStateModule (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval)
		if FFlagFixPurchasingErrorCounterModule then
			Default:logRobloxTelemetryCounter(ProductPurchasePromptCounter, 1, {
				promptState = tostring(p1.promptState),
				purchaseError = if PurchaseErrorModule.isMember(p1.purchaseError) then tostring(p1.purchaseError) else tostring(PurchaseErrorModule.UnknownFailure)
			})
		else
			Default:logRobloxTelemetryCounter(ProductPurchasePromptCounter, 1, {
				promptState = tostring(p1.promptState),
				purchaseError = if p1.promptState == PromptStateModule.Error then tostring(p1.purchaseError) else ""
			})
		end
		if p1.purchaseError == PurchaseErrorModule.EconomicRestriction then
			Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
				surface = EconomicRestrictionsSurface.InExperience,
				failureReason = tostring(p1.economicRestrictionError.violationType)
			})
		end
	end, { p1.purchaseError })
	
	return if FFlagEnableUnifiedProductPurchaseFlow and p1.useUnifiedPurchaseCompletionModal then if FFlagAddCenterDialogForUnifiedPurchaseModal and AppContextModule.get() == AppContextModule.Enum.IN_APP then ReactModule.createElement(UnifiedPurchaseCompletionModalV2, {
		title = UseMemoResult.titleText,
		isError = p1.promptState ~= PromptStateModule.PurchaseComplete,
		bodyText = UseMemoResult.messageText,
		buttons = {
			onActivated = p1.confirmButtonPressed,
			text = UseLocalizationResult.OkButtonText,
			onClose = p1.cancelButtonPressed
		}
	}) else ReactModule.createElement(UnifiedPurchaseCompletionModal, {
		title = UseMemoResult.titleText,
		isError = p1.promptState ~= PromptStateModule.PurchaseComplete,
		bodyText = UseMemoResult.messageText,
		buttons = {
			onActivated = p1.confirmButtonPressed,
			text = UseLocalizationResult.OkButtonText,
			onClose = p1.cancelButtonPressed
		}
	}) else ReactModule.createElement(InteractiveAlert, {
		screenSize = p1.screenSize,
		title = UseMemoResult.titleText,
		titleIcon = p1.titleIcon,
		bodyText = UseMemoResult.messageText,
		buttonStackInfo = { buttons = getButtonStackInfo(p1, UseLocalizationResult) }
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), ProductPurchasePrompt (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		ProductPurchasePrompt = ReactModule.createElement(ProductPurchasePrompt, p1)
	})
end