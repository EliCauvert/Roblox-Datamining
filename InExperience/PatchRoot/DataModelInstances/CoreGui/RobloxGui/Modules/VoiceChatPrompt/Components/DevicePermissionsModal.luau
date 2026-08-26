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
local var1 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.OpenSettings")
local var2 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Ok")
local var3 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.NotNow")
local microphone = images["icons/controls/microphone"]
local var4 = argCheckModule.wrap(tModule.strictInterface({
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

local function DevicePermissionsModal(p1, p2)
	-- upvalues: var4 (ref), getMicDeeplinkDirectionsModule (ref), getPrimingTextModule (ref), textService (ref), getFFlagSupportGamepadNavInVoiceModals (ref), reactModule (ref), UIBloxModule (ref), assetsModule (ref), microphone (ref), button (ref), buttonType (ref), var3 (ref), var1 (ref), var2 (ref)
	assert(var4(p1))
	local var5 = getMicDeeplinkDirectionsModule(p1.settingsAppAvailable, p1.UserInputService)
	local var6 = getPrimingTextModule(p1.UserInputService)
	local var7 = 20 + textService:GetTextSize(p1.titleText, p1.promptStyle.Font.Header1.RelativeSize * p1.promptStyle.Font.BaseSize, p1.promptStyle.Font.Header1.Font, Vector2.new(325, 1e999)).Y
	local var8 = 20 + textService:GetTextSize(p1.bodyText, p1.promptStyle.Font.Body.RelativeSize * p1.promptStyle.Font.BaseSize, p1.promptStyle.Font.Body.Font, Vector2.new(325, 1e999)).Y
	local var9 = if var6 then 10 + textService:GetTextSize(var6, p1.promptStyle.Font.CaptionHeader.RelativeSize * p1.promptStyle.Font.BaseSize, p1.promptStyle.Font.CaptionHeader.Font, Vector2.new(325, 1e999)).Y else 0
	local var10 = if var5 then (if var6 then 10 else 20) + textService:GetTextSize(var5, p1.promptStyle.Font.Body.RelativeSize * p1.promptStyle.Font.BaseSize, p1.promptStyle.Font.Body.Font, Vector2.new(325, 1e999)).Y else 0
	local var11 = if var6 then 5.5 elseif var5 then 4.5 else 4
	local var12 = if getFFlagSupportGamepadNavInVoiceModals() then Enum.SelectionBehavior.Stop else nil
	local var13 = if getFFlagSupportGamepadNavInVoiceModals() then true else nil
	
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		Enabled = p1.showPrompt,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = p1.promptStyle.Theme.Overlay.Color,
			BackgroundTransparency = p1.promptStyle.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0)
		}),
		DialogMainFrame = reactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = p1.promptStyle.Theme.BackgroundUIDefault.Color,
			ImageTransparency = p1.promptStyle.Theme.BackgroundUIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			Size = UDim2.new(0, 365, 0, var7 + 5 + var8 + 36 + var11 * 20 + var10 + 55 + var9),
			AutomaticSize = Enum.AutomaticSize.Y,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
			SelectionBehaviorDown = var12,
			SelectionBehaviorLeft = var12,
			SelectionBehaviorRight = var12,
			SelectionBehaviorUp = var12,
			SelectionGroup = var13,
			ref = if getFFlagSupportGamepadNavInVoiceModals() then p2 else nil
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
				Size = UDim2.new(1, 0, 0, var7),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 7) }),
				TitleText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					fontStyle = p1.promptStyle.Font.Header1,
					colorStyle = p1.promptStyle.Theme.SystemPrimaryDefault,
					textXAlignment = Enum.TextXAlignment.Center,
					size = UDim2.new(1, 0, 1, 0),
					text = p1.titleText
				})
			}),
			Divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 3,
				BackgroundColor3 = p1.promptStyle.Theme.Divider.Color,
				BackgroundTransparency = p1.promptStyle.Theme.Divider.Transparency,
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
				Size = UDim2.new(1, 0, 0, var8)
			}, {
				BodyText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.2,
					fontStyle = p1.promptStyle.Font.Body,
					colorStyle = p1.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					size = UDim2.new(1, 0, 1, 0),
					text = p1.bodyText
				})
			}),
			InfoTextContainer = if var5 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, var10 + 20)
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if var6 then 8 else 15),
					PaddingLeft = UDim.new(0, 8)
				}),
				TextContainer = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var10)
				}, {
					InfoText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						lineHeight = 1.25,
						fontStyle = p1.promptStyle.Font.Body,
						colorStyle = p1.promptStyle.Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top,
						size = UDim2.new(1, 0, 1, 0),
						text = var5
					})
				})
			}) else nil,
			SpaceContainer = if not var6 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 7,
				Size = UDim2.new(1, 0, 0, if var5 then 40 else 20)
			}) else nil,
			PrimingTextContainer = if var6 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 8,
				Size = UDim2.new(1, 0, 0, var9)
			}, {
				PrimingText = reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.25,
					fontStyle = p1.promptStyle.Font.Body,
					colorStyle = p1.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Top,
					size = UDim2.new(1, 0, 1, 0),
					text = var6
				})
			}) else nil,
			SpaceContainerTemp = if var6 then reactModule.createElement("Frame", {
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
				SecondaryButton = if p1.settingsAppAvailable then reactModule.createElement(button, {
					layoutOrder = 1,
					buttonType = buttonType.Secondary,
					size = UDim2.new(0.5, -5, 0, 36),
					text = var3,
					onActivated = p1.handleSecondaryActivated,
					Selectable = var13
				}) else nil,
				ConfirmButton = reactModule.createElement(button, {
					layoutOrder = 2,
					buttonType = buttonType.PrimarySystem,
					size = UDim2.new(if p1.settingsAppAvailable then 0.5 else 1, -5, 0, 36),
					text = if p1.settingsAppAvailable then var1 else var2,
					onActivated = p1.handlePrimaryActivated,
					Selectable = var13
				})
			})
		})
	})
end

return if getFFlagSupportGamepadNavInVoiceModals() then reactModule.forwardRef(DevicePermissionsModal) else DevicePermissionsModal