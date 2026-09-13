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

local function getButtonStackProps(p1, p2, p3, p4, p5)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p2, text = p1, isDisabled = p3 }
		}
	}
	
	if p4 and p4 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { isDisabled = false, onActivated = p5, text = p4 }
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = list
	}
end

return function(p1)
	-- upvalues: mergePropsModule (ref), t (ref), reactModule (ref), getPartialPageModalMiddleContentWidth (ref), fFlagHomePhoneVerificationUpsellNewCopy (ref), withStyle (ref), withLocalization (ref), partialPageModal (ref), getButtonStackProps (ref), textBoxStateWrapper (ref), phoneNumberTextBox (ref), text (ref), checkbox (ref), linkButton (ref)
	local var1 = mergePropsModule(t, p1)
	
	local function noOp() end
	
	local var2, var3 = reactModule.useState(false)
	local var4 = getPartialPageModalMiddleContentWidth(var1.screenSize.X)
	local t_1 = {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = var1.titleKey,
		descriptionKey = var1.descriptionKey,
		buttonKey = var1.buttonKey,
		legalTextKey = var1.legalTextKey,
		verificationKey = if fFlagHomePhoneVerificationUpsellNewCopy then "Feature.VerificationUpsell.Description.AddPhoneBody" else nil
	}
	
	if var1.extraButtonKey and var1.extraButtonKey ~= "" then
		t_1.extraButtonKey = var1.extraButtonKey
	end
	return withStyle(function(p2)
		-- upvalues: withLocalization (copy), t_1 (ref), var1 (ref), var2 (ref), reactModule (copy), partialPageModal (copy), getButtonStackProps (copy), var4 (ref), textBoxStateWrapper (copy), phoneNumberTextBox (copy), noOp (ref), fFlagHomePhoneVerificationUpsellNewCopy (copy), text (copy), checkbox (copy), var3 (ref), linkButton (copy)
		return withLocalization(t_1)(function(p3)
			-- upvalues: p2 (ref), var1 (copy), var2 (copy), reactModule (copy), partialPageModal (copy), getButtonStackProps (copy), var4 (copy), textBoxStateWrapper (copy), phoneNumberTextBox (copy), noOp (copy), fFlagHomePhoneVerificationUpsellNewCopy (copy), text (copy), checkbox (copy), var3 (copy), linkButton (copy)
			local baseSize = p2.Font.BaseSize
			local relativeSize = p2.Font.Body.RelativeSize
			local relativeSize_1 = p2.Font.CaptionHeader.RelativeSize
			local createElement = reactModule.createElement
			local t = {
				title = p3.titleKey,
				screenSize = var1.screenSize,
				buttonStackProps = getButtonStackProps(p3.buttonKey, var1.onSetPhoneNumber, var1.isDisabled or var1.requireLegalTextCheckbox and not var2, p3.extraButtonKey, var1.onExtraButtonClick),
				onCloseClicked = var1.onClose,
				position = var1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -var1.keyboardHeight) or nil,
				anchorPoint = var1.isKeyboardShowing and Vector2.new(0.5, 1) or nil
			}
			local t_1 = {}
			local createElement_1 = reactModule.createElement
			local var5 = "Frame"
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
					Text = p3.descriptionKey,
					TextSize = baseSize,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					Font = p2.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, var4, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				PhoneInput = reactModule.createElement(textBoxStateWrapper, {
					LayoutOrder = 1,
					ChildClass = phoneNumberTextBox,
					ErrorState = var1.errorMessage ~= "",
					ErrorText = var1.errorMessage,
					Size = UDim2.new(1, 0, 0, 36),
					ChildProps = {
						ClearTextOnFocus = false,
						PaddingX = 12,
						CountryCode = var1.countryCode,
						SetCountryCode = var1.setCountryCode,
						Text = var1.phoneNumber,
						PlaceholderText = p3.phoneNumberKey,
						Font = p2.Font.Body.Font,
						TextSize = baseSize * relativeSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						Color = p2.Theme.BackgroundUIContrast.Color,
						Transparency = p2.Theme.BackgroundUIContrast.Transparency,
						TextColor = p2.Theme.TextDefault.Color,
						PlaceholderColor = p2.Theme.UIDefault.Color,
						TextTransparency = p2.Theme.TextDefault.Transparency,
						TextInputTypeOverride = if var1.usePhoneNumberTextType then Enum.TextInputType.Phone else Enum.TextInputType.Number,
						onChangeText = var1.onPhoneNumberTextChange,
						onFocused = var1.onPhoneInputFocus,
						onFocusLost = noOp,
						phoneCountryCodeSelectorCallback = var1.onCountryCodeSelectorClick
					}
				}),
				PrivacyText = reactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = p3.phonePrivacyDisclaimerKey,
					TextSize = baseSize * relativeSize_1,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					Font = p2.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, var4, 0, 24)
				}),
				VerificationText = if fFlagHomePhoneVerificationUpsellNewCopy and var1.shouldShowVerificationText then reactModule.createElement(text, {
					tag = "auto-y size-full-0 text-wrap text-body-small text-align-x-left",
					LayoutOrder = 2,
					Text = p3.verificationKey
				}) else nil
			}
			local var6 = not var1.disableLegalText
			
			if var6 then
				var6 = if var1.requireLegalTextCheckbox then reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var4, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 6)
					}),
					LegalCheckbox = reactModule.createElement(checkbox, { label = "", onActivated = var3, isChecked = var2 }),
					LegalText = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p3.legalTextKey,
						TextSize = baseSize * relativeSize_1,
						TextColor3 = p2.Theme.TextDefault.Color,
						TextTransparency = p2.Theme.TextDefault.Transparency,
						Font = p2.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -32, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				}) elseif var1.alwaysShowLegalText or var1.countryCode.prefix == "1" then reactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = p3.legalTextKey,
					TextSize = baseSize * relativeSize_1,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					Font = p2.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, var4, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}) else nil
			end
			t_3.LegalTextContainer = var6
			t_3.LegalButtonsContainer = var1.countryCode.prefix == "1" and (not var1.disableLegalText and reactModule.createElement("Frame", {
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
					text = p3.termsOfUseKey,
					onActivated = var1.onTermsOfUseClick,
					size = UDim2.fromScale(0.2, 0.2)
				}),
				TextButtonDivider = reactModule.createElement("TextLabel", {
					LayoutOrder = 6,
					BackgroundTransparency = 1,
					Text = "-",
					TextWrapped = true,
					TextSize = baseSize * relativeSize_1,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					Font = p2.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Center,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				PrivacyPolicyButton = reactModule.createElement(linkButton, {
					layoutOrder = 7,
					fontStyle = "CaptionBody",
					text = p3.privacyPolicyKey,
					onActivated = var1.onPrivacyPolicyClick
				})
			}))
			t_1.Middle = createElement_1(var5, t_2, t_3)
			
			return createElement(partialPageModal, t, t_1)
		end)
	end)
end