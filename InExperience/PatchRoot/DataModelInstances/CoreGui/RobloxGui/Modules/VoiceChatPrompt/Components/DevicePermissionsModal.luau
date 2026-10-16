local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local FoundationFontFaceMigration = require(CorePackages.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local AssetsModule = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GetMicDeeplinkDirectionsModule = require(script.Parent.Parent.Helpers.getMicDeeplinkDirections)
local GetPrimingTextModule = require(script.Parent.Parent.Helpers.getPrimingText)
local GetFFlagSupportGamepadNavInVoiceModalsFunction = require(CorePackages.Workspace.Packages.VoiceChat).Flags.GetFFlagSupportGamepadNavInVoiceModals
local FeatureSettingsHubActionOpenSettings = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.OpenSettings")
local FeatureSettingsHubActionOk = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Ok")
local FeatureSettingsHubActionNotNow = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.NotNow")
local IconsControlsMicrophone = UIBloxModule.App.ImageSet.Images["icons/controls/microphone"]
local WrapResult = require(CorePackages.Workspace.Packages.ArgCheck).wrap(TModule.strictInterface({
	titleText = TModule.string,
	bodyText = TModule.string,
	handlePrimaryActivated = TModule.callback,
	handleSecondaryActivated = TModule.callback,
	Analytics = TModule.table,
	promptStyle = TModule.table,
	showPrompt = TModule.boolean,
	settingsAppAvailable = TModule.boolean,
	UserInputService = TModule.table
}))

local function DevicePermissionsModal(p1, p2) --[[ Line: 68 ]]
	-- upvalues: WrapResult (copy), GetMicDeeplinkDirectionsModule (copy), GetPrimingTextModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), GetFFlagSupportGamepadNavInVoiceModalsFunction (copy), ReactModule (copy), UIBloxModule (copy), AssetsModule (copy), IconsControlsMicrophone (copy), Button (copy), ButtonType (copy), FeatureSettingsHubActionNotNow (copy), FeatureSettingsHubActionOpenSettings (copy), FeatureSettingsHubActionOk (copy)
	assert(WrapResult(p1))
	local MicDeeplinkDirectionsModule = GetMicDeeplinkDirectionsModule(p1.settingsAppAvailable, p1.UserInputService)
	local PrimingTextModule = GetPrimingTextModule(p1.UserInputService)
	local HeaderFont = p1.promptStyle.Font.Header1.Font
	local ScaledRelativeSize = p1.promptStyle.Font.Header1.RelativeSize * p1.promptStyle.Font.BaseSize
	local YOffset = 20 + (if FoundationFontFaceMigration then GetTextSizeFunction(p1.titleText, ScaledRelativeSize, HeaderFont, Vector2.new(325, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(p1.titleText, ScaledRelativeSize, HeaderFont, Vector2.new(325, 1e999)).Y)
	local BodyFont = p1.promptStyle.Font.Body.Font
	local ScaledRelativeSize1 = p1.promptStyle.Font.Body.RelativeSize * p1.promptStyle.Font.BaseSize
	local YOffset2 = 20 + (if FoundationFontFaceMigration then GetTextSizeFunction(p1.bodyText, ScaledRelativeSize1, BodyFont, Vector2.new(325, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(p1.bodyText, ScaledRelativeSize1, BodyFont, Vector2.new(325, 1e999)).Y)
	local YOffset3 = 0
	
	if PrimingTextModule then
		local CaptionHeaderFont = p1.promptStyle.Font.CaptionHeader.Font
		local ScaledRelativeSize2 = p1.promptStyle.Font.CaptionHeader.RelativeSize * p1.promptStyle.Font.BaseSize
		YOffset3 = 10 + (if FoundationFontFaceMigration then GetTextSizeFunction(PrimingTextModule, ScaledRelativeSize2, CaptionHeaderFont, Vector2.new(325, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(PrimingTextModule, ScaledRelativeSize2, CaptionHeaderFont, Vector2.new(325, 1e999)).Y)
	end
	local YOffset1 = 0
	
	if MicDeeplinkDirectionsModule then
		local BodyFont1 = p1.promptStyle.Font.Body.Font
		local ScaledRelativeSize3 = p1.promptStyle.Font.Body.RelativeSize * p1.promptStyle.Font.BaseSize
		YOffset1 = (if PrimingTextModule then 10 else 20) + (if FoundationFontFaceMigration then GetTextSizeFunction(MicDeeplinkDirectionsModule, ScaledRelativeSize3, BodyFont1, Vector2.new(325, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(MicDeeplinkDirectionsModule, ScaledRelativeSize3, BodyFont1, Vector2.new(325, 1e999)).Y)
	end
	local Stop = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then Enum.SelectionBehavior.Stop else nil
	local Selectable = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then true else nil
	
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		Enabled = p1.showPrompt,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = p1.promptStyle.Theme.Overlay.Color,
			BackgroundTransparency = p1.promptStyle.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0)
		}),
		DialogMainFrame = ReactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = AssetsModule.Images.RoundedRect.Image,
			ImageColor3 = p1.promptStyle.Theme.BackgroundUIDefault.Color,
			ImageTransparency = p1.promptStyle.Theme.BackgroundUIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
			Size = UDim2.new(0, 365, 0, YOffset + 5 + YOffset2 + 36 + (if MicDeeplinkDirectionsModule then if PrimingTextModule then 5.5 else 4.5 elseif PrimingTextModule then 5.5 else 4) * 20 + YOffset1 + 55 + YOffset3),
			AutomaticSize = Enum.AutomaticSize.Y,
			SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter,
			SelectionBehaviorDown = Stop,
			SelectionBehaviorLeft = Stop,
			SelectionBehaviorRight = Stop,
			SelectionBehaviorUp = Stop,
			SelectionGroup = Selectable,
			ref = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then p2 else nil
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15),
				PaddingBottom = UDim.new(0, 20),
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20)
			}),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = ReactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = IconsControlsMicrophone,
				Size = UDim2.new(0, 55, 0, 55)
			}),
			TitleTextContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, YOffset),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 7) }),
				TitleText = ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					fontStyle = p1.promptStyle.Font.Header1,
					colorStyle = p1.promptStyle.Theme.SystemPrimaryDefault,
					textXAlignment = Enum.TextXAlignment.Center,
					size = UDim2.new(1, 0, 1, 0),
					text = p1.titleText
				})
			}),
			Divider = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 3,
				BackgroundColor3 = p1.promptStyle.Theme.Divider.Color,
				BackgroundTransparency = p1.promptStyle.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}),
			DividerSpaceContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 15)
			}),
			BodyTextContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, YOffset2)
			}, {
				BodyText = ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.2,
					fontStyle = p1.promptStyle.Font.Body,
					colorStyle = p1.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					size = UDim2.new(1, 0, 1, 0),
					text = p1.bodyText
				})
			}),
			InfoTextContainer = if MicDeeplinkDirectionsModule then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, YOffset1 + 20)
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if PrimingTextModule then 8 else 15),
					PaddingLeft = UDim.new(0, 8)
				}),
				TextContainer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, YOffset1)
				}, {
					InfoText = ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						lineHeight = 1.25,
						fontStyle = p1.promptStyle.Font.Body,
						colorStyle = p1.promptStyle.Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top,
						size = UDim2.new(1, 0, 1, 0),
						text = MicDeeplinkDirectionsModule
					})
				})
			}) else nil,
			SpaceContainer = if PrimingTextModule then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 7,
				Size = UDim2.new(1, 0, 0, if MicDeeplinkDirectionsModule then 40 else 20)
			}),
			PrimingTextContainer = if PrimingTextModule then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 8,
				Size = UDim2.new(1, 0, 0, YOffset3)
			}, {
				PrimingText = ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.25,
					fontStyle = p1.promptStyle.Font.Body,
					colorStyle = p1.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Top,
					size = UDim2.new(1, 0, 1, 0),
					text = PrimingTextModule
				})
			}) else nil,
			SpaceContainerTemp = if PrimingTextModule then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 9,
				Size = UDim2.new(1, 0, 0, 30)
			}) else nil,
			ButtonContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 10,
				Size = UDim2.new(1, 0, 0, 36)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 12),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				SecondaryButton = if p1.settingsAppAvailable then ReactModule.createElement(Button, {
					layoutOrder = 1,
					buttonType = ButtonType.Secondary,
					size = UDim2.new(0.5, -5, 0, 36),
					text = FeatureSettingsHubActionNotNow,
					onActivated = p1.handleSecondaryActivated,
					Selectable = Selectable
				}) else nil,
				ConfirmButton = ReactModule.createElement(Button, {
					layoutOrder = 2,
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.new(if p1.settingsAppAvailable then 0.5 else 1, -5, 0, 36),
					text = if p1.settingsAppAvailable then FeatureSettingsHubActionOpenSettings else FeatureSettingsHubActionOk,
					onActivated = p1.handlePrimaryActivated,
					Selectable = Selectable
				})
			})
		})
	})
end

return if GetFFlagSupportGamepadNavInVoiceModalsFunction() then ReactModule.forwardRef(DevicePermissionsModal) else DevicePermissionsModal