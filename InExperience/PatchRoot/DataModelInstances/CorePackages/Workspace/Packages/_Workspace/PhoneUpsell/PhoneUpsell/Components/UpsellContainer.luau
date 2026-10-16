local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local UsePhoneVerificationUpsellPropsModule = require(PhoneUpsell.Components.usePhoneVerificationUpsellProps)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local _ = require(Parent.LuauPolyfill)
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local PhoneVerificationUpsellStateModule = require(PhoneUpsell.Components.PhoneVerificationUpsellState)
local EntryViewModule = require(PhoneUpsell.Components.EntryView)
local AddPhoneViewModule = require(PhoneUpsell.Components.AddPhoneView)
local VerifyPhoneViewModule = require(PhoneUpsell.Components.VerifyPhoneView)
local PhoneVerificationStatusOverlayModule = require(PhoneUpsell.Components.PhoneVerificationStatusOverlay)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule = require(PhoneUpsell.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell)
local GetFFlagPhoneUseParentSizeForScreenSizeModule = require(PhoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local GetFFlagDisableVerifyPhoneViewOnSuccessModule = require(PhoneUpsell.Flags.GetFFlagDisableVerifyPhoneViewOnSuccess)
local GetFFlagFixIosOtpAutofillModule = require(PhoneUpsell.Flags.GetFFlagFixIosOtpAutofill)
local FFlagHomePhoneVerificationUpsellNewCopy = require(Parent.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy

local function CloseUpsell() --[[ Line: 107 ]] end

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
	showWebpage = function(_) --[[ Line: 125 ]] end
}

return function(p1) --[[ Line: 128 | Named "UpsellContainer" ]]
	-- upvalues: MergePropsModule (copy), config (copy), UsePhoneVerificationUpsellPropsModule (copy), ReactModule (copy), Loading (copy), IconSize (copy), GetFFlagPhoneUseParentSizeForScreenSizeModule (copy), RoactModule (copy), PhoneVerificationUpsellStateModule (copy), EntryViewModule (copy), AddPhoneViewModule (copy), GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (copy), FFlagHomePhoneVerificationUpsellNewCopy (copy), VerifyPhoneViewModule (copy), GetFFlagDisableVerifyPhoneViewOnSuccessModule (copy), GetFFlagFixIosOtpAutofillModule (copy), PhoneVerificationStatusOverlayModule (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	local UsePhoneVerificationUpsellPropsModuleResult = UsePhoneVerificationUpsellPropsModule(MergePropsModuleResult)
	local Element = ReactModule.createElement(Loading, {
		size = IconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
	
	return ReactModule.createElement(if GetFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else ReactModule.Fragment, if GetFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 145 ]]
			-- upvalues: UsePhoneVerificationUpsellPropsModuleResult (copy)
			UsePhoneVerificationUpsellPropsModuleResult.setParentSize(Frame.AbsoluteSize)
		end
	} else nil, {
		Entry = UsePhoneVerificationUpsellPropsModuleResult.phoneUpsellState == PhoneVerificationUpsellStateModule.Entry and (MergePropsModuleResult.entryConfig and ReactModule.createElement(EntryViewModule, {
			screenSize = UsePhoneVerificationUpsellPropsModuleResult.screenSize,
			onClose = UsePhoneVerificationUpsellPropsModuleResult.handleCloseClick,
			titleKey = MergePropsModuleResult.entryConfig.titleKey,
			descriptionKey = MergePropsModuleResult.entryConfig.descriptionKey,
			buttonKey = MergePropsModuleResult.entryConfig.buttonKey,
			onButtonClick = UsePhoneVerificationUpsellPropsModuleResult.proceedToAddPhone,
			extraButtonKey = MergePropsModuleResult.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = MergePropsModuleResult.entryConfig.extraButtonConfig.onExtraButtonClick
		})),
		AddPhone = UsePhoneVerificationUpsellPropsModuleResult.phoneUpsellState == PhoneVerificationUpsellStateModule.AddPhone and ReactModule.createElement(AddPhoneViewModule, {
			screenSize = UsePhoneVerificationUpsellPropsModuleResult.screenSize,
			countryCode = UsePhoneVerificationUpsellPropsModuleResult.countryCode,
			setCountryCode = UsePhoneVerificationUpsellPropsModuleResult.setCountryCode,
			phoneNumber = UsePhoneVerificationUpsellPropsModuleResult.phoneNumber,
			errorMessage = UsePhoneVerificationUpsellPropsModuleResult.addPhoneErrorMessage,
			isDisabled = UsePhoneVerificationUpsellPropsModuleResult.isDisabled,
			onPhoneNumberTextChange = UsePhoneVerificationUpsellPropsModuleResult.onPhoneNumberTextChange,
			onSetPhoneNumber = UsePhoneVerificationUpsellPropsModuleResult.handleSetPhone,
			onClose = UsePhoneVerificationUpsellPropsModuleResult.handleCloseClick,
			onTermsOfUseClick = UsePhoneVerificationUpsellPropsModuleResult.navigateToSMSTerms,
			onPrivacyPolicyClick = UsePhoneVerificationUpsellPropsModuleResult.navigateToPrivacy,
			onPhoneInputFocus = UsePhoneVerificationUpsellPropsModuleResult.onPhoneInputFocus,
			onCountryCodeSelectorClick = UsePhoneVerificationUpsellPropsModuleResult.onCountryCodeSelectorClick,
			isKeyboardShowing = UsePhoneVerificationUpsellPropsModuleResult.isKeyboardShowing,
			keyboardHeight = UsePhoneVerificationUpsellPropsModuleResult.onScreenKeyboardHeight,
			usePhoneNumberTextType = GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and UsePhoneVerificationUpsellPropsModuleResult.isPhoneNumberTextTypeEnabled,
			titleKey = MergePropsModuleResult.addPhoneTitleKey,
			descriptionKey = MergePropsModuleResult.addPhoneDescriptionKey,
			buttonKey = MergePropsModuleResult.addPhoneButtonKey,
			legalTextKey = MergePropsModuleResult.addPhoneLegalTextKey,
			extraButtonKey = MergePropsModuleResult.extraButtonTextKey,
			onExtraButtonClick = MergePropsModuleResult.onExtraButtonClick,
			alwaysShowLegalText = MergePropsModuleResult.alwaysShowAddPhoneLegalText,
			requireLegalTextCheckbox = MergePropsModuleResult.requireAddPhoneLegalTextCheckbox,
			disableLegalText = MergePropsModuleResult.disableLegalText,
			shouldShowVerificationText = if FFlagHomePhoneVerificationUpsellNewCopy then MergePropsModuleResult.shouldShowVerificationText else nil
		}),
		VerifyPhone = UsePhoneVerificationUpsellPropsModuleResult.phoneUpsellState == PhoneVerificationUpsellStateModule.VerifyPhone and ReactModule.createElement(VerifyPhoneViewModule, {
			screenSize = UsePhoneVerificationUpsellPropsModuleResult.screenSize,
			phoneNumber = UsePhoneVerificationUpsellPropsModuleResult.phoneNumber,
			prefix = UsePhoneVerificationUpsellPropsModuleResult.countryCode.prefix,
			code = UsePhoneVerificationUpsellPropsModuleResult.code,
			errorMessage = UsePhoneVerificationUpsellPropsModuleResult.verifyPhoneErrorMessage,
			isDisabled = if GetFFlagDisableVerifyPhoneViewOnSuccessModule() then UsePhoneVerificationUpsellPropsModuleResult.isDisabled else nil,
			onCodeTextChange = UsePhoneVerificationUpsellPropsModuleResult.onCodeTextChange,
			onResendPhoneCode = UsePhoneVerificationUpsellPropsModuleResult.handleResendCode,
			onClose = UsePhoneVerificationUpsellPropsModuleResult.handleCloseClick,
			returnToAddPhone = UsePhoneVerificationUpsellPropsModuleResult.returnToAddPhone,
			onCodeInputFocus = UsePhoneVerificationUpsellPropsModuleResult.onCodeInputFocus,
			isKeyboardShowing = UsePhoneVerificationUpsellPropsModuleResult.isKeyboardShowing,
			keyboardHeight = UsePhoneVerificationUpsellPropsModuleResult.onScreenKeyboardHeight,
			useOTPInputType = if GetFFlagFixIosOtpAutofillModule() then UsePhoneVerificationUpsellPropsModuleResult.isOTPInputTypeEnabled else MergePropsModuleResult.isOTPInputTypeEnabled,
			extraButtonKey = MergePropsModuleResult.verifyPhoneExtraButtonKey,
			onExtraButtonClick = MergePropsModuleResult.onVerifyPhoneExtraButtonClick
		}),
		LoadingOverlay = UsePhoneVerificationUpsellPropsModuleResult.isLoading and ReactModule.createElement(PhoneVerificationStatusOverlayModule, {
			image = Element,
			text = UsePhoneVerificationUpsellPropsModuleResult.verifyingKey
		})
	})
end