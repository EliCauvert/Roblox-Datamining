local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local fFlagAddNewPlayerListMobileFocusNav = require(corePackagesService.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav
local actionModal = roactModule.PureComponent:extend("ActionModal")
actionModal.defaultProps = { screenSize = Vector2.new(1000, 1000) }
actionModal.validateProps = tModule.interface({
	block = tModule.callback,
	blockText = tModule.string,
	blockAndReport = tModule.callback,
	blockAndReportText = tModule.string,
	cancel = tModule.callback,
	cancelText = tModule.string,
	body = tModule.string,
	title = tModule.string,
	screenSize = tModule.optional(tModule.Vector2)
})

function actionModal.render(p0)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roactModule (ref), interactiveAlert (ref), fFlagAddNewPlayerListMobileFocusNav (ref), buttonType (ref)
	return withFoundationOrUIBloxStyle(function(p1)
		return {
			Theme = {
				Overlay = {
					Color = p1.Color.Common.Scrim.Color3,
					Transparency = p1.Color.Common.Scrim.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roactModule (copy), p0 (ref), interactiveAlert (copy), fFlagAddNewPlayerListMobileFocusNav (copy), buttonType (copy)
		return roactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p2.Theme.Overlay.Transparency,
			BackgroundColor3 = p2.Theme.Overlay.Color,
			Active = true,
			AutoButtonColor = false,
			Selectable = false,
			Visible = p0.props.Visible,
			[roactModule.Event.Activated] = p0.props.cancel
		}, {
			AlertModal = roactModule.createElement(interactiveAlert, {
				richText = true,
				screenSize = p0.props.screenSize,
				title = p0.props.title,
				bodyText = p0.props.body,
				isRoactGamepadEnabled = if fFlagAddNewPlayerListMobileFocusNav then false else nil,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = buttonType.Secondary,
							props = {
								text = p0.props.cancelText,
								onActivated = p0.props.cancel
							}
						},
						{
							buttonType = buttonType.Alert,
							props = {
								text = p0.props.blockAndReportText,
								onActivated = p0.props.blockAndReport
							}
						},
						{
							buttonType = buttonType.Alert,
							props = { text = p0.props.blockText, onActivated = p0.props.block }
						}
					}
				}
			})
		})
	end)
end

return actionModal