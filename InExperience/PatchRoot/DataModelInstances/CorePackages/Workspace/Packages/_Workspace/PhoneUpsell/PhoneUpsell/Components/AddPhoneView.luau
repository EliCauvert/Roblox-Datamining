local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Checkbox = FoundationModule.Checkbox
local Text = FoundationModule.Text
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local AuthCommonModule = require(Parent.AuthCommon)
local TextBoxStateWrapper = AuthCommonModule.Components.TextBoxStateWrapper
local PhoneNumberTextBox = AuthCommonModule.Components.PhoneNumberTextBox
local LinkButton = UIBloxModule.App.Button.LinkButton
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local FFlagHomePhoneVerificationUpsellNewCopy = require(Parent.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy
local FFlagPhoneUpsellFocusNavigationModule = require(PhoneUpsell.Flags.FFlagPhoneUpsellFocusNavigation)
local config = {
	alwaysShowLegalText = false,
	requireLegalTextCheckbox = false,
	buttonKey = "Feature.VerificationUpsell.Action.Continue",
	legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA",
	shouldShowVerificationText = not FFlagHomePhoneVerificationUpsellNewCopy and nil
}

local function getButtonStackProps(Text, OnActivated, IsDisabled, Text1, OnActivated1, p1)
	-- upvalues: ButtonType (copy)
	local Buttons = {
		{
			buttonType = ButtonType.PrimarySystem,
			props = {
				onActivated = OnActivated,
				text = Text,
				isDisabled = IsDisabled
			}
		}
	}
	
	if Text1 and Text1 ~= "" then
		table.insert(Buttons, 1, {
			buttonType = ButtonType.Secondary,
			props = {
				isDisabled = false,
				onActivated = OnActivated1,
				text = Text1
			}
		})
	end
	local config = {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = Buttons
	}
	
	if p1 then
		config.disableRoactGamepadButtonSelection = true
		Buttons[#Buttons].props.NextSelectionUp = p1.NextSelectionUp
	end
	return config
end

return function(p1)
	-- upvalues: MergePropsModule (copy), config (copy), ReactModule (copy), GetPartialPageModalMiddleContentWidthFunction (copy), FFlagHomePhoneVerificationUpsellNewCopy (copy), WithStyleFunction (copy), WithLocalizationFunction (copy), PartialPageModal (copy), getButtonStackProps (copy), FFlagPhoneUpsellFocusNavigationModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), TextBoxStateWrapper (copy), PhoneNumberTextBox (copy), Text (copy), Checkbox (copy), LinkButton (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	
	local function noOp() end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(MergePropsModuleResult.screenSize.X)
	local config1 = {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = MergePropsModuleResult.titleKey,
		descriptionKey = MergePropsModuleResult.descriptionKey,
		buttonKey = MergePropsModuleResult.buttonKey,
		legalTextKey = MergePropsModuleResult.legalTextKey,
		verificationKey = if FFlagHomePhoneVerificationUpsellNewCopy then "Feature.VerificationUpsell.Description.AddPhoneBody" else nil
	}
	
	if MergePropsModuleResult.extraButtonKey and MergePropsModuleResult.extraButtonKey ~= "" then
		config1.extraButtonKey = MergePropsModuleResult.extraButtonKey
	end
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), config1 (copy), MergePropsModuleResult (copy), UseStateResult (copy), ReactModule (upval), PartialPageModal (upval), getButtonStackProps (upval), FFlagPhoneUpsellFocusNavigationModule (upval), UseRefResult (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), PartialPageModalMiddleContentWidth (copy), TextBoxStateWrapper (upval), PhoneNumberTextBox (upval), noOp (copy), FFlagHomePhoneVerificationUpsellNewCopy (upval), Text (upval), Checkbox (upval), UseStateResult2 (copy), LinkButton (upval)
		return WithLocalizationFunction(config1)(function(p3)
			-- upvalues: p2 (copy), MergePropsModuleResult (upval), UseStateResult (upval), ReactModule (upval), PartialPageModal (upval), getButtonStackProps (upval), FFlagPhoneUpsellFocusNavigationModule (upval), UseRefResult (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), PartialPageModalMiddleContentWidth (upval), TextBoxStateWrapper (upval), PhoneNumberTextBox (upval), noOp (upval), FFlagHomePhoneVerificationUpsellNewCopy (upval), Text (upval), Checkbox (upval), UseStateResult2 (upval), LinkButton (upval)
			local BaseSize = p2.Font.BaseSize
			local RelativeSize = p2.Font.CaptionHeader.RelativeSize
			local NoDisableLegalText: boolean = MergePropsModuleResult.countryCode.prefix == "1" and not MergePropsModuleResult.disableLegalText
			
			return ReactModule.createElement(PartialPageModal, {
				title = p3.titleKey,
				screenSize = MergePropsModuleResult.screenSize,
				buttonStackProps = getButtonStackProps(p3.buttonKey, MergePropsModuleResult.onSetPhoneNumber, MergePropsModuleResult.isDisabled or MergePropsModuleResult.requireLegalTextCheckbox and not UseStateResult, p3.extraButtonKey, MergePropsModuleResult.onExtraButtonClick, if FFlagPhoneUpsellFocusNavigationModule and NoDisableLegalText then { NextSelectionUp = UseRefResult } else nil),
				onCloseClicked = MergePropsModuleResult.onClose,
				position = MergePropsModuleResult.isKeyboardShowing and UDim2.new(0.5, 0, 1, -MergePropsModuleResult.keyboardHeight) or nil,
				anchorPoint = MergePropsModuleResult.isKeyboardShowing and Vector2.new(0.5, 1) or nil
			}, {
				Middle = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					ContentPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 12),
						PaddingBottom = UDim.new(0, 24)
					}),
					ListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 6)
					}),
					BodyText = ReactModule.createElement("TextLabel", {
						LayoutOrder = 0,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p3.descriptionKey,
						TextSize = BaseSize,
						TextColor3 = p2.Theme.TextDefault.Color,
						TextTransparency = p2.Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}),
					PhoneInput = ReactModule.createElement(TextBoxStateWrapper, {
						LayoutOrder = 1,
						ChildClass = PhoneNumberTextBox,
						ErrorState = MergePropsModuleResult.errorMessage ~= "",
						ErrorText = MergePropsModuleResult.errorMessage,
						Size = UDim2.new(1, 0, 0, 36),
						ChildProps = {
							ClearTextOnFocus = false,
							PaddingX = 12,
							CountryCode = MergePropsModuleResult.countryCode,
							SetCountryCode = MergePropsModuleResult.setCountryCode,
							Text = MergePropsModuleResult.phoneNumber,
							PlaceholderText = p3.phoneNumberKey,
							Font = p2.Font.Body.Font,
							TextSize = BaseSize * p2.Font.Body.RelativeSize,
							TextXAlignment = Enum.TextXAlignment.Left,
							Color = p2.Theme.BackgroundUIContrast.Color,
							Transparency = p2.Theme.BackgroundUIContrast.Transparency,
							TextColor = p2.Theme.TextDefault.Color,
							PlaceholderColor = p2.Theme.UIDefault.Color,
							TextTransparency = p2.Theme.TextDefault.Transparency,
							TextInputTypeOverride = MergePropsModuleResult.usePhoneNumberTextType and Enum.TextInputType.Phone or Enum.TextInputType.Number,
							onChangeText = MergePropsModuleResult.onPhoneNumberTextChange,
							onFocused = MergePropsModuleResult.onPhoneInputFocus,
							onFocusLost = noOp,
							phoneCountryCodeSelectorCallback = MergePropsModuleResult.onCountryCodeSelectorClick
						}
					}),
					PrivacyText = ReactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p3.phonePrivacyDisclaimerKey,
						TextSize = BaseSize * RelativeSize,
						TextColor3 = p2.Theme.TextEmphasis.Color,
						TextTransparency = p2.Theme.TextEmphasis.Transparency,
						Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 24)
					}),
					VerificationText = if FFlagHomePhoneVerificationUpsellNewCopy and MergePropsModuleResult.shouldShowVerificationText then ReactModule.createElement(Text, {
						tag = "auto-y size-full-0 text-wrap text-body-small text-align-x-left",
						LayoutOrder = 2,
						Text = p3.verificationKey
					}) else nil,
					LegalTextContainer = not MergePropsModuleResult.disableLegalText and (if MergePropsModuleResult.requireLegalTextCheckbox then ReactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 6)
						}),
						LegalCheckbox = ReactModule.createElement(Checkbox, {
							label = "",
							onActivated = UseStateResult2,
							isChecked = UseStateResult
						}),
						LegalText = ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = p3.legalTextKey,
							TextSize = BaseSize * RelativeSize,
							TextColor3 = p2.Theme.TextDefault.Color,
							TextTransparency = p2.Theme.TextDefault.Transparency,
							Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, -32, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					}) elseif MergePropsModuleResult.alwaysShowLegalText or MergePropsModuleResult.countryCode.prefix == "1" then ReactModule.createElement("TextLabel", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p3.legalTextKey,
						TextSize = BaseSize * RelativeSize,
						TextColor3 = p2.Theme.TextDefault.Color,
						TextTransparency = p2.Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}) else nil),
					LegalButtonsContainer = MergePropsModuleResult.countryCode.prefix == "1" and (not MergePropsModuleResult.disableLegalText and ReactModule.createElement("Frame", {
						LayoutOrder = 4,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 5)
						}),
						TermsOfUseButton = ReactModule.createElement(LinkButton, {
							layoutOrder = 5,
							fontStyle = "CaptionBody",
							text = p3.termsOfUseKey,
							onActivated = MergePropsModuleResult.onTermsOfUseClick,
							size = UDim2.fromScale(0.2, 0.2),
							buttonRef = if FFlagPhoneUpsellFocusNavigationModule then UseRefResult else nil
						}),
						TextButtonDivider = ReactModule.createElement("TextLabel", {
							LayoutOrder = 6,
							BackgroundTransparency = 1,
							Text = "-",
							TextWrapped = true,
							TextSize = BaseSize * RelativeSize,
							TextColor3 = p2.Theme.TextDefault.Color,
							TextTransparency = p2.Theme.TextDefault.Transparency,
							Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						PrivacyPolicyButton = ReactModule.createElement(LinkButton, {
							layoutOrder = 7,
							fontStyle = "CaptionBody",
							text = p3.privacyPolicyKey,
							onActivated = MergePropsModuleResult.onPrivacyPolicyClick
						})
					}))
				})
			})
		end)
	end)
end