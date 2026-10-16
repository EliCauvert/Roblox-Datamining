local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Checkbox = FoundationModule.Checkbox
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local _ = UIBloxModule.App.ImageSet.Images
local AssetsModule = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GetFFlagSupportGamepadNavInVoiceModalsFunction = require(CorePackages.Workspace.Packages.VoiceChat).Flags.GetFFlagSupportGamepadNavInVoiceModals
local GetFFlagDisablePVUpsellDataConsentFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local FeatureSettingsHubActionTurnOn = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.TurnOn")
local FeatureSettingsHubActionNotNow = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.NotNow")
local FeatureSettingsHubPromptSubtitleSelectingTurnOn = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.SelectingTurnOn")
local WrapResult = require(CorePackages.Workspace.Packages.ArgCheck).wrap(TModule.strictInterface({
	titleText = TModule.optional(TModule.string),
	bodyText = TModule.optional(TModule.string),
	handlePrimaryActivated = TModule.optional(TModule.callback),
	handleSecondaryActivated = TModule.optional(TModule.callback),
	Analytics = TModule.optional(TModule.table),
	showCheckbox = TModule.optional(TModule.boolean),
	promptStyle = TModule.optional(TModule.table),
	showPrompt = TModule.optional(TModule.boolean)
}))

local function VoiceChatConsentModal(p1, p2) --[[ Line: 68 ]]
	-- upvalues: WrapResult (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), FeatureSettingsHubPromptSubtitleSelectingTurnOn (copy), GetFFlagSupportGamepadNavInVoiceModalsFunction (copy), RoactModule (copy), UIBloxModule (copy), AssetsModule (copy), GetFFlagDisablePVUpsellDataConsentFunction (copy), Checkbox (copy), Button (copy), ButtonType (copy), FeatureSettingsHubActionNotNow (copy), FeatureSettingsHubActionTurnOn (copy)
	assert(WrapResult(p1))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local HeaderFont = p1.promptStyle.Font.Header1.Font
	local ScaledRelativeSize = p1.promptStyle.Font.Header1.RelativeSize * p1.promptStyle.Font.BaseSize
	local YOffset = 20 + (if FoundationFontFaceMigration then GetTextSizeFunction(p1.titleText, ScaledRelativeSize, HeaderFont, Vector2.new(325, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(p1.titleText, ScaledRelativeSize, HeaderFont, Vector2.new(325, 1e999)).Y)
	local BodyFont = p1.promptStyle.Font.Body.Font
	local ScaledRelativeSize1 = p1.promptStyle.Font.Body.RelativeSize * p1.promptStyle.Font.BaseSize
	local YOffset1 = 20 + (if FoundationFontFaceMigration then GetTextSizeFunction(p1.bodyText, ScaledRelativeSize1, BodyFont, Vector2.new(325, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(p1.bodyText, ScaledRelativeSize1, BodyFont, Vector2.new(325, 1e999)).Y)
	local CaptionHeaderFont = p1.promptStyle.Font.CaptionHeader.Font
	local ScaledRelativeSize2 = p1.promptStyle.Font.CaptionHeader.RelativeSize * p1.promptStyle.Font.BaseSize
	local YOffset2 = 20 + (if FoundationFontFaceMigration then GetTextSizeFunction(FeatureSettingsHubPromptSubtitleSelectingTurnOn, ScaledRelativeSize2, CaptionHeaderFont, Vector2.new(325, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(FeatureSettingsHubPromptSubtitleSelectingTurnOn, ScaledRelativeSize2, CaptionHeaderFont, Vector2.new(325, 1e999)).Y)
	local Stop = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then Enum.SelectionBehavior.Stop else nil
	local Selectable = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then true else nil
	
	return RoactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		Enabled = p1.showPrompt,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = RoactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = p1.promptStyle.Theme.Overlay.Color,
			BackgroundTransparency = p1.promptStyle.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0)
		}),
		DialogMainFrame = RoactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = AssetsModule.Images.RoundedRect.Image,
			ImageColor3 = p1.promptStyle.Theme.BackgroundUIDefault.Color,
			ImageTransparency = p1.promptStyle.Theme.BackgroundUIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
			Size = UDim2.new(0, 365, 0, YOffset + 1 + YOffset1 + 14 + 36 + (if GetFFlagDisablePVUpsellDataConsentFunction() then 0 else 60 + YOffset2)),
			AutomaticSize = Enum.AutomaticSize.Y,
			SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter,
			SelectionBehaviorDown = Stop,
			SelectionBehaviorLeft = Stop,
			SelectionBehaviorRight = Stop,
			SelectionBehaviorUp = Stop,
			SelectionGroup = Selectable,
			ref = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then p2 else nil
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 20),
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20)
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			TitleTextContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, YOffset),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				TitleText = RoactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					fontStyle = p1.promptStyle.Font.Header1,
					colorStyle = p1.promptStyle.Theme.SystemPrimaryDefault,
					textXAlignment = Enum.TextXAlignment.Center,
					size = UDim2.new(1, 0, 1, 0),
					text = p1.titleText
				})
			}),
			Divider = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				BackgroundColor3 = p1.promptStyle.Theme.Divider.Color,
				BackgroundTransparency = p1.promptStyle.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}),
			DividerSpaceContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 7)
			}),
			BodyTextContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, YOffset1)
			}, {
				BodyText = RoactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.2,
					fontStyle = p1.promptStyle.Font.Body,
					colorStyle = p1.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					size = UDim2.new(1, 0, 1, 0),
					text = p1.bodyText
				})
			}),
			InfoTextContainer = if GetFFlagDisablePVUpsellDataConsentFunction() then nil else RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, YOffset2 + 20)
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 15) }),
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				Checkbox = p1.showCheckbox and RoactModule.createElement(Checkbox, {
					label = "",
					isDisabled = false,
					LayoutOrder = 1,
					isChecked = UseStateResult,
					onActivated = function(p3) --[[ Line: 223 ]]
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(p3)
					end
				}),
				TextContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(if p1.showCheckbox then 0.95 else 1, 0, 0, YOffset2)
				}, {
					Padding = p1.showCheckbox and RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 10) }),
					InfoText = RoactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						lineHeight = 1.15,
						fontStyle = p1.promptStyle.Font.CaptionHeader,
						colorStyle = p1.promptStyle.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top,
						size = UDim2.new(1, 0, 1, 0),
						text = FeatureSettingsHubPromptSubtitleSelectingTurnOn
					})
				})
			}),
			SpaceContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, 10)
			}),
			ButtonContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 7,
				Size = UDim2.new(1, 0, 0, 36),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 12),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				SecondaryButton = RoactModule.createElement(Button, {
					layoutOrder = 1,
					buttonType = ButtonType.Secondary,
					size = UDim2.new(0.5, -5, 0, 36),
					text = FeatureSettingsHubActionNotNow,
					onActivated = p1.handleSecondaryActivated,
					Selectable = Selectable
				}),
				ConfirmButton = RoactModule.createElement(Button, {
					layoutOrder = 2,
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.new(0.5, -5, 0, 36),
					text = FeatureSettingsHubActionTurnOn,
					isDisabled = p1.showCheckbox and not UseStateResult,
					onActivated = p1.handlePrimaryActivated,
					Selectable = Selectable
				})
			})
		})
	})
end

return if GetFFlagSupportGamepadNavInVoiceModalsFunction() then ReactModule.forwardRef(VoiceChatConsentModal) else VoiceChatConsentModal