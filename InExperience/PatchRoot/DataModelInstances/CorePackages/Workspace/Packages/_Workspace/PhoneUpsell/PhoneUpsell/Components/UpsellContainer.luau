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

local var1 = function() end

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
	onSuccess = var1,
	onFailure = var1,
	onCancelled = var1,
	onExtraButtonClick = var1,
	closeUpsell = var1,
	showWebpage = function(_) end
}

return function(p1)
	-- upvalues: mergePropsModule (ref), t (ref), usePhoneVerificationUpsellPropsModule (ref), reactModule (ref), loading (ref), iconSize (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref), roactModule (ref), phoneVerificationUpsellStateModule (ref), entryViewModule (ref), addPhoneViewModule (ref), getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (ref), fFlagHomePhoneVerificationUpsellNewCopy (ref), verifyPhoneViewModule (ref), getFFlagDisableVerifyPhoneViewOnSuccessModule (ref), getFFlagFixIosOtpAutofillModule (ref), phoneVerificationStatusOverlayModule (ref)
	local var2 = mergePropsModule(t, p1)
	local var3 = usePhoneVerificationUpsellPropsModule(var2)
	
	return reactModule.createElement(if getFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else reactModule.Fragment, if getFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var3 (ref)
			var3.setParentSize(p2.AbsoluteSize)
		end
	} else nil, {
		Entry = var3.phoneUpsellState == phoneVerificationUpsellStateModule.Entry and (var2.entryConfig and reactModule.createElement(entryViewModule, {
			screenSize = var3.screenSize,
			onClose = var3.handleCloseClick,
			titleKey = var2.entryConfig.titleKey,
			descriptionKey = var2.entryConfig.descriptionKey,
			buttonKey = var2.entryConfig.buttonKey,
			onButtonClick = var3.proceedToAddPhone,
			extraButtonKey = var2.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = var2.entryConfig.extraButtonConfig.onExtraButtonClick
		})),
		AddPhone = var3.phoneUpsellState == phoneVerificationUpsellStateModule.AddPhone and reactModule.createElement(addPhoneViewModule, {
			screenSize = var3.screenSize,
			countryCode = var3.countryCode,
			setCountryCode = var3.setCountryCode,
			phoneNumber = var3.phoneNumber,
			errorMessage = var3.addPhoneErrorMessage,
			isDisabled = var3.isDisabled,
			onPhoneNumberTextChange = var3.onPhoneNumberTextChange,
			onSetPhoneNumber = var3.handleSetPhone,
			onClose = var3.handleCloseClick,
			onTermsOfUseClick = var3.navigateToSMSTerms,
			onPrivacyPolicyClick = var3.navigateToPrivacy,
			onPhoneInputFocus = var3.onPhoneInputFocus,
			onCountryCodeSelectorClick = var3.onCountryCodeSelectorClick,
			isKeyboardShowing = var3.isKeyboardShowing,
			keyboardHeight = var3.onScreenKeyboardHeight,
			usePhoneNumberTextType = getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and var3.isPhoneNumberTextTypeEnabled,
			titleKey = var2.addPhoneTitleKey,
			descriptionKey = var2.addPhoneDescriptionKey,
			buttonKey = var2.addPhoneButtonKey,
			legalTextKey = var2.addPhoneLegalTextKey,
			extraButtonKey = var2.extraButtonTextKey,
			onExtraButtonClick = var2.onExtraButtonClick,
			alwaysShowLegalText = var2.alwaysShowAddPhoneLegalText,
			requireLegalTextCheckbox = var2.requireAddPhoneLegalTextCheckbox,
			disableLegalText = var2.disableLegalText,
			shouldShowVerificationText = if fFlagHomePhoneVerificationUpsellNewCopy then var2.shouldShowVerificationText else nil
		}),
		VerifyPhone = var3.phoneUpsellState == phoneVerificationUpsellStateModule.VerifyPhone and reactModule.createElement(verifyPhoneViewModule, {
			screenSize = var3.screenSize,
			phoneNumber = var3.phoneNumber,
			prefix = var3.countryCode.prefix,
			code = var3.code,
			errorMessage = var3.verifyPhoneErrorMessage,
			isDisabled = if getFFlagDisableVerifyPhoneViewOnSuccessModule() then var3.isDisabled else nil,
			onCodeTextChange = var3.onCodeTextChange,
			onResendPhoneCode = var3.handleResendCode,
			onClose = var3.handleCloseClick,
			returnToAddPhone = var3.returnToAddPhone,
			onCodeInputFocus = var3.onCodeInputFocus,
			isKeyboardShowing = var3.isKeyboardShowing,
			keyboardHeight = var3.onScreenKeyboardHeight,
			useOTPInputType = if getFFlagFixIosOtpAutofillModule() then var3.isOTPInputTypeEnabled else var2.isOTPInputTypeEnabled,
			extraButtonKey = var2.verifyPhoneExtraButtonKey,
			onExtraButtonClick = var2.onVerifyPhoneExtraButtonClick
		}),
		LoadingOverlay = var3.isLoading and reactModule.createElement(phoneVerificationStatusOverlayModule, {
			image = reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}),
			text = var3.verifyingKey
		})
	})
end