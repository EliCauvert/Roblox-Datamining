local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local FFlagAddNewPlayerListMobileFocusNav = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav
local ActionModal = RoactModule.PureComponent:extend("ActionModal")
ActionModal.defaultProps = { screenSize = Vector2.new(1000, 1000) }
ActionModal.validateProps = TModule.interface({
	block = TModule.callback,
	blockText = TModule.string,
	blockAndReport = TModule.callback,
	blockAndReportText = TModule.string,
	cancel = TModule.callback,
	cancelText = TModule.string,
	body = TModule.string,
	title = TModule.string,
	screenSize = TModule.optional(TModule.Vector2)
})

function ActionModal.render(p1) --[[ Line: 35 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), RoactModule (copy), InteractiveAlert (copy), FFlagAddNewPlayerListMobileFocusNav (copy), ButtonType (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 36 ]]
		return {
			Theme = {
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				}
			}
		}
	end, function(p2) --[[ Line: 45 ]]
		-- upvalues: RoactModule (upval), p1 (copy), InteractiveAlert (upval), FFlagAddNewPlayerListMobileFocusNav (upval), ButtonType (upval)
		return RoactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p2.Theme.Overlay.Transparency,
			BackgroundColor3 = p2.Theme.Overlay.Color,
			Active = true,
			AutoButtonColor = false,
			Selectable = false,
			Visible = p1.props.Visible,
			[RoactModule.Event.Activated] = p1.props.cancel
		}, {
			AlertModal = RoactModule.createElement(InteractiveAlert, {
				richText = true,
				screenSize = p1.props.screenSize,
				title = p1.props.title,
				bodyText = p1.props.body,
				isRoactGamepadEnabled = not FFlagAddNewPlayerListMobileFocusNav and nil,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.Secondary,
							props = {
								text = p1.props.cancelText,
								onActivated = p1.props.cancel
							}
						},
						{
							buttonType = ButtonType.Alert,
							props = {
								text = p1.props.blockAndReportText,
								onActivated = p1.props.blockAndReport
							}
						},
						{
							buttonType = ButtonType.Alert,
							props = { text = p1.props.blockText, onActivated = p1.props.block }
						}
					}
				}
			})
		})
	end)
end

return ActionModal