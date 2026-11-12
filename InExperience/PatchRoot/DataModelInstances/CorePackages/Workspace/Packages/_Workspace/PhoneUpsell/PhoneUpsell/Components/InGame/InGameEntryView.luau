local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Checkbox = FoundationModule.Checkbox
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local LinkButton = UIBloxModule.App.Button.LinkButton
local GetFFlagDisablePVUpsellDataConsentFunction = require(Parent.SharedFlags).GetFFlagDisablePVUpsellDataConsent

local function noOp() end

local config = {
	isButtonDisabled = false,
	isExtraButtonDisabled = false,
	alwaysShowLegalText = false,
	requireLegalTextCheckbox = false,
	legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA",
	prefix = "1",
	onClose = noOp,
	onExtraButtonClick = noOp
}

local function getButtonStackProps(Text, ButtonHeight, OnActivated, IsDisabled, Text1, OnActivated1, IsDisabled1)
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
				onActivated = OnActivated1,
				text = Text1,
				isDisabled = IsDisabled1
			}
		})
	end
	return { buttonHeight = ButtonHeight, buttons = Buttons }
end

return function(p1)
	-- upvalues: MergePropsModule (copy), config (copy), ReactModule (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), InteractiveAlert (copy), getButtonStackProps (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), GetFFlagDisablePVUpsellDataConsentFunction (copy), Checkbox (copy), LinkButton (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local config1 = {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = MergePropsModuleResult.titleKey,
		descriptionKey = MergePropsModuleResult.descriptionKey,
		buttonKey = MergePropsModuleResult.buttonKey,
		legalTextKey = MergePropsModuleResult.legalTextKey
	}
	
	if MergePropsModuleResult.extraButtonKey and MergePropsModuleResult.extraButtonKey ~= "" then
		config1.extraButtonKey = MergePropsModuleResult.extraButtonKey
	end
	local UseStyleResult = UseStyleFunction()
	local BaseSize = UseStyleResult.Font.BaseSize
	local RelativeSize = UseStyleResult.Font.CaptionHeader.RelativeSize
	local Size150 = UseStyleResult.Tokens.Size.Size_150
	local UseLocalizationResult = UseLocalizationFunction(config1)
	UseLocalizationResult.legalTextKey = UseLocalizationResult.legalTextKey:gsub("{buttonText}", UseLocalizationResult.buttonKey)
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.titleKey,
		screenSize = MergePropsModuleResult.screenSize,
		buttonStackInfo = getButtonStackProps(UseLocalizationResult.buttonKey, UseStyleResult.Tokens.Size.Size_1200, MergePropsModuleResult.onButtonClick, MergePropsModuleResult.isButtonDisabled, UseLocalizationResult.extraButtonKey, MergePropsModuleResult.onExtraButtonClick, MergePropsModuleResult.isExtraButtonDisabled),
		onCloseClicked = MergePropsModuleResult.onClose,
		middleContent = function()
			-- upvalues: ReactModule (upval), UseLocalizationResult (copy), BaseSize (copy), UseStyleResult (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				BodyText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					RichText = true,
					Text = UseLocalizationResult.descriptionKey,
					TextSize = BaseSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		end,
		footerContent = if GetFFlagDisablePVUpsellDataConsentFunction() then function()
			return nil
		end else function()
			-- upvalues: ReactModule (upval), UseStyleResult (copy), MergePropsModuleResult (copy), Size150 (copy), Checkbox (upval), UseStateResult2 (copy), UseStateResult (copy), UseLocalizationResult (copy), BaseSize (copy), RelativeSize (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), LinkButton (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				ContentPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, UseStyleResult.Tokens.Size.Size_300)
				}),
				ListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, UseStyleResult.Tokens.Size.Size_150)
				}),
				LegalTextContainer = if MergePropsModuleResult.requireLegalTextCheckbox then ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, Size150)
					}),
					LegalCheckbox = ReactModule.createElement(Checkbox, {
						label = "",
						onActivated = UseStateResult2,
						isChecked = UseStateResult
					}),
					LegalText = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = UseLocalizationResult.legalTextKey,
						TextSize = BaseSize * RelativeSize,
						TextColor3 = UseStyleResult.Theme.TextDefault.Color,
						TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -(26 + Size150), 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				}) elseif MergePropsModuleResult.alwaysShowLegalText then ReactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = UseLocalizationResult.legalTextKey,
					TextSize = BaseSize * RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}) else MergePropsModuleResult.countryCode.prefix == "1" and ReactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = UseLocalizationResult.legalTextKey,
					TextSize = BaseSize * RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				LegalButtonsContainer = MergePropsModuleResult.countryCode.prefix == "1" and ReactModule.createElement("Frame", {
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
						text = UseLocalizationResult.termsOfUseKey,
						onActivated = MergePropsModuleResult.onTermsOfUseClick,
						size = UDim2.fromScale(0.2, 0.2)
					}),
					TextButtonDivider = ReactModule.createElement("TextLabel", {
						LayoutOrder = 6,
						BackgroundTransparency = 1,
						Text = "-",
						TextWrapped = true,
						TextSize = BaseSize * RelativeSize,
						TextColor3 = UseStyleResult.Theme.TextDefault.Color,
						TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
						Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
						TextXAlignment = Enum.TextXAlignment.Center,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					PrivacyPolicyButton = ReactModule.createElement(LinkButton, {
						layoutOrder = 7,
						fontStyle = "CaptionBody",
						text = UseLocalizationResult.privacyPolicyKey,
						onActivated = MergePropsModuleResult.onPrivacyPolicyClick
					})
				})
			})
		end
	})
end