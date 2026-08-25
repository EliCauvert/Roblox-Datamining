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
local productPurchasePromptCounter = IAPExperienceModule.Counters.ProductPurchasePromptCounter.ProductPurchasePromptCounter
local default = require(parent.LoggingProtocol).default
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagPurchaseModalTimedOptionExtension = require(parent.SharedFlags).FFlagPurchaseModalTimedOptionExtension
local unifiedPurchaseCompletionModal = IAPExperienceModule.UnifiedPurchaseCompletionModal
local unifiedPurchaseCompletionModalV2 = IAPExperienceModule.UnifiedPurchaseCompletionModalV2
local fFlagFixPurchasingErrorCounterModule = require(purchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local _ = require(parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local appContextModule = require(purchasePrompt.Utils.AppContext)
local fFlagAddCenterDialogForUnifiedPurchaseModal = require(parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase = require(parent.SharedFlags).FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase

local function getPurchaseErrorText(p0, p1)
	-- upvalues: purchaseErrorModule (ref)
	return if p1 == purchaseErrorModule.CannotGetBalance then p0.PurchaseErrorCannotGetBalanceText elseif p1 == purchaseErrorModule.CannotGetItemPrice then p0.PurchaseErrorCannotGetItemPriceText elseif p1 == purchaseErrorModule.NotForSale then p0.PurchaseErrorNotForSaleText elseif p1 == purchaseErrorModule.NotForSaleHere then p0.PurchaseErrorNotForSaleHereText elseif p1 == purchaseErrorModule.AlreadyOwn then p0.PurchaseErrorAlreadyOwnText elseif p1 == purchaseErrorModule.Under13 then p0.PurchaseErrorUnder13Text elseif p1 == purchaseErrorModule.Limited then p0.PurchaseErrorLimitedText elseif p1 == purchaseErrorModule.ThirdPartyDisabled then p0.PurchaseErrorThirdPartyDisabledText elseif p1 == purchaseErrorModule.NotEnoughRobux then p0.PurchaseErrorNotEnoughRobuxText elseif p1 == purchaseErrorModule.NotEnoughRobuxXbox then p0.PurchaseErrorNotEnoughRobuxXboxText elseif p1 == purchaseErrorModule.NotEnoughRobuxNoUpsell then p0.PurchaseErrorNotEnoughRobuxNoUpsellText elseif p1 == purchaseErrorModule.TwoFactorNeeded then p0.PurchaseErrorTwoFactorNeededText elseif p1 == purchaseErrorModule.TwoFactorNeededSettings then p0.PurchaseErrorTwoFactorNeededSettingsText elseif p1 == purchaseErrorModule.UnknownFailure then p0.PurchaseErrorUnknownFailureText elseif p1 == purchaseErrorModule.UnknownFailureNoItemName then p0.PurchaseErrorUnknownFailureNoItemNameText elseif p1 == purchaseErrorModule.PurchaseDisabled then p0.PurchaseErrorPurchaseDisabledText elseif p1 == purchaseErrorModule.InvalidFunds then p0.PurchaseErrorInvalidFundsText elseif p1 == purchaseErrorModule.InvalidFundsUnknown then p0.PurchaseErrorInvalidFundsUnknownText elseif p1 == purchaseErrorModule.PremiumOnly then p0.PurchaseErrorPremiumOnlyText else p0.PurchaseErrorUnknownFailureNoItemNameText
end

local function getModalContent(p2, p3)
	-- upvalues: promptStateModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagPurchaseModalTimedOptionExtension (ref), formatTextWithParamsModule (ref), purchaseErrorModule (ref), formatEconomicRestrictionText (ref), fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (ref), getPurchaseErrorText (ref)
	local promptState = p3.promptState
	local purchaseError = p3.purchaseError
	
	return if promptState == promptStateModule.PurchaseComplete then if fFlagEnableUnifiedProductPurchaseFlow and p3.useUnifiedPurchaseCompletionModal then if p3.isMultiItem then {
		messageText = p2.MultiItemPurchaseCompleteBody,
		titleText = p2.PurchaseCompleteTitle
	} elseif fFlagPurchaseModalTimedOptionExtension and p3.completionMessage then {
		messageText = p3.completionMessage,
		titleText = p2.PurchaseCompleteTitle
	} else {
		messageText = formatTextWithParamsModule(p2.PurchaseCompleteBody, { ITEM_NAME = p3.productInfo.name }),
		titleText = p2.PurchaseCompleteTitle
	} else {
		messageText = formatTextWithParamsModule(p2.PurchaseCompleteSucceededText, { ITEM_NAME = p3.productInfo.name }),
		titleText = p2.BuyItemTitle
	} elseif promptState == promptStateModule.U13PaymentModal then {
		messageText = p2.ScaryModalOneText,
		titleText = p2.BuyItemTitle
	} elseif promptState == promptStateModule.U13MonthlyThreshold1Modal then {
		messageText = p2.ScaryModalTwoText,
		titleText = p2.BuyItemTitle
	} elseif promptState == promptStateModule.U13MonthlyThreshold2Modal then {
		messageText = p2.ScaryModalParentalText,
		titleText = p2.BuyItemTitle
	} elseif promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then {
		messageText = p2.ParentalConsentText,
		titleText = p2.BuyItemTitle
	} elseif promptState == promptStateModule.Error then if purchaseError == purchaseErrorModule.UnknownFailure then {
		messageText = formatTextWithParamsModule(p2.PurchaseErrorUnknownFailureText, { ITEM_NAME = p3.productInfo.name }),
		titleText = p2.ErrorTitle
	} elseif purchaseError == purchaseErrorModule.TwoFactorNeededSettings or p3.isGenericChallengeResponse(purchaseError) then {
		messageText = p2.Enable2SVLogoutText,
		titleText = p2.ErrorTitle
	} elseif purchaseError == purchaseErrorModule.EconomicRestriction then {
		messageText = formatEconomicRestrictionText(p2, {
			violationType = p3.economicRestrictionError.violationType,
			timeoutMinutes = p3.economicRestrictionError.timeoutMinutes
		}, true),
		titleText = p2.ErrorTitle
	} elseif fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase and purchaseError == purchaseErrorModule.PendingProductsLimitExceeded then {
		messageText = p2.DevProductPendingProductsLimitExceededMessageText,
		titleText = p2.DevProductPendingProductsLimitExceededTitleText
	} else {
		messageText = getPurchaseErrorText(p2, purchaseError),
		titleText = p2.ErrorTitle
	} else {
		messageText = p2.PurchaseErrorUnknownFailureNoItemNameText,
		titleText = p2.ErrorTitle
	}
end

local function getButtonStackInfo(p4, p5)
	-- upvalues: buttonType (ref)
	return if p4.includeCancelButton then {
		{
			props = {
				onActivated = p4.cancelButtonPressed,
				text = p5.CancelPurchaseText,
				inputIcon = if p4.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
			}
		},
		{
			buttonType = buttonType.PrimarySystem,
			props = {
				onActivated = p4.confirmButtonPressed,
				text = p5.OkButtonText,
				inputIcon = if p4.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			}
		}
	} else {
		{
			buttonType = buttonType.PrimarySystem,
			props = {
				onActivated = p4.confirmButtonPressed,
				text = p5.OkButtonText,
				inputIcon = if p4.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			}
		}
	}
end

local function ProductPurchasePrompt(p6)
	-- upvalues: fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (ref), addEconomicRestrictionKeysToLocalization (ref), useLocalization (ref), useMemo (ref), getModalContent (ref), useEffect (ref), fFlagFixPurchasingErrorCounterModule (ref), default (ref), productPurchasePromptCounter (ref), purchaseErrorModule (ref), promptStateModule (ref), universalEconomicRestrictionsCounter (ref), economicRestrictionsSurface (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), appContextModule (ref), reactModule (ref), unifiedPurchaseCompletionModalV2 (ref), unifiedPurchaseCompletionModal (ref), interactiveAlert (ref), getButtonStackInfo (ref)
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
	local var16 = useLocalization(t)
	local var17 = useMemo(function()
		-- upvalues: getModalContent (copy), var16 (ref), p6 (ref)
		return getModalContent(var16, p6)
	end, { p6 })
	useEffect(function()
		-- upvalues: fFlagFixPurchasingErrorCounterModule (copy), default (copy), productPurchasePromptCounter (copy), p6 (ref), purchaseErrorModule (copy), promptStateModule (copy), universalEconomicRestrictionsCounter (copy), economicRestrictionsSurface (copy)
		if fFlagFixPurchasingErrorCounterModule then
			default:logRobloxTelemetryCounter(productPurchasePromptCounter, 1, {
				promptState = tostring(p6.promptState),
				purchaseError = if purchaseErrorModule.isMember(p6.purchaseError) then tostring(p6.purchaseError) else tostring(purchaseErrorModule.UnknownFailure)
			})
		else
			default:logRobloxTelemetryCounter(productPurchasePromptCounter, 1, {
				promptState = tostring(p6.promptState),
				purchaseError = if p6.promptState == promptStateModule.Error then tostring(p6.purchaseError) else ""
			})
		end
		if p6.purchaseError == purchaseErrorModule.EconomicRestriction then
			default:logRobloxTelemetryCounter(universalEconomicRestrictionsCounter, 1, {
				surface = economicRestrictionsSurface.InExperience,
				failureReason = tostring(p6.economicRestrictionError.violationType)
			})
		end
	end, { p6.purchaseError })
	
	if not fFlagEnableUnifiedProductPurchaseFlow or not p6.useUnifiedPurchaseCompletionModal then
		return reactModule.createElement(interactiveAlert, {
			screenSize = p6.screenSize,
			title = var17.titleText,
			titleIcon = p6.titleIcon,
			bodyText = var17.messageText,
			buttonStackInfo = { buttons = getButtonStackInfo(p6, var16) }
		})
	end
	local launchAfterPurchaseButtonPressed = p6.launchAfterPurchaseButtonPressed
	local var18 = launchAfterPurchaseButtonPressed ~= nil and p6.promptState == promptStateModule.PurchaseComplete
	local t_1 = {
		text = var16.OkButtonText,
		onActivated = if launchAfterPurchaseButtonPressed == nil or p6.promptState ~= promptStateModule.PurchaseComplete then p6.confirmButtonPressed else launchAfterPurchaseButtonPressed,
		onClose = p6.cancelButtonPressed,
		onShown = if var18 then p6.launchAfterPurchaseButtonShown else nil
	}
	
	return if fFlagAddCenterDialogForUnifiedPurchaseModal and appContextModule.get() == appContextModule.Enum.IN_APP then reactModule.createElement(unifiedPurchaseCompletionModalV2, {
		title = var17.titleText,
		isError = p6.promptState ~= promptStateModule.PurchaseComplete,
		bodyText = var17.messageText,
		buttons = t_1,
		enableLaunchAfterPurchase = var18
	}) else reactModule.createElement(unifiedPurchaseCompletionModal, {
		title = var17.titleText,
		isError = p6.promptState ~= promptStateModule.PurchaseComplete,
		bodyText = var17.messageText,
		buttons = t_1,
		enableLaunchAfterPurchase = var18
	})
end

return function(p7)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), ProductPurchasePrompt (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchasePrompt = reactModule.createElement(ProductPurchasePrompt, p7)
	})
end