local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local userInputService = game:GetService("UserInputService")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local authCommonModule = require(parent.AuthCommon)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local textField = UIBloxModule.App.Input.TextField
local countryCodeButtonModule = require(phoneUpsell.Components.InGame.CountryCodeButton)
local text = require(parent.AppCommonLib).Text
local countryCodeDropdownContainer = authCommonModule.Components.InGame.CountryCodeDropdownContainer
local useExternalEvent = require(parent.RoactUtils).Hooks.useExternalEvent
local getFFlagAddMorePhoneUpsellEvents = require(parent.SharedFlags).GetFFlagAddMorePhoneUpsellEvents
local fFlagInExperienceAddPhoneViewNewCopy = require(parent.SharedFlags).FFlagInExperienceAddPhoneViewNewCopy
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local t = {
	alwaysShowLegalText = false,
	requireLegalTextCheckbox = false,
	legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA",
	prefix = "1",
	buttonKey = if fFlagInExperienceAddPhoneViewNewCopy then "Feature.AccountSettings.Action.Verify" else "Feature.VerificationUpsell.Action.Next"
}

local function getButtonStackProps(p0, p1, p2, p3, p4) --[[ line: 69 ]]
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
	return { buttonHeight = 48, buttons = list }
end

return function(p5) --[[ line: 104 | named "InGameAddPhoneView" ]]
	-- upvalues: mergePropsModule (ref), t (ref), fFlagInExperienceAddPhoneViewNewCopy (ref), useStyle (ref), fFlagRenameDeprecatedUIBloxTokens (ref), useLocalization (ref), reactModule (ref), text (ref), useExternalEvent (ref), userInputService (ref), roactModule (ref), countryCodeButtonModule (ref), getFFlagAddMorePhoneUpsellEvents (ref), textField (ref), interactiveAlert (ref), getButtonStackProps (ref), countryCodeDropdownContainer (ref)
	local var11 = mergePropsModule(t, p5)
	local var12 = if fFlagInExperienceAddPhoneViewNewCopy then {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		subtitleKey = "Feature.AccountSettings.Description.AddPhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.AccountSettings.Description.NotShownPublicly",
		titleKey = var11.titleKey,
		descriptionKey = var11.descriptionKey,
		buttonKey = var11.buttonKey,
		legalTextKey = var11.legalTextKey
	} else {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = var11.titleKey,
		descriptionKey = var11.descriptionKey,
		buttonKey = var11.buttonKey,
		legalTextKey = var11.legalTextKey
	}
	
	if var11.extraButtonKey and var11.extraButtonKey ~= "" then
		var12.extraButtonKey = var11.extraButtonKey
	end
	local var13 = useStyle()
	local tokens = var13.Tokens
	local var14 = if fFlagRenameDeprecatedUIBloxTokens then tokens.Typography.BodyLarge else tokens.Component.TextField.Base.Field.Typography
	local font = var14.Font
	local fontSize = var14.FontSize
	local var15 = useLocalization(var12)
	local baseSize = var13.Font.BaseSize
	local relativeSize = var13.Font.CaptionHeader.RelativeSize
	local isDisabled = var11.isDisabled
	local small = tokens.Gap.Small
	local size1200 = tokens.Size.Size_1200
	local prefix = var11.countryCode.prefix
	local var16, var17 = reactModule.useState(false)
	local maxValue = math.max(text.GetTextWidth(prefix, font, fontSize) + 24, size1200)
	local var19, var20 = reactModule.useState(300)
	
	local var21 = function(p6) --[[ line: 157 ]]
		-- upvalues: var20 (ref)
		var20(p6.AbsoluteSize.X)
	end
	
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	local vector2 = Vector2.new(0, 0)
	local vector2_1 = Vector2.new(0, 0)
	local vector2_2 = Vector2.new(0, 0)
	
	if var22.current then
		vector2 = var22.current.AbsolutePosition
	end
	if var23.current then
		vector2_1 = var23.current.AbsolutePosition
	end
	if var24.current then
		vector2_2 = var24.current.AbsolutePosition
	end
	local minValue = math.min(var11.screenSize.Y - (vector2.Y + size1200 + small - vector2_1.Y) - small, 400)
	useExternalEvent(userInputService.InputBegan, reactModule.useCallback(function(p7) --[[ line: 187 ]]
		-- upvalues: size1200 (ref), small (ref), vector2_2 (write), var19 (ref), minValue (write), maxValue (ref), var16 (ref), var17 (ref)
		local var31 = size1200 + small
		
		if var16 and not (vector2_2.X < p7.Position.X and (p7.Position.X < vector2_2.X + var19 and (vector2_2.Y + var31 < p7.Position.Y and p7.Position.Y < vector2_2.Y + var31 + minValue))) and not (vector2_2.X < p7.Position.X and (p7.Position.X < vector2_2.X + maxValue and (vector2_2.Y < p7.Position.Y and p7.Position.Y < vector2_2.Y + size1200))) then
			var17(false)
		end
	end, {
		var16,
		vector2_2,
		var19,
		maxValue,
		size1200
	}))
	local var29 = var11.errorMessage and var11.errorMessage ~= ""
	local frame = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		[roactModule.Ref] = var22
	}, {
		ListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, tokens.Size.Size_200)
		}),
		PhoneInputContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, small)
			}),
			CountryCodeButton = reactModule.createElement(countryCodeButtonModule, {
				layoutOrder = 1,
				countryPrefix = "+" .. prefix,
				onButtonClick = function() --[[ line: 240 ]]
					-- upvalues: var17 (ref), var16 (ref), getFFlagAddMorePhoneUpsellEvents (copy), var11 (ref)
					var17(not var16)
					
					if getFFlagAddMorePhoneUpsellEvents then
						var11.onCountryCodeSelectorClick()
					end
				end,
				size = UDim2.new(0, maxValue, 0, tokens.Size.Size_1200),
				font = font,
				textSize = fontSize,
				forwardRef = var24,
				error = var29
			}),
			PhoneInputBox = reactModule.createElement(textField, {
				placeholder = "",
				required = true,
				LayoutOrder = 2,
				text = var11.phoneNumber,
				onChange = function(p8) --[[ line: 257 ]]
					-- upvalues: var11 (ref)
					var11.onPhoneNumberTextChange({ Text = p8 })
				end,
				width = UDim.new(1, -(maxValue + small)),
				error = var29,
				textInputType = if var11.usePhoneNumberTextType then Enum.TextInputType.Phone else Enum.TextInputType.Number,
				onFocusGained = if getFFlagAddMorePhoneUpsellEvents() then var11.onPhoneInputFocus else nil
			})
		}),
		ErrorText = var29 and reactModule.createElement("TextLabel", {
			TextTransparency = 0,
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Text = var11.errorMessage,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = tokens.Color.System.Alert.Color3,
			Font = var13.Font.Body.Font,
			TextSize = baseSize * var13.Font.CaptionSmall.RelativeSize,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		[roactModule.Ref] = var23
	}, {
		AddPhoneView = reactModule.createElement(interactiveAlert, {
			screenSize = var11.screenSize,
			buttonStackInfo = getButtonStackProps(var15.buttonKey, var11.onSetPhoneNumber, isDisabled, var15.extraButtonKey, var11.onExtraButtonClick),
			position = var11.isKeyboardShowing and UDim2.new(0.5, 0, 1, -var11.keyboardHeight) or UDim2.fromScale(0.5, 0.5),
			anchorPoint = var11.isKeyboardShowing and Vector2.new(0.5, 1) or nil,
			title = var15.titleKey,
			onAbsoluteSizeChanged = var21,
			onCloseClicked = var11.onClose,
			middleContent = if fFlagInExperienceAddPhoneViewNewCopy then function() --[[ line: 301 ]]
				-- upvalues: reactModule (copy), tokens (ref), var15 (ref), baseSize (ref), var13 (ref), frame (ref), relativeSize (ref)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					AddPhoneViewFrame = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					}, {
						ListLayout = reactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, tokens.Size.Size_200)
						}),
						SubtitleText = reactModule.createElement("TextLabel", {
							LayoutOrder = -1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = var15.subtitleKey,
							TextSize = baseSize,
							TextColor3 = var13.Theme.TextEmphasis.Color,
							TextTransparency = var13.Theme.TextEmphasis.Transparency,
							Font = var13.Font.Body.Font,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						PhoneInput = frame,
						PhonePrivacyText = reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = var15.phonePrivacyDisclaimerKey,
							TextSize = baseSize * relativeSize,
							TextColor3 = var13.Theme.TextEmphasis.Color,
							TextTransparency = var13.Theme.TextEmphasis.Transparency,
							Font = var13.Font.Body.Font,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						PrivacyText = reactModule.createElement("TextLabel", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = var15.disclaimerKey,
							TextSize = baseSize * relativeSize,
							TextColor3 = var13.Theme.TextEmphasis.Color,
							TextTransparency = var13.Theme.TextEmphasis.Transparency,
							Font = var13.Font.Body.Font,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					})
				})
			end else function() --[[ line: 360 ]]
				-- upvalues: reactModule (copy), tokens (ref), frame (ref), var15 (ref), baseSize (ref), relativeSize (ref), var13 (ref)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					AddPhoneViewFrame = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					}, {
						ListLayout = reactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, tokens.Size.Size_200)
						}),
						PhoneInput = frame,
						PrivacyText = reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = var15.disclaimerKey,
							TextSize = baseSize * relativeSize,
							TextColor3 = var13.Theme.TextEmphasis.Color,
							TextTransparency = var13.Theme.TextEmphasis.Transparency,
							Font = var13.Font.Body.Font,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					})
				})
			end
		}),
		CountryCodeSelectorFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0, var19 - 24, 0, 0),
			Position = UDim2.new(0, vector2.X - vector2_1.X, 0, vector2.Y + size1200 + small - vector2_1.Y)
		}, {
			CountryCodeDropdown = reactModule.createElement(countryCodeDropdownContainer, {
				dropdownVisible = var16,
				position = UDim2.new(0, 0, 0, 0),
				maxHeight = minValue,
				onCountryCodeSelected = function(p9) --[[ line: 419 ]]
					-- upvalues: var11 (ref), var17 (ref)
					var11.setCountryCode(p9)
					var17(false)
				end
			})
		})
	})
end