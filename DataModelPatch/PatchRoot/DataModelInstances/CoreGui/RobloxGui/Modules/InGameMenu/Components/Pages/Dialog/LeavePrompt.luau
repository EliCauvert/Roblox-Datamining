local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local GameIconModule = require(Parent.GameIcon)
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ThemedTextLabelModule = require(Parent.ThemedTextLabel)
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FocusHandlerModule = require(Parent.Connection.FocusHandler)
local ZonePortalModule = require(Parent.ZonePortal)
local DirectionModule = require(Parent.Parent.Enums.Direction)
local GetFFlagEnableVRFTUXExperienceModule = require(RobloxGui.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local IsFTUXExperienceModule = require(RobloxGui.Modules.FTUX.Utility.IsFTUXExperience)
local PlatformEnumModule = require(RobloxGui.Modules.FTUX.Enums.PlatformEnum)
local LeavePrompt = Roact.PureComponent:extend("LeavePrompt")
LeavePrompt.validateProps = T.strictInterface({
	titleText = T.string,
	bodyText = T.string,
	confirmText = T.string,
	cancelText = T.string,
	onConfirm = T.callback,
	onCancel = T.callback,
	canGamepadCaptureFocus = T.boolean,
	canKeyboardCaptureFocus = T.boolean
})
LeavePrompt.defaultProps = {
	canGamepadCaptureFocus = false,
	canKeyboardCaptureFocus = false
}

function LeavePrompt.init(p1)
	-- upvalues: Roact (copy)
	p1.leaveButtonRef = Roact.createRef()
end

function LeavePrompt.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), GameIconModule (copy), ThemedTextLabelModule (copy), GetFFlagEnableVRFTUXExperienceModule (copy), IsFTUXExperienceModule (copy), PlatformEnumModule (copy), Button (copy), ButtonType (copy), FocusHandlerModule (copy), GuiService (copy), ZonePortalModule (copy), DirectionModule (copy), ContextActionService (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				BackgroundDefault = {
					Color = p2.Color.Surface.Surface_0.Color3,
					Transparency = p2.Color.Surface.Surface_0.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Header1 = {
					Font = p2.Typography.HeadingSmall.Font,
					RelativeSize = p2.Typography.HeadingSmall.FontSize
				},
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					RelativeSize = p2.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: Roact (upval), GameIconModule (upval), ThemedTextLabelModule (upval), p1 (copy), GetFFlagEnableVRFTUXExperienceModule (upval), IsFTUXExperienceModule (upval), PlatformEnumModule (upval), Button (upval), ButtonType (upval), FocusHandlerModule (upval), GuiService (upval), ZonePortalModule (upval), DirectionModule (upval), ContextActionService (upval)
		local _Font = p2.Font
		
		return Roact.createElement("ImageButton", {
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency
		}, {
			Content = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Selectable = false,
				Size = UDim2.fromScale(1, 1)
			}, {
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 24),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				GameThumbnail = Roact.createElement(GameIconModule, { iconSize = 100, layoutOrder = 1, gameId = game.GameId }),
				TitleText = Roact.createElement(ThemedTextLabelModule, {
					fontKey = "Header1",
					themeKey = "TextEmphasis",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, _Font.Header1.RelativeSize * _Font.BaseSize + 4),
					Text = p1.props.titleText
				}),
				BodyText = Roact.createElement(ThemedTextLabelModule, {
					fontKey = "Body",
					themeKey = "TextDefault",
					LayoutOrder = 3,
					TextWrapped = true,
					Size = if GetFFlagEnableVRFTUXExperienceModule() and IsFTUXExperienceModule(PlatformEnumModule.QuestVR) then UDim2.fromOffset(353, 4 * (_Font.Body.RelativeSize * _Font.BaseSize + 4)) else UDim2.fromOffset(353, 2 * (_Font.Body.RelativeSize * _Font.BaseSize + 4)),
					Text = p1.props.bodyText
				}),
				ButtonGroup = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.fromOffset(353, 84)
				}, {
					ConfirmButton = Roact.createElement(Button, {
						layoutOrder = 4,
						buttonType = ButtonType.PrimarySystem,
						position = UDim2.fromOffset(0, 0),
						size = UDim2.fromOffset(353, 36),
						onActivated = p1.props.onConfirm,
						text = p1.props.confirmText,
						buttonRef = p1.leaveButtonRef
					}),
					CancelButton = Roact.createElement(Button, {
						layoutOrder = 5,
						buttonType = ButtonType.Secondary,
						position = UDim2.fromOffset(0, 48),
						size = UDim2.fromOffset(353, 36),
						onActivated = p1.props.onCancel,
						text = p1.props.cancelText
					})
				})
			}),
			FocusHandler = Roact.createElement(FocusHandlerModule, {
				isFocused = p1.props.canGamepadCaptureFocus,
				didFocus = function()
					-- upvalues: GuiService (upval), p1 (upval)
					GuiService.SelectedCoreObject = p1.leaveButtonRef.current
				end
			}),
			ZonePortal = Roact.createElement(ZonePortalModule, { targetZone = 0, direction = DirectionModule.Left }),
			KeyboardFocusHandler = Roact.createElement(FocusHandlerModule, {
				isFocused = p1.props.canKeyboardCaptureFocus,
				didFocus = function()
					-- upvalues: ContextActionService (upval), p1 (upval)
					ContextActionService:BindCoreAction("LeavePromptConfirm", function(_, UserInputState)
						-- upvalues: p1 (upval)
						if UserInputState == Enum.UserInputState.End then
							p1.props.onConfirm()
							
							return Enum.ContextActionResult.Sink
						else
							return Enum.ContextActionResult.Pass
						end
					end, false, Enum.KeyCode.Return)
				end,
				didBlur = function()
					-- upvalues: ContextActionService (upval)
					ContextActionService:UnbindCoreAction("LeavePromptConfirm")
				end
			}) or nil
		})
	end)
end

return LeavePrompt