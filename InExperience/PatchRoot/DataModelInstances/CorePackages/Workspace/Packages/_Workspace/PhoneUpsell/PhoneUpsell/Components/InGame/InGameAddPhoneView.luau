local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local UserInputService = game:GetService("UserInputService")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local StyleModule = require(Parent.Style)
local FoundationModule = require(Parent.Foundation)
local Text = require(Parent.AppCommonLib).Text
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local TextField = UIBloxModule.App.Input.TextField
local CountryCodeButtonModule = require(PhoneUpsell.Components.InGame.CountryCodeButton)
local CountryCodeDropdownContainer = require(Parent.AuthCommon).Components.InGame.CountryCodeDropdownContainer
local UseExternalEventFunction = require(Parent.RoactUtils).Hooks.useExternalEvent
local GetFFlagAddMorePhoneUpsellEventsFunction = require(Parent.SharedFlags).GetFFlagAddMorePhoneUpsellEvents
local FFlagInExperienceAddPhoneViewNewCopy = require(Parent.SharedFlags).FFlagInExperienceAddPhoneViewNewCopy
local _Vector2 = Vector2.new(10000, 10000)
local config = {
	alwaysShowLegalText = false,
	requireLegalTextCheckbox = false,
	legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA",
	prefix = "1",
	buttonKey = if FFlagInExperienceAddPhoneViewNewCopy then "Feature.AccountSettings.Action.Verify" else "Feature.VerificationUpsell.Action.Next"
}

local function getButtonStackProps(Text, OnActivated, IsDisabled, Text1, OnActivated1) --[[ Line: 74 ]]
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
	return { buttonHeight = 48, buttons = Buttons }
end

