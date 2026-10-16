local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Roact = DependenciesModule.Roact
local ButtonType = DependenciesModule.UIBlox.App.Button.Enum.ButtonType
local AlertViewBuilderModule = require(SocialLibraries.Components.AlertViewBuilder.AlertViewBuilder)
local WarningAlertView = Roact.Component:extend("WarningAlertView")
WarningAlertView.defaultProps = {
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
	onActivated = function() --[[ Line: 24 ]] end,
	onModalClose = function() --[[ Line: 25 ]] end,
	soakAreaColor3 = Color3.fromRGB(0, 0, 255)
}

local function No_Op() --[[ Line: 31 ]] end

function WarningAlertView.render(p1) --[[ Line: 33 ]]
	-- upvalues: ButtonType (copy), No_Op (copy), Roact (copy), AlertViewBuilderModule (copy)
	local Props = p1.props
	local FailureBodyText = nil
	local Buttons = nil
	local FailureTitleText = nil
	
	if Props.displayFailed then
		FailureTitleText = p1.props.failureTitleText
		FailureBodyText = p1.props.failureBodyText
		Buttons = {
			{
				buttonType = ButtonType.Alert,
				props = { text = Props.failureButtonText, onActivated = No_Op }
			}
		}
	else
		FailureTitleText = p1.props.titleText
		FailureBodyText = p1.props.bodyText
		Buttons = {
			{
				buttonType = ButtonType.Secondary,
				props = { text = Props.cancelText, onActivated = No_Op }
			},
			{
				buttonType = ButtonType.PrimarySystem,
				props = {
					text = Props.confirmText,
					onActivated = Props.onActivated
				}
			}
		}
	end
	return Roact.createElement(AlertViewBuilderModule, {
		title = FailureTitleText,
		bodyText = FailureBodyText,
		screenSize = p1.props.screenSize,
		width = p1.props.width,
		onModalClose = p1.props.onModalClose,
		buttons = Buttons,
		soakAreaColor3 = Props.soakAreaColor3,
		soakAreaTransparency = Props.soakAreaTransparency
	})
end

return WarningAlertView