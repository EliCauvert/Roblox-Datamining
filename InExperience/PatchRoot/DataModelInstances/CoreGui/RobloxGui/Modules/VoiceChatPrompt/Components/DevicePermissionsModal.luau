local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local reactModule = require(corePackagesService.Packages.React)
local tModule = require(corePackagesService.Packages.t)
local argCheckModule = require(corePackagesService.Workspace.Packages.ArgCheck)
local voiceChatModule = require(corePackagesService.Workspace.Packages.VoiceChat)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local assetsModule = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getMicDeeplinkDirectionsModule = require(script.Parent.Parent.Helpers.getMicDeeplinkDirections)
local getPrimingTextModule = require(script.Parent.Parent.Helpers.getPrimingText)
local getFFlagSupportGamepadNavInVoiceModals = voiceChatModule.Flags.GetFFlagSupportGamepadNavInVoiceModals
local var11 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.OpenSettings")
local var12 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Ok")
local var13 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.NotNow")
local microphone = images["icons/controls/microphone"]
local var14 = argCheckModule.wrap(tModule.strictInterface({
	titleText = tModule.string,
	bodyText = tModule.string,
	handlePrimaryActivated = tModule.callback,
	handleSecondaryActivated = tModule.callback,
	Analytics = tModule.table,
	promptStyle = tModule.table,
	showPrompt = tModule.boolean,
	settingsAppAvailable = tModule.boolean,
	UserInputService = tModule.table
}))

local function DevicePermissionsModal(p0, p1) --[[ line: 65 ]]
	-- upvalues: var14 (ref), getMicDeeplinkDirectionsModule (ref), getPrimingTextModule (ref), textService (ref), getFFlagSupportGamepadNavInVoiceModals (ref), reactModule (ref), UIBloxModule (ref), assetsModule (ref), microphone (ref), button (ref), buttonType (ref), var13 (ref), var11 (ref), var12 (ref)
	assert(var14(p0))
	local var16 = getMicDeeplinkDirectionsModule(p0.settingsAppAvailable, p0.UserInputService)
	local var17 = getPrimingTextModule(p0.UserInputService)
	local var18 = 20 + textService:GetTextSize(p0.titleText, p0.promptStyle.Font.Header1.RelativeSize * p0.promptStyle.Font.BaseSize, p0.promptStyle.Font.Header1.Font, Vector2.new(325, 1e999)).Y
	local var19 = 20 + textService:GetTextSize(p0.bodyText, p0.promptStyle.Font.Body.RelativeSize * p0.promptStyle.Font.BaseSize, p0.promptStyle.Font.Body.Font, Vector2.new(325, 1e999)).Y
	local var20 = if var17 then 10 + textService:GetTextSize(var17, p0.promptStyle.Font.CaptionHeader.RelativeSize * p0.promptStyle.Font.BaseSize, p0.promptStyle.Font.CaptionHeader.Font, Vector2.new(325, 1e999)).Y else 0
	local var21 = if var16 then (if var17 then 10 else 20) + textService:GetTextSize(var16, p0.promptStyle.Font.Body.RelativeSize * p0.promptStyle.Font.BaseSize, p0.promptStyle.Font.Body.Font, Vector2.new(325, 1e999)).Y else 0
	local var22 = if var17 then 5.5 elseif var16 then 4.5 else 4
	local var23 = if getFFlagSupportGamepadNavInVoiceModals() then Enum.SelectionBehavior.Stop else nil
	local var24 = if getFFlagSupportGamepadNavInVoiceModals() then true else nil
	
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		Enabled = p0.showPrompt,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = p0.promptStyle.Theme.Overlay.Color,
			BackgroundTransparency = p0.promptStyle.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0)
		}),
		DialogMainFrame = reactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = p0.promptStyle.Theme.BackgroundUIDefault.Color,
			ImageTransparency = p0.promptStyle.Theme.BackgroundUIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			Size = UDim2.new(0, 365, 0, var18 + 5 + var19 + 36 + var22 * 20 + var21 + 55 + var20),
			AutomaticSize = Enum.AutomaticSize.Y,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
			SelectionBehaviorDown = var23,
			SelectionBehaviorLeft = var23,
			SelectionBehaviorRight = var23,
			SelectionBehaviorUp = var23,
			SelectionGroup = var24,
			ref = if getFFlagSupportGamepadNavInVoiceModals() then p1 else nil
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15),
				PaddingBottom = UDim.new(0, 20),
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20)
			}),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = reactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = microphone,
				Size = UDim2.new(0, 55, 0, 55)
			}),
			TitleTextContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var18),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 7) }),
				TitleText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					fontStyle = p0.promptStyle.Font.Header1,
					colorStyle = p0.promptStyle.Theme.SystemPrimaryDefault,
					textXAlignment = Enum.TextXAlignment.Center,
					size = UDim2.new(1, 0, 1, 0),
					text = p0.titleText
				})
			}),
			Divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 3,
				BackgroundColor3 = p0.promptStyle.Theme.Divider.Color,
				BackgroundTransparency = p0.promptStyle.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}),
			DividerSpaceContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 15)
			}),
			BodyTextContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, var19)
			}, {
				BodyText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.2,
					fontStyle = p0.promptStyle.Font.Body,
					colorStyle = p0.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					size = UDim2.new(1, 0, 1, 0),
					text = p0.bodyText
				})
			}),
			InfoTextContainer = if var16 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, var21 + 20)
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if var17 then 8 else 15),
					PaddingLeft = UDim.new(0, 8)
				}),
				TextContainer = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var21)
				}, {
					InfoText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						lineHeight = 1.25,
						fontStyle = p0.promptStyle.Font.Body,
						colorStyle = p0.promptStyle.Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top,
						size = UDim2.new(1, 0, 1, 0),
						text = var16
					})
				})
			}) else nil,
			SpaceContainer = if not var17 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 7,
				Size = UDim2.new(1, 0, 0, if var16 then 40 else 20)
			}) else nil,
			PrimingTextContainer = if var17 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 8,
				Size = UDim2.new(1, 0, 0, var20)
			}, {
				PrimingText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.25,
					fontStyle = p0.promptStyle.Font.Body,
					colorStyle = p0.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Top,
					size = UDim2.new(1, 0, 1, 0),
					text = var17
				})
			}) else nil,
			SpaceContainerTemp = if var17 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 9,
				Size = UDim2.new(1, 0, 0, 30)
			}) else nil,
			ButtonContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 10,
				Size = UDim2.new(1, 0, 0, 36)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 12),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				SecondaryButton = if p0.settingsAppAvailable then reactModule.createElement(button, {
					layoutOrder = 1,
					buttonType = buttonType.Secondary,
					size = UDim2.new(0.5, -5, 0, 36),
					text = var13,
					onActivated = p0.handleSecondaryActivated,
					Selectable = var24
				}) else nil,
				ConfirmButton = reactModule.createElement(button, {
					layoutOrder = 2,
					buttonType = buttonType.PrimarySystem,
					size = UDim2.new(if p0.settingsAppAvailable then 0.5 else 1, -5, 0, 36),
					text = if p0.settingsAppAvailable then var11 else var12,
					onActivated = p0.handlePrimaryActivated,
					Selectable = var24
				})
			})
		})
	})
end

return if getFFlagSupportGamepadNavInVoiceModals() then reactModule.forwardRef(DevicePermissionsModal) else DevicePermissionsModal