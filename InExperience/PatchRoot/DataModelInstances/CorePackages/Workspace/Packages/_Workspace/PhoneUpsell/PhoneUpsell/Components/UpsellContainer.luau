local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local usePhoneVerificationUpsellPropsModule = require(phoneUpsell.Components.usePhoneVerificationUpsellProps)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local _ = require(parent.LuauPolyfill)
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local phoneVerificationUpsellStateModule = require(phoneUpsell.Components.PhoneVerificationUpsellState)
local entryViewModule = require(phoneUpsell.Components.EntryView)
local addPhoneViewModule = require(phoneUpsell.Components.AddPhoneView)
local verifyPhoneViewModule = require(phoneUpsell.Components.VerifyPhoneView)
local phoneVerificationStatusOverlayModule = require(phoneUpsell.Components.PhoneVerificationStatusOverlay)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule = require(phoneUpsell.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell)
local getFFlagPhoneUseParentSizeForScreenSizeModule = require(phoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local getFFlagDisableVerifyPhoneViewOnSuccessModule = require(phoneUpsell.Flags.GetFFlagDisableVerifyPhoneViewOnSuccess)
local getFFlagFixIosOtpAutofillModule = require(phoneUpsell.Flags.GetFFlagFixIosOtpAutofill)
local fFlagHomePhoneVerificationUpsellNewCopy = require(parent.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy

local var15 = function() end

local t = {
	origin = "",
	eventContext = "",
	addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone",
	addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
	extraButtonTextKey = "",
	shouldAutofillAndroidPhoneNumberAtLaunch = false,
	isOTPInputTypeEnabled = false,
	isPhoneNumberTextTypeEnabled = false,
	alwaysShowAddPhoneLegalText = false,
	requireAddPhoneLegalTextCheckbox = false,
	onSuccess = var15,
	onFailure = var15,
	onCancelled = var15,
	onExtraButtonClick = var15,
	closeUpsell = var15,
	showWebpage = function(_) end
}

return function(p0)
	-- upvalues: mergePropsModule (ref), t (ref), usePhoneVerificationUpsellPropsModule (ref), reactModule (ref), loading (ref), iconSize (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref), roactModule (ref), phoneVerificationUpsellStateModule (ref), entryViewModule (ref), addPhoneViewModule (ref), getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (ref), fFlagHomePhoneVerificationUpsellNewCopy (ref), verifyPhoneViewModule (ref), getFFlagDisableVerifyPhoneViewOnSuccessModule (ref), getFFlagFixIosOtpAutofillModule (ref), phoneVerificationStatusOverlayModule (ref)
	local var17 = mergePropsModule(t, p0)
	local var18 = usePhoneVerificationUpsellPropsModule(var17)
	
	return reactModule.createElement(if getFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else reactModule.Fragment, if getFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[roactModule.Change.AbsoluteSize] = function(p1)
			-- upvalues: var18 (ref)
			var18.setParentSize(p1.AbsoluteSize)
		end
	} else nil, {
		Entry = var18.phoneUpsellState == phoneVerificationUpsellStateModule.Entry and (var17.entryConfig and reactModule.createElement(entryViewModule, {
			screenSize = var18.screenSize,
			onClose = var18.handleCloseClick,
			titleKey = var17.entryConfig.titleKey,
			descriptionKey = var17.entryConfig.descriptionKey,
			buttonKey = var17.entryConfig.buttonKey,
			onButtonClick = var18.proceedToAddPhone,
			extraButtonKey = var17.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = var17.entryConfig.extraButtonConfig.onExtraButtonClick
		})),
		AddPhone = var18.phoneUpsellState == phoneVerificationUpsellStateModule.AddPhone and reactModule.createElement(addPhoneViewModule, {
			screenSize = var18.screenSize,
			countryCode = var18.countryCode,
			setCountryCode = var18.setCountryCode,
			phoneNumber = var18.phoneNumber,
			errorMessage = var18.addPhoneErrorMessage,
			isDisabled = var18.isDisabled,
			onPhoneNumberTextChange = var18.onPhoneNumberTextChange,
			onSetPhoneNumber = var18.handleSetPhone,
			onClose = var18.handleCloseClick,
			onTermsOfUseClick = var18.navigateToSMSTerms,
			onPrivacyPolicyClick = var18.navigateToPrivacy,
			onPhoneInputFocus = var18.onPhoneInputFocus,
			onCountryCodeSelectorClick = var18.onCountryCodeSelectorClick,
			isKeyboardShowing = var18.isKeyboardShowing,
			keyboardHeight = var18.onScreenKeyboardHeight,
			usePhoneNumberTextType = getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and var18.isPhoneNumberTextTypeEnabled,
			titleKey = var17.addPhoneTitleKey,
			descriptionKey = var17.addPhoneDescriptionKey,
			buttonKey = var17.addPhoneButtonKey,
			legalTextKey = var17.addPhoneLegalTextKey,
			extraButtonKey = var17.extraButtonTextKey,
			onExtraButtonClick = var17.onExtraButtonClick,
			alwaysShowLegalText = var17.alwaysShowAddPhoneLegalText,
			requireLegalTextCheckbox = var17.requireAddPhoneLegalTextCheckbox,
			disableLegalText = var17.disableLegalText,
			shouldShowVerificationText = if fFlagHomePhoneVerificationUpsellNewCopy then var17.shouldShowVerificationText else nil
		}),
		VerifyPhone = var18.phoneUpsellState == phoneVerificationUpsellStateModule.VerifyPhone and reactModule.createElement(verifyPhoneViewModule, {
			screenSize = var18.screenSize,
			phoneNumber = var18.phoneNumber,
			prefix = var18.countryCode.prefix,
			code = var18.code,
			errorMessage = var18.verifyPhoneErrorMessage,
			isDisabled = if getFFlagDisableVerifyPhoneViewOnSuccessModule() then var18.isDisabled else nil,
			onCodeTextChange = var18.onCodeTextChange,
			onResendPhoneCode = var18.handleResendCode,
			onClose = var18.handleCloseClick,
			returnToAddPhone = var18.returnToAddPhone,
			onCodeInputFocus = var18.onCodeInputFocus,
			isKeyboardShowing = var18.isKeyboardShowing,
			keyboardHeight = var18.onScreenKeyboardHeight,
			useOTPInputType = if getFFlagFixIosOtpAutofillModule() then var18.isOTPInputTypeEnabled else var17.isOTPInputTypeEnabled,
			extraButtonKey = var17.verifyPhoneExtraButtonKey,
			onExtraButtonClick = var17.onVerifyPhoneExtraButtonClick
		}),
		LoadingOverlay = var18.isLoading and reactModule.createElement(phoneVerificationStatusOverlayModule, {
			image = reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}),
			text = var18.verifyingKey
		})
	})
end