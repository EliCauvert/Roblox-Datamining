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
	return { buttonHeight = 48, buttons = list }
end

return function(p1)
	-- upvalues: mergePropsModule (ref), t (ref), fFlagInExperienceAddPhoneViewNewCopy (ref), useStyle (ref), fFlagRenameDeprecatedUIBloxTokens (ref), useLocalization (ref), reactModule (ref), text (ref), useExternalEvent (ref), userInputService (ref), roactModule (ref), countryCodeButtonModule (ref), getFFlagAddMorePhoneUpsellEvents (ref), textField (ref), interactiveAlert (ref), getButtonStackProps (ref), countryCodeDropdownContainer (ref)
	local var1 = mergePropsModule(t, p1)
	local var2 = if fFlagInExperienceAddPhoneViewNewCopy then {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		subtitleKey = "Feature.AccountSettings.Description.AddPhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.AccountSettings.Description.NotShownPublicly",
		titleKey = var1.titleKey,
		descriptionKey = var1.descriptionKey,
		buttonKey = var1.buttonKey,
		legalTextKey = var1.legalTextKey
	} else {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = var1.titleKey,
		descriptionKey = var1.descriptionKey,
		buttonKey = var1.buttonKey,
		legalTextKey = var1.legalTextKey
	}
	
	if var1.extraButtonKey and var1.extraButtonKey ~= "" then
		var2.extraButtonKey = var1.extraButtonKey
	end
	local var3 = useStyle()
	local tokens = var3.Tokens
	local var4 = if fFlagRenameDeprecatedUIBloxTokens then tokens.Typography.BodyLarge else tokens.Component.TextField.Base.Field.Typography
	local font = var4.Font
	local fontSize = var4.FontSize
	local var5 = useLocalization(var2)
	local baseSize = var3.Font.BaseSize
	local relativeSize = var3.Font.CaptionHeader.RelativeSize
	local isDisabled = var1.isDisabled
	local small = tokens.Gap.Small
	local size1200 = tokens.Size.Size_1200
	local prefix = var1.countryCode.prefix
	local var6, var7 = reactModule.useState(false)
	local maxValue = math.max(text.GetTextWidth(prefix, font, fontSize) + 24, size1200)
	local var8, var9 = reactModule.useState(300)
	
	local var10 = function(p2)
		-- upvalues: var9 (ref)
		var9(p2.AbsoluteSize.X)
	end
	
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local vector2 = Vector2.new(0, 0)
	local vector2_1 = Vector2.new(0, 0)
	local vector2_2 = Vector2.new(0, 0)
	
	if var11.current then
		vector2 = var11.current.AbsolutePosition
	end
	if var12.current then
		vector2_1 = var12.current.AbsolutePosition
	end
	if var13.current then
		vector2_2 = var13.current.AbsolutePosition
	end
	local minValue = math.min(var1.screenSize.Y - (vector2.Y + size1200 + small - vector2_1.Y) - small, 400)
	useExternalEvent(userInputService.InputBegan, reactModule.useCallback(function(p2)
		-- upvalues: size1200 (ref), small (ref), vector2_2 (write), var8 (ref), minValue (write), maxValue (ref), var6 (ref), var7 (ref)
		local var14 = size1200 + small
		
		if var6 and not (vector2_2.X < p2.Position.X and (p2.Position.X < vector2_2.X + var8 and (vector2_2.Y + var14 < p2.Position.Y and p2.Position.Y < vector2_2.Y + var14 + minValue))) and not (vector2_2.X < p2.Position.X and (p2.Position.X < vector2_2.X + maxValue and (vector2_2.Y < p2.Position.Y and p2.Position.Y < vector2_2.Y + size1200))) then
			var7(false)
		end
	end, {
		var6,
		vector2_2,
		var8,
		maxValue,
		size1200
	}))
	local var14 = var1.errorMessage and var1.errorMessage ~= ""
	local frame = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		[roactModule.Ref] = var11
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
				onButtonClick = function()
					-- upvalues: var7 (ref), var6 (ref), getFFlagAddMorePhoneUpsellEvents (copy), var1 (ref)
					var7(not var6)
					
					if getFFlagAddMorePhoneUpsellEvents then
						var1.onCountryCodeSelectorClick()
					end
				end,
				size = UDim2.new(0, maxValue, 0, tokens.Size.Size_1200),
				font = font,
				textSize = fontSize,
				forwardRef = var13,
				error = var14
			}),
			PhoneInputBox = reactModule.createElement(textField, {
				placeholder = "",
				required = true,
				LayoutOrder = 2,
				text = var1.phoneNumber,
				onChange = function(p2)
					-- upvalues: var1 (ref)
					var1.onPhoneNumberTextChange({ Text = p2 })
				end,
				width = UDim.new(1, -(maxValue + small)),
				error = var14,
				textInputType = if var1.usePhoneNumberTextType then Enum.TextInputType.Phone else Enum.TextInputType.Number,
				onFocusGained = if getFFlagAddMorePhoneUpsellEvents() then var1.onPhoneInputFocus else nil
			})
		}),
		ErrorText = var14 and reactModule.createElement("TextLabel", {
			TextTransparency = 0,
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Text = var1.errorMessage,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = tokens.Color.System.Alert.Color3,
			Font = var3.Font.Body.Font,
			TextSize = baseSize * var3.Font.CaptionSmall.RelativeSize,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		[roactModule.Ref] = var12
	}, {
		AddPhoneView = reactModule.createElement(interactiveAlert, {
			screenSize = var1.screenSize,
			buttonStackInfo = getButtonStackProps(var5.buttonKey, var1.onSetPhoneNumber, isDisabled, var5.extraButtonKey, var1.onExtraButtonClick),
			position = var1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -var1.keyboardHeight) or UDim2.fromScale(0.5, 0.5),
			anchorPoint = var1.isKeyboardShowing and Vector2.new(0.5, 1) or nil,
			title = var5.titleKey,
			onAbsoluteSizeChanged = var10,
			onCloseClicked = var1.onClose,
			middleContent = if fFlagInExperienceAddPhoneViewNewCopy then function()
				-- upvalues: reactModule (copy), tokens (ref), var5 (ref), baseSize (ref), var3 (ref), frame (ref), relativeSize (ref)
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
							Text = var5.subtitleKey,
							TextSize = baseSize,
							TextColor3 = var3.Theme.TextEmphasis.Color,
							TextTransparency = var3.Theme.TextEmphasis.Transparency,
							Font = var3.Font.Body.Font,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						PhoneInput = frame,
						PhonePrivacyText = reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = var5.phonePrivacyDisclaimerKey,
							TextSize = baseSize * relativeSize,
							TextColor3 = var3.Theme.TextEmphasis.Color,
							TextTransparency = var3.Theme.TextEmphasis.Transparency,
							Font = var3.Font.Body.Font,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						PrivacyText = reactModule.createElement("TextLabel", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = var5.disclaimerKey,
							TextSize = baseSize * relativeSize,
							TextColor3 = var3.Theme.TextEmphasis.Color,
							TextTransparency = var3.Theme.TextEmphasis.Transparency,
							Font = var3.Font.Body.Font,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					})
				})
			end else function()
				-- upvalues: reactModule (copy), tokens (ref), frame (ref), var5 (ref), baseSize (ref), relativeSize (ref), var3 (ref)
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
							Text = var5.disclaimerKey,
							TextSize = baseSize * relativeSize,
							TextColor3 = var3.Theme.TextEmphasis.Color,
							TextTransparency = var3.Theme.TextEmphasis.Transparency,
							Font = var3.Font.Body.Font,
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
			Size = UDim2.new(0, var8 - 24, 0, 0),
			Position = UDim2.new(0, vector2.X - vector2_1.X, 0, vector2.Y + size1200 + small - vector2_1.Y)
		}, {
			CountryCodeDropdown = reactModule.createElement(countryCodeDropdownContainer, {
				dropdownVisible = var6,
				position = UDim2.new(0, 0, 0, 0),
				maxHeight = minValue,
				onCountryCodeSelected = function(p2)
					-- upvalues: var1 (ref), var7 (ref)
					var1.setCountryCode(p2)
					var7(false)
				end
			})
		})
	})
end