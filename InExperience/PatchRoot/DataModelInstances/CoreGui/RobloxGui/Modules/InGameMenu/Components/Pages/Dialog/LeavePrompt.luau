local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local gameIconModule = require(parent.GameIcon)
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local themedTextLabelModule = require(parent.ThemedTextLabel)
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local focusHandlerModule = require(parent.Connection.FocusHandler)
local zonePortalModule = require(parent.ZonePortal)
local directionModule = require(parent_1.Enums.Direction)
local getFFlagEnableVRFTUXExperienceModule = require(robloxGui.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local isFTUXExperienceModule = require(robloxGui.Modules.FTUX.Utility.IsFTUXExperience)
local platformEnumModule = require(robloxGui.Modules.FTUX.Enums.PlatformEnum)
local leavePrompt = roact.PureComponent:extend("LeavePrompt")
leavePrompt.validateProps = t.strictInterface({
	titleText = t.string,
	bodyText = t.string,
	confirmText = t.string,
	cancelText = t.string,
	onConfirm = t.callback,
	onCancel = t.callback,
	canGamepadCaptureFocus = t.boolean,
	canKeyboardCaptureFocus = t.boolean
})
leavePrompt.defaultProps = {
	canGamepadCaptureFocus = false,
	canKeyboardCaptureFocus = false
}

function leavePrompt.init(p1)
	-- upvalues: roact (ref)
	p1.leaveButtonRef = roact.createRef()
end

function leavePrompt.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), gameIconModule (ref), themedTextLabelModule (ref), getFFlagEnableVRFTUXExperienceModule (ref), isFTUXExperienceModule (ref), platformEnumModule (ref), button (ref), buttonType (ref), focusHandlerModule (ref), guiService (ref), zonePortalModule (ref), directionModule (ref), contextActionService (ref)
	return withFoundationOrUIBloxStyle(function(p2)
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
		-- upvalues: roact (copy), gameIconModule (copy), themedTextLabelModule (copy), p1 (ref), getFFlagEnableVRFTUXExperienceModule (copy), isFTUXExperienceModule (copy), platformEnumModule (copy), button (copy), buttonType (copy), focusHandlerModule (copy), guiService (copy), zonePortalModule (copy), directionModule (copy), contextActionService (copy)
		local font = p2.Font
		
		return roact.createElement("ImageButton", {
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency
		}, {
			Content = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Selectable = false,
				Size = UDim2.fromScale(1, 1)
			}, {
				Layout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 24),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				GameThumbnail = roact.createElement(gameIconModule, { iconSize = 100, layoutOrder = 1, gameId = game.GameId }),
				TitleText = roact.createElement(themedTextLabelModule, {
					fontKey = "Header1",
					themeKey = "TextEmphasis",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, font.Header1.RelativeSize * font.BaseSize + 4),
					Text = p1.props.titleText
				}),
				BodyText = roact.createElement(themedTextLabelModule, {
					fontKey = "Body",
					themeKey = "TextDefault",
					LayoutOrder = 3,
					TextWrapped = true,
					Size = if getFFlagEnableVRFTUXExperienceModule() and isFTUXExperienceModule(platformEnumModule.QuestVR) then UDim2.fromOffset(353, 4 * (font.Body.RelativeSize * font.BaseSize + 4)) else UDim2.fromOffset(353, 2 * (font.Body.RelativeSize * font.BaseSize + 4)),
					Text = p1.props.bodyText
				}),
				ButtonGroup = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.fromOffset(353, 84)
				}, {
					ConfirmButton = roact.createElement(button, {
						layoutOrder = 4,
						buttonType = buttonType.PrimarySystem,
						position = UDim2.fromOffset(0, 0),
						size = UDim2.fromOffset(353, 36),
						onActivated = p1.props.onConfirm,
						text = p1.props.confirmText,
						buttonRef = p1.leaveButtonRef
					}),
					CancelButton = roact.createElement(button, {
						layoutOrder = 5,
						buttonType = buttonType.Secondary,
						position = UDim2.fromOffset(0, 48),
						size = UDim2.fromOffset(353, 36),
						onActivated = p1.props.onCancel,
						text = p1.props.cancelText
					})
				})
			}),
			FocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p1.props.canGamepadCaptureFocus,
				didFocus = function()
					-- upvalues: guiService (copy), p1 (copy)
					guiService.SelectedCoreObject = p1.leaveButtonRef.current
				end
			}),
			ZonePortal = roact.createElement(zonePortalModule, { targetZone = 0, direction = directionModule.Left }),
			KeyboardFocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p1.props.canKeyboardCaptureFocus,
				didFocus = function()
					-- upvalues: contextActionService (copy), p1 (copy)
					contextActionService:BindCoreAction("LeavePromptConfirm", function(_, p3)
						-- upvalues: p1 (copy)
						if p3 == Enum.UserInputState.End then
							p1.props.onConfirm()
							
							return Enum.ContextActionResult.Sink
						end
						return Enum.ContextActionResult.Pass
					end, false, Enum.KeyCode.Return)
				end,
				didBlur = function()
					-- upvalues: contextActionService (copy)
					contextActionService:UnbindCoreAction("LeavePromptConfirm")
				end
			}) or nil
		})
	end)
end

return leavePrompt