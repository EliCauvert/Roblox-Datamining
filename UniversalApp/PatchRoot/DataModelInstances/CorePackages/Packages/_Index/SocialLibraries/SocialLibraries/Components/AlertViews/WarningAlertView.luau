local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local roact = dependenciesModule.Roact
local buttonType = dependenciesModule.UIBlox.App.Button.Enum.ButtonType
local alertViewBuilderModule = require(socialLibraries.Components.AlertViewBuilder.AlertViewBuilder)
local warningAlertView = roact.Component:extend("WarningAlertView")
warningAlertView.defaultProps = {
	titleText = "TestTitle",
	bodyText = "TestBody",
	cancelText = "TestCancel",
	confirmText = "TestConfirm",
	failureTitleText = "failure title!",
	failureBodyText = "Thing failure!",
	failureButtonText = "failure Placeholder!",
	displayFailed = false,
	soakAreaTransparency = 0.9,
	screenSize = Vector2.new(0, 0),
	width = UDim.new(0.5, 0),
	onActivated = function() --[[ line: 24 ]] end,
	onModalClose = function() --[[ line: 25 ]] end,
	soakAreaColor3 = Color3.fromRGB(0, 0, 255)
}

local function No_Op() --[[ line: 31 ]] end

function warningAlertView.render(p0) --[[ line: 33 ]]
	-- upvalues: buttonType (ref), No_Op (ref), roact (ref), alertViewBuilderModule (ref)
	local failureTitleText, failureBodyText, list
	local props = p0.props
	local _ = nil
	local _ = nil
	local _ = nil
	
	if props.displayFailed then
		failureTitleText = p0.props.failureTitleText
		failureBodyText = p0.props.failureBodyText
		list = {
			{
				buttonType = buttonType.Alert,
				props = { text = props.failureButtonText, onActivated = No_Op }
			}
		}
	else
		failureTitleText = p0.props.titleText
		failureBodyText = p0.props.bodyText
		list = {
			{
				buttonType = buttonType.Secondary,
				props = { text = props.cancelText, onActivated = No_Op }
			},
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					text = props.confirmText,
					onActivated = props.onActivated
				}
			}
		}
	end
	return roact.createElement(alertViewBuilderModule, {
		title = failureTitleText,
		bodyText = failureBodyText,
		screenSize = p0.props.screenSize,
		width = p0.props.width,
		onModalClose = p0.props.onModalClose,
		buttons = list,
		soakAreaColor3 = props.soakAreaColor3,
		soakAreaTransparency = props.soakAreaTransparency
	})
end

return warningAlertView