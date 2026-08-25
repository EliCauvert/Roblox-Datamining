local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local checkbox = foundationModule.Checkbox
local text = foundationModule.Text
local withStyle = UIBloxModule.Style.withStyle
local withLocalization = require(parent.Localization).withLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local getPartialPageModalMiddleContentWidth = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local authCommonModule = require(parent.AuthCommon)
local textBoxStateWrapper = authCommonModule.Components.TextBoxStateWrapper
local phoneNumberTextBox = authCommonModule.Components.PhoneNumberTextBox
local linkButton = UIBloxModule.App.Button.LinkButton
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local fFlagHomePhoneVerificationUpsellNewCopy = require(parent.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy
local t = {
	alwaysShowLegalText = false,
	requireLegalTextCheckbox = false,
	buttonKey = "Feature.VerificationUpsell.Action.Continue",
	legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA",
	shouldShowVerificationText = if fFlagHomePhoneVerificationUpsellNewCopy then false else nil
}

local function getButtonStackProps(p0, p1, p2, p3, p4)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p1, text = p0, isDisabled = p2 }
		}
	}
	
	if p3 and p3 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { isDisabled = false, onActivated = p4, text = p3 }
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = list
	}
end

return function(p5)
	-- upvalues: mergePropsModule (ref), t (ref), reactModule (ref), getPartialPageModalMiddleContentWidth (ref), fFlagHomePhoneVerificationUpsellNewCopy (ref), withStyle (ref), withLocalization (ref), partialPageModal (ref), getButtonStackProps (ref), textBoxStateWrapper (ref), phoneNumberTextBox (ref), text (ref), checkbox (ref), linkButton (ref)
	local var9 = mergePropsModule(t, p5)
	
	local function noOp() end
	
	local var11, var12 = reactModule.useState(false)
	local var13 = getPartialPageModalMiddleContentWidth(var9.screenSize.X)
	local t_1 = {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = var9.titleKey,
		descriptionKey = var9.descriptionKey,
		buttonKey = var9.buttonKey,
		legalTextKey = var9.legalTextKey,
		verificationKey = if fFlagHomePhoneVerificationUpsellNewCopy then "Feature.VerificationUpsell.Description.AddPhoneBody" else nil
	}
	
	if var9.extraButtonKey and var9.extraButtonKey ~= "" then
		t_1.extraButtonKey = var9.extraButtonKey
	end
	return withStyle(function(p6)
		-- upvalues: withLocalization (copy), t_1 (ref), var9 (ref), var11 (ref), reactModule (copy), partialPageModal (copy), getButtonStackProps (copy), var13 (ref), textBoxStateWrapper (copy), phoneNumberTextBox (copy), noOp (ref), fFlagHomePhoneVerificationUpsellNewCopy (copy), text (copy), checkbox (copy), var12 (ref), linkButton (copy)
		return withLocalization(t_1)(function(p7)
			-- upvalues: p6 (ref), var9 (copy), var11 (copy), reactModule (copy), partialPageModal (copy), getButtonStackProps (copy), var13 (copy), textBoxStateWrapper (copy), phoneNumberTextBox (copy), noOp (copy), fFlagHomePhoneVerificationUpsellNewCopy (copy), text (copy), checkbox (copy), var12 (copy), linkButton (copy)
			local baseSize = p6.Font.BaseSize
			local relativeSize = p6.Font.Body.RelativeSize
			local relativeSize_1 = p6.Font.CaptionHeader.RelativeSize
			local createElement = reactModule.createElement
			local t = {
				title = p7.titleKey,
				screenSize = var9.screenSize,
				buttonStackProps = getButtonStackProps(p7.buttonKey, var9.onSetPhoneNumber, var9.isDisabled or var9.requireLegalTextCheckbox and not var11, p7.extraButtonKey, var9.onExtraButtonClick),
				onCloseClicked = var9.onClose,
				position = var9.isKeyboardShowing and UDim2.new(0.5, 0, 1, -var9.keyboardHeight) or nil,
				anchorPoint = var9.isKeyboardShowing and Vector2.new(0.5, 1) or nil
			}
			local t_1 = {}
			local createElement_1 = reactModule.createElement
			local var17 = "Frame"
			local t_2 = {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}
			local t_3 = {
				ContentPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 24)
				}),
				ListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 6)
				}),
				BodyText = reactModule.createElement("TextLabel", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = p7.descriptionKey,
					TextSize = baseSize,
					TextColor3 = p6.Theme.TextDefault.Color,
					TextTransparency = p6.Theme.TextDefault.Transparency,
					Font = p6.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, var13, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				PhoneInput = reactModule.createElement(textBoxStateWrapper, {
					LayoutOrder = 1,
					ChildClass = phoneNumberTextBox,
					ErrorState = var9.errorMessage ~= "",
					ErrorText = var9.errorMessage,
					Size = UDim2.new(1, 0, 0, 36),
					ChildProps = {
						ClearTextOnFocus = false,
						PaddingX = 12,
						CountryCode = var9.countryCode,
						SetCountryCode = var9.setCountryCode,
						Text = var9.phoneNumber,
						PlaceholderText = p7.phoneNumberKey,
						Font = p6.Font.Body.Font,
						TextSize = baseSize * relativeSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						Color = p6.Theme.BackgroundUIContrast.Color,
						Transparency = p6.Theme.BackgroundUIContrast.Transparency,
						TextColor = p6.Theme.TextDefault.Color,
						PlaceholderColor = p6.Theme.UIDefault.Color,
						TextTransparency = p6.Theme.TextDefault.Transparency,
						TextInputTypeOverride = if var9.usePhoneNumberTextType then Enum.TextInputType.Phone else Enum.TextInputType.Number,
						onChangeText = var9.onPhoneNumberTextChange,
						onFocused = var9.onPhoneInputFocus,
						onFocusLost = noOp,
						phoneCountryCodeSelectorCallback = var9.onCountryCodeSelectorClick
					}
				}),
				PrivacyText = reactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = p7.phonePrivacyDisclaimerKey,
					TextSize = baseSize * relativeSize_1,
					TextColor3 = p6.Theme.TextEmphasis.Color,
					TextTransparency = p6.Theme.TextEmphasis.Transparency,
					Font = p6.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, var13, 0, 24)
				}),
				VerificationText = if fFlagHomePhoneVerificationUpsellNewCopy and var9.shouldShowVerificationText then reactModule.createElement(text, {
					tag = "auto-y size-full-0 text-wrap text-body-small text-align-x-left",
					LayoutOrder = 2,
					Text = p7.verificationKey
				}) else nil
			}
			local var20 = not var9.disableLegalText
			
			if var20 then
				var20 = if var9.requireLegalTextCheckbox then reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var13, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 6)
					}),
					LegalCheckbox = reactModule.createElement(checkbox, { label = "", onActivated = var12, isChecked = var11 }),
					LegalText = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p7.legalTextKey,
						TextSize = baseSize * relativeSize_1,
						TextColor3 = p6.Theme.TextDefault.Color,
						TextTransparency = p6.Theme.TextDefault.Transparency,
						Font = p6.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -32, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				}) elseif var9.alwaysShowLegalText or var9.countryCode.prefix == "1" then reactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = p7.legalTextKey,
					TextSize = baseSize * relativeSize_1,
					TextColor3 = p6.Theme.TextDefault.Color,
					TextTransparency = p6.Theme.TextDefault.Transparency,
					Font = p6.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, var13, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}) else nil
			end
			t_3.LegalTextContainer = var20
			t_3.LegalButtonsContainer = var9.countryCode.prefix == "1" and (not var9.disableLegalText and reactModule.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 5)
				}),
				TermsOfUseButton = reactModule.createElement(linkButton, {
					layoutOrder = 5,
					fontStyle = "CaptionBody",
					text = p7.termsOfUseKey,
					onActivated = var9.onTermsOfUseClick,
					size = UDim2.fromScale(0.2, 0.2)
				}),
				TextButtonDivider = reactModule.createElement("TextLabel", {
					LayoutOrder = 6,
					BackgroundTransparency = 1,
					Text = "-",
					TextWrapped = true,
					TextSize = baseSize * relativeSize_1,
					TextColor3 = p6.Theme.TextDefault.Color,
					TextTransparency = p6.Theme.TextDefault.Transparency,
					Font = p6.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Center,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				PrivacyPolicyButton = reactModule.createElement(linkButton, {
					layoutOrder = 7,
					fontStyle = "CaptionBody",
					text = p7.privacyPolicyKey,
					onActivated = var9.onPrivacyPolicyClick
				})
			}))
			t_1.Middle = createElement_1(var17, t_2, t_3)
			
			return createElement(partialPageModal, t, t_1)
		end)
	end)
end