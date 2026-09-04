local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local reactModule = require(parent.React)
local useMemo = reactModule.useMemo
local useEffect = reactModule.useEffect
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local localizationService = game:GetService("LocalizationService")
local localizationModule = require(parent.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local localization = require(parent.RobloxAppLocales).Localization
local useLocalization = localizationModule.Hooks.useLocalization
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local IAPExperienceModule = require(parent.IAPExperience)
local formatEconomicRestrictionText = IAPExperienceModule.Utility.formatEconomicRestrictionText
local addEconomicRestrictionKeysToLocalization = IAPExperienceModule.Utility.addEconomicRestrictionKeysToLocalization
local formatTextWithParamsModule = require(purchasePrompt.Utils.formatTextWithParams)
local economicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local universalEconomicRestrictionsCounter = economicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local economicRestrictionsSurface = economicRestrictionsCounter.EconomicRestrictionsSurface
local _ = IAPExperienceModule.Counters.ProductPurchasePromptCounter.ProductPurchasePromptCounter
local default = require(parent.LoggingProtocol).default
local fFlagPurchaseModalTimedOptionExtension = require(parent.SharedFlags).FFlagPurchaseModalTimedOptionExtension
local unifiedPurchaseCompletionModal = IAPExperienceModule.UnifiedPurchaseCompletionModal
local unifiedPurchaseCompletionModalV2 = IAPExperienceModule.UnifiedPurchaseCompletionModalV2
local _ = require(purchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local _ = require(purchasePrompt.Flags.FFlagAddSurfaceAndProductTypeToPromptCounter)
local logProductPurchasePromptCounterModule = require(purchasePrompt.Utils.logProductPurchasePromptCounter)
local _ = require(parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local appContextModule = require(purchasePrompt.Utils.AppContext)
local fFlagAddCenterDialogForUnifiedPurchaseModal = require(parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase = require(parent.SharedFlags).FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase

local function getPurchaseErrorText(p1, p2)
	-- upvalues: purchaseErrorModule (ref)
	return if p2 == purchaseErrorModule.CannotGetBalance then p1.PurchaseErrorCannotGetBalanceText elseif p2 == purchaseErrorModule.CannotGetItemPrice then p1.PurchaseErrorCannotGetItemPriceText elseif p2 == purchaseErrorModule.NotForSale then p1.PurchaseErrorNotForSaleText elseif p2 == purchaseErrorModule.NotForSaleHere then p1.PurchaseErrorNotForSaleHereText elseif p2 == purchaseErrorModule.AlreadyOwn then p1.PurchaseErrorAlreadyOwnText elseif p2 == purchaseErrorModule.Under13 then p1.PurchaseErrorUnder13Text elseif p2 == purchaseErrorModule.Limited then p1.PurchaseErrorLimitedText elseif p2 == purchaseErrorModule.ThirdPartyDisabled then p1.PurchaseErrorThirdPartyDisabledText elseif p2 == purchaseErrorModule.NotEnoughRobux then p1.PurchaseErrorNotEnoughRobuxText elseif p2 == purchaseErrorModule.NotEnoughRobuxXbox then p1.PurchaseErrorNotEnoughRobuxXboxText elseif p2 == purchaseErrorModule.NotEnoughRobuxNoUpsell then p1.PurchaseErrorNotEnoughRobuxNoUpsellText elseif p2 == purchaseErrorModule.TwoFactorNeeded then p1.PurchaseErrorTwoFactorNeededText elseif p2 == purchaseErrorModule.TwoFactorNeededSettings then p1.PurchaseErrorTwoFactorNeededSettingsText elseif p2 == purchaseErrorModule.UnknownFailure then p1.PurchaseErrorUnknownFailureText elseif p2 == purchaseErrorModule.UnknownFailureNoItemName then p1.PurchaseErrorUnknownFailureNoItemNameText elseif p2 == purchaseErrorModule.PurchaseDisabled then p1.PurchaseErrorPurchaseDisabledText elseif p2 == purchaseErrorModule.InvalidFunds then p1.PurchaseErrorInvalidFundsText elseif p2 == purchaseErrorModule.InvalidFundsUnknown then p1.PurchaseErrorInvalidFundsUnknownText elseif p2 == purchaseErrorModule.PremiumOnly then p1.PurchaseErrorPremiumOnlyText else p1.PurchaseErrorUnknownFailureNoItemNameText
end

local function getModalContent(p1, p2)
	-- upvalues: promptStateModule (ref), fFlagPurchaseModalTimedOptionExtension (ref), formatTextWithParamsModule (ref), purchaseErrorModule (ref), formatEconomicRestrictionText (ref), fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (ref), getPurchaseErrorText (ref)
	local promptState = p2.promptState
	local purchaseError = p2.purchaseError
	
	return if promptState == promptStateModule.PurchaseComplete then if p2.useUnifiedPurchaseCompletionModal then if p2.isMultiItem then {
		messageText = p1.MultiItemPurchaseCompleteBody,
		titleText = p1.PurchaseCompleteTitle
	} elseif fFlagPurchaseModalTimedOptionExtension and p2.completionMessage then {
		messageText = p2.completionMessage,
		titleText = p1.PurchaseCompleteTitle
	} else {
		messageText = formatTextWithParamsModule(p1.PurchaseCompleteBody, { ITEM_NAME = p2.productInfo.name }),
		titleText = p1.PurchaseCompleteTitle
	} else {
		messageText = formatTextWithParamsModule(p1.PurchaseCompleteSucceededText, { ITEM_NAME = p2.productInfo.name }),
		titleText = p1.BuyItemTitle
	} elseif promptState == promptStateModule.U13PaymentModal then {
		messageText = p1.ScaryModalOneText,
		titleText = p1.BuyItemTitle
	} elseif promptState == promptStateModule.U13MonthlyThreshold1Modal then {
		messageText = p1.ScaryModalTwoText,
		titleText = p1.BuyItemTitle
	} elseif promptState == promptStateModule.U13MonthlyThreshold2Modal then {
		messageText = p1.ScaryModalParentalText,
		titleText = p1.BuyItemTitle
	} elseif promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then {
		messageText = p1.ParentalConsentText,
		titleText = p1.BuyItemTitle
	} elseif promptState == promptStateModule.Error then if purchaseError == purchaseErrorModule.UnknownFailure then {
		messageText = formatTextWithParamsModule(p1.PurchaseErrorUnknownFailureText, { ITEM_NAME = p2.productInfo.name }),
		titleText = p1.ErrorTitle
	} elseif purchaseError == purchaseErrorModule.TwoFactorNeededSettings or p2.isGenericChallengeResponse(purchaseError) then {
		messageText = p1.Enable2SVLogoutText,
		titleText = p1.ErrorTitle
	} elseif purchaseError == purchaseErrorModule.EconomicRestriction then {
		messageText = formatEconomicRestrictionText(p1, {
			violationType = p2.economicRestrictionError.violationType,
			timeoutMinutes = p2.economicRestrictionError.timeoutMinutes
		}, true),
		titleText = p1.ErrorTitle
	} elseif fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase and purchaseError == purchaseErrorModule.PendingProductsLimitExceeded then {
		messageText = p1.DevProductPendingProductsLimitExceededMessageText,
		titleText = p1.DevProductPendingProductsLimitExceededTitleText
	} else {
		messageText = getPurchaseErrorText(p1, purchaseError),
		titleText = p1.ErrorTitle
	} else {
		messageText = p1.PurchaseErrorUnknownFailureNoItemNameText,
		titleText = p1.ErrorTitle
	}
end

local function getButtonStackInfo(p1, p2)
	-- upvalues: buttonType (ref)
	return if p1.includeCancelButton then {
		{
			props = {
				onActivated = p1.cancelButtonPressed,
				text = p2.CancelPurchaseText,
				inputIcon = if p1.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
			}
		},
		{
			buttonType = buttonType.PrimarySystem,
			props = {
				onActivated = p1.confirmButtonPressed,
				text = p2.OkButtonText,
				inputIcon = if p1.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			}
		}
	} else {
		{
			buttonType = buttonType.PrimarySystem,
			props = {
				onActivated = p1.confirmButtonPressed,
				text = p2.OkButtonText,
				inputIcon = if p1.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			}
		}
	}
end

local function ProductPurchasePrompt(p1)
	-- upvalues: fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (ref), addEconomicRestrictionKeysToLocalization (ref), useLocalization (ref), useMemo (ref), getModalContent (ref), useEffect (ref), logProductPurchasePromptCounterModule (ref), purchaseErrorModule (ref), default (ref), universalEconomicRestrictionsCounter (ref), economicRestrictionsSurface (ref), promptStateModule (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), appContextModule (ref), reactModule (ref), unifiedPurchaseCompletionModalV2 (ref), unifiedPurchaseCompletionModal (ref), interactiveAlert (ref), getButtonStackInfo (ref)
	local t = {
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
		DevProductPendingProductsLimitExceededTitleText = if fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase then "Purchasing.PurchaseDialog.Heading.PendingDeveloperProductLimitReached" else nil,
		DevProductPendingProductsLimitExceededMessageText = if fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase then "Purchasing.PurchaseDialog.Message.PendingDeveloperProductLimitReached" else nil,
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	}
	addEconomicRestrictionKeysToLocalization(t)
	local var1 = useLocalization(t)
	local var2 = useMemo(function()
		-- upvalues: getModalContent (copy), var1 (ref), p1 (ref)
		return getModalContent(var1, p1)
	end, { p1 })
	useEffect(function()
		-- upvalues: logProductPurchasePromptCounterModule (copy), p1 (ref), purchaseErrorModule (copy), default (copy), universalEconomicRestrictionsCounter (copy), economicRestrictionsSurface (copy)
		logProductPurchasePromptCounterModule(p1.promptState, p1.purchaseError, p1.surface, p1.productType)
		
		if p1.purchaseError == purchaseErrorModule.EconomicRestriction then
			default:logRobloxTelemetryCounter(universalEconomicRestrictionsCounter, 1, {
				surface = economicRestrictionsSurface.InExperience,
				failureReason = tostring(p1.economicRestrictionError.violationType)
			})
		end
	end, { p1.purchaseError })
	
	if not p1.useUnifiedPurchaseCompletionModal then
		return reactModule.createElement(interactiveAlert, {
			screenSize = p1.screenSize,
			title = var2.titleText,
			titleIcon = p1.titleIcon,
			bodyText = var2.messageText,
			buttonStackInfo = { buttons = getButtonStackInfo(p1, var1) }
		})
	end
	local launchAfterPurchaseButtonPressed = p1.launchAfterPurchaseButtonPressed
	local var3 = launchAfterPurchaseButtonPressed ~= nil and p1.promptState == promptStateModule.PurchaseComplete
	local t_1 = {
		text = var1.OkButtonText,
		onActivated = if launchAfterPurchaseButtonPressed == nil or p1.promptState ~= promptStateModule.PurchaseComplete then p1.confirmButtonPressed else launchAfterPurchaseButtonPressed,
		onClose = p1.cancelButtonPressed,
		onShown = if var3 then p1.launchAfterPurchaseButtonShown else nil
	}
	
	return if fFlagAddCenterDialogForUnifiedPurchaseModal and appContextModule.get() == appContextModule.Enum.IN_APP then reactModule.createElement(unifiedPurchaseCompletionModalV2, {
		title = var2.titleText,
		isError = p1.promptState ~= promptStateModule.PurchaseComplete,
		bodyText = var2.messageText,
		buttons = t_1,
		enableLaunchAfterPurchase = var3
	}) else reactModule.createElement(unifiedPurchaseCompletionModal, {
		title = var2.titleText,
		isError = p1.promptState ~= promptStateModule.PurchaseComplete,
		bodyText = var2.messageText,
		buttons = t_1,
		enableLaunchAfterPurchase = var3
	})
end

return function(p1)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), ProductPurchasePrompt (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchasePrompt = reactModule.createElement(ProductPurchasePrompt, p1)
	})
end