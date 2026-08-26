local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local roact = dependenciesModule.Roact
local buttonType = dependenciesModule.UIBlox.App.Button.Enum.ButtonType
local alertViewBuilderModule = require(socialLibraries.Components.AlertViewBuilder.AlertViewBuilder)
local infoAlertView = roact.Component:extend("InfoAlertView")
infoAlertView.defaultProps = {
	titleText = "TestTitle",
	bodyText = "TestBody",
	confirmText = "TestConfirm",
	soakAreaTransparency = 0.9,
	width = UDim.new(0.5, 0),
	screenSize = Vector2.new(0, 0),
	onModalClose = function() end,
	soakAreaColor3 = Color3.fromRGB(0, 0, 255)
}

function infoAlertView.render(p1)
	-- upvalues: roact (ref), alertViewBuilderModule (ref), buttonType (ref)
	local props = p1.props
	
	return roact.createElement(alertViewBuilderModule, {
		title = props.titleText,
		bodyText = props.bodyText,
		width = props.width,
		screenSize = props.screenSize,
		onModalClose = props.onModalClose,
		buttons = {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					text = props.confirmText,
					onActivated = props.onModalClose
				}
			}
		},
		soakAreaColor3 = props.soakAreaColor3,
		soakAreaTransparency = props.soakAreaTransparency
	})
end

return infoAlertView