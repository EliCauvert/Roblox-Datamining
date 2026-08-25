local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local tModule = require(corePackagesService.Packages.t)
local argCheckModule = require(corePackagesService.Workspace.Packages.ArgCheck)
local voiceChatModule = require(corePackagesService.Workspace.Packages.VoiceChat)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local checkbox = require(corePackagesService.Packages.Foundation).Checkbox
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local _ = UIBloxModule.App.ImageSet.Images
local assetsModule = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getFFlagSupportGamepadNavInVoiceModals = voiceChatModule.Flags.GetFFlagSupportGamepadNavInVoiceModals
local getFFlagDisablePVUpsellDataConsent = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local var10 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.TurnOn")
local var11 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.NotNow")
local var12 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.SelectingTurnOn")
local var13 = argCheckModule.wrap(tModule.strictInterface({
	titleText = tModule.optional(tModule.string),
	bodyText = tModule.optional(tModule.string),
	handlePrimaryActivated = tModule.optional(tModule.callback),
	handleSecondaryActivated = tModule.optional(tModule.callback),
	Analytics = tModule.optional(tModule.table),
	showCheckbox = tModule.optional(tModule.boolean),
	promptStyle = tModule.optional(tModule.table),
	showPrompt = tModule.optional(tModule.boolean)
}))

local function VoiceChatConsentModal(p0, p1)
	-- upvalues: var13 (ref), reactModule (ref), textService (ref), var12 (ref), getFFlagSupportGamepadNavInVoiceModals (ref), roactModule (ref), UIBloxModule (ref), assetsModule (ref), getFFlagDisablePVUpsellDataConsent (ref), checkbox (ref), button (ref), buttonType (ref), var11 (ref), var10 (ref)
	assert(var13(p0))
	local var15, var16 = reactModule.useState(false)
	local var17 = 20 + textService:GetTextSize(p0.titleText, p0.promptStyle.Font.Header1.RelativeSize * p0.promptStyle.Font.BaseSize, p0.promptStyle.Font.Header1.Font, Vector2.new(325, 1e999)).Y
	local var18 = 20 + textService:GetTextSize(p0.bodyText, p0.promptStyle.Font.Body.RelativeSize * p0.promptStyle.Font.BaseSize, p0.promptStyle.Font.Body.Font, Vector2.new(325, 1e999)).Y
	local var19 = 20 + textService:GetTextSize(var12, p0.promptStyle.Font.CaptionHeader.RelativeSize * p0.promptStyle.Font.BaseSize, p0.promptStyle.Font.CaptionHeader.Font, Vector2.new(325, 1e999)).Y
	local var20 = if getFFlagSupportGamepadNavInVoiceModals() then Enum.SelectionBehavior.Stop else nil
	local var21 = if getFFlagSupportGamepadNavInVoiceModals() then true else nil
	
	return roactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		Enabled = p0.showPrompt,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = roactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = p0.promptStyle.Theme.Overlay.Color,
			BackgroundTransparency = p0.promptStyle.Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0)
		}),
		DialogMainFrame = roactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = p0.promptStyle.Theme.BackgroundUIDefault.Color,
			ImageTransparency = p0.promptStyle.Theme.BackgroundUIDefault.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			Size = UDim2.new(0, 365, 0, var17 + 1 + var18 + 14 + 36 + (if not getFFlagDisablePVUpsellDataConsent() then 60 + var19 else 0)),
			AutomaticSize = Enum.AutomaticSize.Y,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
			SelectionBehaviorDown = var20,
			SelectionBehaviorLeft = var20,
			SelectionBehaviorRight = var20,
			SelectionBehaviorUp = var20,
			SelectionGroup = var21,
			ref = if getFFlagSupportGamepadNavInVoiceModals() then p1 else nil
		}, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 20),
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20)
			}),
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			TitleTextContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var17),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				TitleText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					fontStyle = p0.promptStyle.Font.Header1,
					colorStyle = p0.promptStyle.Theme.SystemPrimaryDefault,
					textXAlignment = Enum.TextXAlignment.Center,
					size = UDim2.new(1, 0, 1, 0),
					text = p0.titleText
				})
			}),
			Divider = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				BackgroundColor3 = p0.promptStyle.Theme.Divider.Color,
				BackgroundTransparency = p0.promptStyle.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}),
			DividerSpaceContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 7)
			}),
			BodyTextContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, var18)
			}, {
				BodyText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
					lineHeight = 1.2,
					fontStyle = p0.promptStyle.Font.Body,
					colorStyle = p0.promptStyle.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					size = UDim2.new(1, 0, 1, 0),
					text = p0.bodyText
				})
			}),
			InfoTextContainer = if not getFFlagDisablePVUpsellDataConsent() then roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, var19 + 20)
			}, {
				Padding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 15) }),
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				Checkbox = p0.showCheckbox and roactModule.createElement(checkbox, {
					label = "",
					isDisabled = false,
					LayoutOrder = 1,
					isChecked = var15,
					onActivated = function(p2)
						-- upvalues: var16 (ref)
						var16(p2)
					end
				}),
				TextContainer = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(if p0.showCheckbox then 0.95 else 1, 0, 0, var19)
				}, {
					Padding = p0.showCheckbox and roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 10) }),
					InfoText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						lineHeight = 1.15,
						fontStyle = p0.promptStyle.Font.CaptionHeader,
						colorStyle = p0.promptStyle.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top,
						size = UDim2.new(1, 0, 1, 0),
						text = var12
					})
				})
			}) else nil,
			SpaceContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, 10)
			}),
			ButtonContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 7,
				Size = UDim2.new(1, 0, 0, 36),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 12),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				SecondaryButton = roactModule.createElement(button, {
					layoutOrder = 1,
					buttonType = buttonType.Secondary,
					size = UDim2.new(0.5, -5, 0, 36),
					text = var11,
					onActivated = p0.handleSecondaryActivated,
					Selectable = var21
				}),
				ConfirmButton = roactModule.createElement(button, {
					layoutOrder = 2,
					buttonType = buttonType.PrimarySystem,
					size = UDim2.new(0.5, -5, 0, 36),
					text = var10,
					isDisabled = p0.showCheckbox and not var15,
					onActivated = p0.handlePrimaryActivated,
					Selectable = var21
				})
			})
		})
	})
end

return if getFFlagSupportGamepadNavInVoiceModals() then reactModule.forwardRef(VoiceChatConsentModal) else VoiceChatConsentModal