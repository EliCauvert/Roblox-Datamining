local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local UsePhoneVerificationUpsellPropsModule = require(PhoneUpsell.Components.usePhoneVerificationUpsellProps)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local _ = require(Parent.LuauPolyfill)
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local PhoneVerificationUpsellStateModule = require(PhoneUpsell.Components.PhoneVerificationUpsellState)
local InGameEntryViewModule = require(PhoneUpsell.Components.InGame.InGameEntryView)
local InGameAddPhoneViewModule = require(PhoneUpsell.Components.InGame.InGameAddPhoneView)
local InGameVerifyPhoneViewModule = require(PhoneUpsell.Components.InGame.InGameVerifyPhoneView)
local GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule = require(PhoneUpsell.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell)
local GetFFlagPhoneUseParentSizeForScreenSizeModule = require(PhoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local GetFFlagFixIosOtpAutofillModule = require(PhoneUpsell.Flags.GetFFlagFixIosOtpAutofill)

local function CloseUpsell() end

local config = {
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
	onSuccess = CloseUpsell,
	onFailure = CloseUpsell,
	onCancelled = CloseUpsell,
	onExtraButtonClick = CloseUpsell,
	closeUpsell = CloseUpsell,
	showWebpage = function(_) end
}

return function(p1)
	-- upvalues: MergePropsModule (copy), config (copy), UsePhoneVerificationUpsellPropsModule (copy), ReactModule (copy), GetFFlagPhoneUseParentSizeForScreenSizeModule (copy), RoactModule (copy), PhoneVerificationUpsellStateModule (copy), InGameEntryViewModule (copy), InGameAddPhoneViewModule (copy), GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (copy), InGameVerifyPhoneViewModule (copy), GetFFlagFixIosOtpAutofillModule (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	local UsePhoneVerificationUpsellPropsModuleResult = UsePhoneVerificationUpsellPropsModule(MergePropsModuleResult)
	
	return ReactModule.createElement(if GetFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else ReactModule.Fragment, if GetFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UsePhoneVerificationUpsellPropsModuleResult (copy)
			UsePhoneVerificationUpsellPropsModuleResult.setParentSize(Frame.AbsoluteSize)
		end
	} else nil, {
		Entry = UsePhoneVerificationUpsellPropsModuleResult.phoneUpsellState == PhoneVerificationUpsellStateModule.Entry and (MergePropsModuleResult.entryConfig and ReactModule.createElement(InGameEntryViewModule, {
			screenSize = UsePhoneVerificationUpsellPropsModuleResult.screenSize,
			onClose = UsePhoneVerificationUpsellPropsModuleResult.handleCloseClick,
			titleKey = MergePropsModuleResult.entryConfig.titleKey,
			descriptionKey = MergePropsModuleResult.entryConfig.descriptionKey,
			buttonKey = MergePropsModuleResult.entryConfig.buttonKey,
			onButtonClick = UsePhoneVerificationUpsellPropsModuleResult.proceedToAddPhone,
			extraButtonKey = MergePropsModuleResult.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = MergePropsModuleResult.closeUpsell,
			countryCode = UsePhoneVerificationUpsellPropsModuleResult.countryCode,
			onTermsOfUseClick = UsePhoneVerificationUpsellPropsModuleResult.navigateToSMSTerms,
			onPrivacyPolicyClick = UsePhoneVerificationUpsellPropsModuleResult.navigateToPrivacy,
			legalTextKey = MergePropsModuleResult.entryConfig.legalTextKey
		})),
		AddPhone = UsePhoneVerificationUpsellPropsModuleResult.phoneUpsellState == PhoneVerificationUpsellStateModule.AddPhone and ReactModule.createElement(InGameAddPhoneViewModule, {
			extraButtonKey = "Feature.VerificationUpsell.Action.NotNow",
			screenSize = UsePhoneVerificationUpsellPropsModuleResult.screenSize,
			countryCode = UsePhoneVerificationUpsellPropsModuleResult.countryCode,
			setCountryCode = UsePhoneVerificationUpsellPropsModuleResult.setCountryCode,
			phoneNumber = UsePhoneVerificationUpsellPropsModuleResult.phoneNumber,
			errorMessage = UsePhoneVerificationUpsellPropsModuleResult.addPhoneErrorMessage,
			isDisabled = UsePhoneVerificationUpsellPropsModuleResult.isDisabled,
			onPhoneNumberTextChange = UsePhoneVerificationUpsellPropsModuleResult.onPhoneNumberTextChange,
			onSetPhoneNumber = UsePhoneVerificationUpsellPropsModuleResult.handleSetPhone,
			onClose = UsePhoneVerificationUpsellPropsModuleResult.handleCloseClick,
			onCountryCodeSelectorClick = UsePhoneVerificationUpsellPropsModuleResult.onCountryCodeSelectorClick,
			isKeyboardShowing = UsePhoneVerificationUpsellPropsModuleResult.isKeyboardShowing,
			keyboardHeight = UsePhoneVerificationUpsellPropsModuleResult.onScreenKeyboardHeight,
			titleKey = MergePropsModuleResult.addPhoneTitleKey,
			buttonKey = MergePropsModuleResult.addPhoneButtonKey,
			onExtraButtonClick = MergePropsModuleResult.closeUpsell,
			usePhoneNumberTextType = GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and UsePhoneVerificationUpsellPropsModuleResult.isPhoneNumberTextTypeEnabled,
			descriptionKey = MergePropsModuleResult.addPhoneDescriptionKey,
			legalTextKey = MergePropsModuleResult.addPhoneLegalTextKey,
			onPhoneInputFocus = UsePhoneVerificationUpsellPropsModuleResult.onPhoneInputFocus
		}),
		VerifyPhone = UsePhoneVerificationUpsellPropsModuleResult.phoneUpsellState == PhoneVerificationUpsellStateModule.VerifyPhone and ReactModule.createElement(InGameVerifyPhoneViewModule, {
			extraButtonKey = "Feature.VerificationUpsell.Action.EditPhoneNumber",
			screenSize = UsePhoneVerificationUpsellPropsModuleResult.screenSize,
			phoneNumber = UsePhoneVerificationUpsellPropsModuleResult.phoneNumber,
			prefix = UsePhoneVerificationUpsellPropsModuleResult.countryCode.prefix,
			code = UsePhoneVerificationUpsellPropsModuleResult.code,
			errorMessage = UsePhoneVerificationUpsellPropsModuleResult.verifyPhoneErrorMessage,
			onCodeTextChange = UsePhoneVerificationUpsellPropsModuleResult.onCodeTextChange,
			onResendPhoneCode = UsePhoneVerificationUpsellPropsModuleResult.handleResendCode,
			onClose = UsePhoneVerificationUpsellPropsModuleResult.handleCloseClick,
			returnToAddPhone = UsePhoneVerificationUpsellPropsModuleResult.returnToAddPhone,
			onCodeInputFocus = UsePhoneVerificationUpsellPropsModuleResult.onCodeInputFocus,
			isKeyboardShowing = UsePhoneVerificationUpsellPropsModuleResult.isKeyboardShowing,
			keyboardHeight = UsePhoneVerificationUpsellPropsModuleResult.onScreenKeyboardHeight,
			useOTPInputType = if GetFFlagFixIosOtpAutofillModule() then UsePhoneVerificationUpsellPropsModuleResult.isOTPInputTypeEnabled else MergePropsModuleResult.isOTPInputTypeEnabled,
			onExtraButtonClick = UsePhoneVerificationUpsellPropsModuleResult.returnToAddPhone
		})
	})
end