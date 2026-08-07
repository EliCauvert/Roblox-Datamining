local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local usePhoneVerificationUpsellPropsModule = require(phoneUpsell.Components.usePhoneVerificationUpsellProps)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local _ = require(parent.LuauPolyfill)
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local phoneVerificationUpsellStateModule = require(phoneUpsell.Components.PhoneVerificationUpsellState)
local inGameEntryViewModule = require(phoneUpsell.Components.InGame.InGameEntryView)
local inGameAddPhoneViewModule = require(phoneUpsell.Components.InGame.InGameAddPhoneView)
local inGameVerifyPhoneViewModule = require(phoneUpsell.Components.InGame.InGameVerifyPhoneView)
local getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule = require(phoneUpsell.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell)
local getFFlagPhoneUseParentSizeForScreenSizeModule = require(phoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local getFFlagFixIosOtpAutofillModule = require(phoneUpsell.Flags.GetFFlagFixIosOtpAutofill)

local var12 = function() --[[ line: 85 ]] end

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
	onSuccess = var12,
	onFailure = var12,
	onCancelled = var12,
	onExtraButtonClick = var12,
	closeUpsell = var12,
	showWebpage = function(_) --[[ line: 103 ]] end
}

return function(p0) --[[ line: 106 | named "InGameUpsellContainer" ]]
	-- upvalues: mergePropsModule (ref), t (ref), usePhoneVerificationUpsellPropsModule (ref), reactModule (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref), roactModule (ref), phoneVerificationUpsellStateModule (ref), inGameEntryViewModule (ref), inGameAddPhoneViewModule (ref), getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (ref), inGameVerifyPhoneViewModule (ref), getFFlagFixIosOtpAutofillModule (ref)
	local var14 = mergePropsModule(t, p0)
	local var15 = usePhoneVerificationUpsellPropsModule(var14)
	
	return reactModule.createElement(if getFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else reactModule.Fragment, if getFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[roactModule.Change.AbsoluteSize] = function(p1) --[[ line: 117 ]]
			-- upvalues: var15 (ref)
			var15.setParentSize(p1.AbsoluteSize)
		end
	} else nil, {
		Entry = var15.phoneUpsellState == phoneVerificationUpsellStateModule.Entry and (var14.entryConfig and reactModule.createElement(inGameEntryViewModule, {
			screenSize = var15.screenSize,
			onClose = var15.handleCloseClick,
			titleKey = var14.entryConfig.titleKey,
			descriptionKey = var14.entryConfig.descriptionKey,
			buttonKey = var14.entryConfig.buttonKey,
			onButtonClick = var15.proceedToAddPhone,
			extraButtonKey = var14.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = var14.closeUpsell,
			countryCode = var15.countryCode,
			onTermsOfUseClick = var15.navigateToSMSTerms,
			onPrivacyPolicyClick = var15.navigateToPrivacy,
			legalTextKey = var14.entryConfig.legalTextKey
		})),
		AddPhone = var15.phoneUpsellState == phoneVerificationUpsellStateModule.AddPhone and reactModule.createElement(inGameAddPhoneViewModule, {
			extraButtonKey = "Feature.VerificationUpsell.Action.NotNow",
			screenSize = var15.screenSize,
			countryCode = var15.countryCode,
			setCountryCode = var15.setCountryCode,
			phoneNumber = var15.phoneNumber,
			errorMessage = var15.addPhoneErrorMessage,
			isDisabled = var15.isDisabled,
			onPhoneNumberTextChange = var15.onPhoneNumberTextChange,
			onSetPhoneNumber = var15.handleSetPhone,
			onClose = var15.handleCloseClick,
			onCountryCodeSelectorClick = var15.onCountryCodeSelectorClick,
			isKeyboardShowing = var15.isKeyboardShowing,
			keyboardHeight = var15.onScreenKeyboardHeight,
			titleKey = var14.addPhoneTitleKey,
			buttonKey = var14.addPhoneButtonKey,
			onExtraButtonClick = var14.closeUpsell,
			usePhoneNumberTextType = getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and var15.isPhoneNumberTextTypeEnabled,
			descriptionKey = var14.addPhoneDescriptionKey,
			legalTextKey = var14.addPhoneLegalTextKey,
			onPhoneInputFocus = var15.onPhoneInputFocus
		}),
		VerifyPhone = var15.phoneUpsellState == phoneVerificationUpsellStateModule.VerifyPhone and reactModule.createElement(inGameVerifyPhoneViewModule, {
			extraButtonKey = "Feature.VerificationUpsell.Action.EditPhoneNumber",
			screenSize = var15.screenSize,
			phoneNumber = var15.phoneNumber,
			prefix = var15.countryCode.prefix,
			code = var15.code,
			errorMessage = var15.verifyPhoneErrorMessage,
			onCodeTextChange = var15.onCodeTextChange,
			onResendPhoneCode = var15.handleResendCode,
			onClose = var15.handleCloseClick,
			returnToAddPhone = var15.returnToAddPhone,
			onCodeInputFocus = var15.onCodeInputFocus,
			isKeyboardShowing = var15.isKeyboardShowing,
			keyboardHeight = var15.onScreenKeyboardHeight,
			useOTPInputType = if getFFlagFixIosOtpAutofillModule() then var15.isOTPInputTypeEnabled else var14.isOTPInputTypeEnabled,
			onExtraButtonClick = var15.returnToAddPhone
		})
	})
end