return function(p1) --[[ Line: 109 | Named "InGameAddPhoneView" ]]
	-- upvalues: MergePropsModule (copy), config (copy), FFlagInExperienceAddPhoneViewNewCopy (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), StyleModule (copy), _Vector2 (copy), Text (copy), UseExternalEventFunction (copy), UserInputService (copy), RoactModule (copy), CountryCodeButtonModule (copy), GetFFlagAddMorePhoneUpsellEventsFunction (copy), TextField (copy), NormalizeFontFaceFunction (copy), InteractiveAlert (copy), getButtonStackProps (copy), CountryCodeDropdownContainer (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	local Config = if FFlagInExperienceAddPhoneViewNewCopy then {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		subtitleKey = "Feature.AccountSettings.Description.AddPhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.AccountSettings.Description.NotShownPublicly",
		titleKey = MergePropsModuleResult.titleKey,
		descriptionKey = MergePropsModuleResult.descriptionKey,
		buttonKey = MergePropsModuleResult.buttonKey,
		legalTextKey = MergePropsModuleResult.legalTextKey
	} else {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = MergePropsModuleResult.titleKey,
		descriptionKey = MergePropsModuleResult.descriptionKey,
		buttonKey = MergePropsModuleResult.buttonKey,
		legalTextKey = MergePropsModuleResult.legalTextKey
	}
	
	if MergePropsModuleResult.extraButtonKey and MergePropsModuleResult.extraButtonKey ~= "" then
		Config.extraButtonKey = MergePropsModuleResult.extraButtonKey
	end
	local UseStyleResult = UseStyleFunction()
	local Tokens = UseStyleResult.Tokens
	local BodyLarge = Tokens.Typography.BodyLarge
	local BodyLargeFont = BodyLarge.Font
	local FontSize = BodyLarge.FontSize
	local UseLocalizationResult = UseLocalizationFunction(Config)
	local BaseSize = UseStyleResult.Font.BaseSize
	local RelativeSize = UseStyleResult.Font.CaptionHeader.RelativeSize
	local IsDisabled = MergePropsModuleResult.isDisabled
	local Small: number = Tokens.Gap.Small
	local Size1200: number = Tokens.Size.Size_1200
	local Prefix = MergePropsModuleResult.countryCode.prefix
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Largest = math.max((if FoundationFontFaceMigration then StyleModule.GetTextSize(Prefix, FontSize, BodyLargeFont, _Vector2).X else Text.GetTextWidth(Prefix, BodyLargeFont, FontSize)) + 24, Size1200)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(300)
	
	local function OnAbsoluteSizeChanged(Frame) --[[ Line: 162 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.X)
	end
	
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local _Vector2_1 = Vector2.new(0, 0)
	local _Vector2_2 = Vector2.new(0, 0)
	local _Vector2_3 = Vector2.new(0, 0)
	
	if UseRefResult.current then
		_Vector2_1 = UseRefResult.current.AbsolutePosition
	end
	if UseRefResult1.current then
		_Vector2_2 = UseRefResult1.current.AbsolutePosition
	end
	if UseRefResult2.current then
		_Vector2_3 = UseRefResult2.current.AbsolutePosition
	end
	local Smallest = math.min(MergePropsModuleResult.screenSize.Y - (_Vector2_1.Y + Size1200 + Small - _Vector2_2.Y) - Small, 400)
	UseExternalEventFunction(UserInputService.InputBegan, (ReactModule.useCallback(function(p2) --[[ Line: 192 ]]
		-- upvalues: Size1200 (copy), Small (copy), _Vector2_3 (ref), UseStateResult1 (copy), Smallest (ref), Largest (copy), UseStateResult (copy), UseStateResult2 (copy)
		local NewSize = Size1200 + Small
		local IsYBelow: boolean = _Vector2_3.X < p2.Position.X and (p2.Position.X < _Vector2_3.X + UseStateResult1 and _Vector2_3.Y + NewSize < p2.Position.Y) and p2.Position.Y < _Vector2_3.Y + NewSize + Smallest
		local IsYBelow1: boolean = _Vector2_3.X < p2.Position.X and (p2.Position.X < _Vector2_3.X + Largest and (_Vector2_3.Y < p2.Position.Y and p2.Position.Y < _Vector2_3.Y + Size1200))
		
		if UseStateResult and not IsYBelow and not IsYBelow1 then
			UseStateResult2(false)
		end
	end, {
		UseStateResult,
		_Vector2_3,
		UseStateResult1,
		Largest,
		Size1200
	})))
	local IsNotErrorMessageMatch: boolean = MergePropsModuleResult.errorMessage and MergePropsModuleResult.errorMessage ~= ""
	local Frame = ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		[RoactModule.Ref] = UseRefResult
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, Tokens.Size.Size_200)
		}),
		PhoneInputContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Small)
			}),
			CountryCodeButton = ReactModule.createElement(CountryCodeButtonModule, {
				layoutOrder = 1,
				countryPrefix = "+" .. Prefix,
				onButtonClick = function() --[[ Line: 245 ]]
					-- upvalues: UseStateResult2 (copy), UseStateResult (copy), GetFFlagAddMorePhoneUpsellEventsFunction (upval), MergePropsModuleResult (copy)
					UseStateResult2(not UseStateResult)
					
					if GetFFlagAddMorePhoneUpsellEventsFunction then
						MergePropsModuleResult.onCountryCodeSelectorClick()
					end
				end,
				size = UDim2.new(0, Largest, 0, Tokens.Size.Size_1200),
				font = BodyLargeFont,
				textSize = FontSize,
				forwardRef = UseRefResult2,
				error = IsNotErrorMessageMatch
			}),
			PhoneInputBox = ReactModule.createElement(TextField, {
				placeholder = "",
				required = true,
				LayoutOrder = 2,
				text = MergePropsModuleResult.phoneNumber,
				onChange = function(Text) --[[ Line: 262 ]]
					-- upvalues: MergePropsModuleResult (copy)
					MergePropsModuleResult.onPhoneNumberTextChange({ Text = Text })
				end,
				width = UDim.new(1, -(Largest + Small)),
				error = IsNotErrorMessageMatch,
				textInputType = if MergePropsModuleResult.usePhoneNumberTextType then Enum.TextInputType.Phone else Enum.TextInputType.Number,
				onFocusGained = if GetFFlagAddMorePhoneUpsellEventsFunction() then MergePropsModuleResult.onPhoneInputFocus else nil
			})
		}),
		ErrorText = IsNotErrorMessageMatch and ReactModule.createElement("TextLabel", {
			TextTransparency = 0,
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Text = MergePropsModuleResult.errorMessage,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = Tokens.Color.System.Alert.Color3,
			Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
			TextSize = BaseSize * UseStyleResult.Font.CaptionSmall.RelativeSize,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		[RoactModule.Ref] = UseRefResult1
	}, {
		AddPhoneView = ReactModule.createElement(InteractiveAlert, {
			screenSize = MergePropsModuleResult.screenSize,
			buttonStackInfo = getButtonStackProps(UseLocalizationResult.buttonKey, MergePropsModuleResult.onSetPhoneNumber, IsDisabled, UseLocalizationResult.extraButtonKey, MergePropsModuleResult.onExtraButtonClick),
			position = MergePropsModuleResult.isKeyboardShowing and UDim2.new(0.5, 0, 1, -MergePropsModuleResult.keyboardHeight) or UDim2.fromScale(0.5, 0.5),
			anchorPoint = MergePropsModuleResult.isKeyboardShowing and Vector2.new(0.5, 1) or nil,
			title = UseLocalizationResult.titleKey,
			onAbsoluteSizeChanged = OnAbsoluteSizeChanged,
			onCloseClicked = MergePropsModuleResult.onClose,
			middleContent = if FFlagInExperienceAddPhoneViewNewCopy then function() --[[ Line: 309 ]]
				-- upvalues: ReactModule (upval), Tokens (copy), UseLocalizationResult (copy), BaseSize (copy), UseStyleResult (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), Frame (copy), RelativeSize (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					AddPhoneViewFrame = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					}, {
						ListLayout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, Tokens.Size.Size_200)
						}),
						SubtitleText = ReactModule.createElement("TextLabel", {
							LayoutOrder = -1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = UseLocalizationResult.subtitleKey,
							TextSize = BaseSize,
							TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
							TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
							Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						PhoneInput = Frame,
						PhonePrivacyText = ReactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = UseLocalizationResult.phonePrivacyDisclaimerKey,
							TextSize = BaseSize * RelativeSize,
							TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
							TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
							Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						PrivacyText = ReactModule.createElement("TextLabel", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = UseLocalizationResult.disclaimerKey,
							TextSize = BaseSize * RelativeSize,
							TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
							TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
							Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					})
				})
			end else function() --[[ Line: 377 ]]
				-- upvalues: ReactModule (upval), Tokens (copy), Frame (copy), UseLocalizationResult (copy), BaseSize (copy), RelativeSize (copy), UseStyleResult (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					AddPhoneViewFrame = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					}, {
						ListLayout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, Tokens.Size.Size_200)
						}),
						PhoneInput = Frame,
						PrivacyText = ReactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Text = UseLocalizationResult.disclaimerKey,
							TextSize = BaseSize * RelativeSize,
							TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
							TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
							Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					})
				})
			end
		}),
		CountryCodeSelectorFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0, UseStateResult1 - 24, 0, 0),
			Position = UDim2.new(0, _Vector2_1.X - _Vector2_2.X, 0, _Vector2_1.Y + Size1200 + Small - _Vector2_2.Y)
		}, {
			CountryCodeDropdown = ReactModule.createElement(CountryCodeDropdownContainer, {
				dropdownVisible = UseStateResult,
				position = UDim2.new(0, 0, 0, 0),
				maxHeight = Smallest,
				onCountryCodeSelected = function(p2) --[[ Line: 439 ]]
					-- upvalues: MergePropsModuleResult (copy), UseStateResult2 (copy)
					MergePropsModuleResult.setCountryCode(p2)
					UseStateResult2(false)
				end
			})
		})
	})
end