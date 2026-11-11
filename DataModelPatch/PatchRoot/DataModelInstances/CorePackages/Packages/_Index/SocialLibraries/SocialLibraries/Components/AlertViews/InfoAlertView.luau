local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Roact = DependenciesModule.Roact
local ButtonType = DependenciesModule.UIBlox.App.Button.Enum.ButtonType
local AlertViewBuilderModule = require(SocialLibraries.Components.AlertViewBuilder.AlertViewBuilder)
local InfoAlertView = Roact.Component:extend("InfoAlertView")
InfoAlertView.defaultProps = {
	titleText = "TestTitle",
	bodyText = "TestBody",
	confirmText = "TestConfirm",
	soakAreaTransparency = 0.9,
	width = UDim.new(0.5, 0),
	screenSize = Vector2.new(0, 0),
	onModalClose = function() end,
	soakAreaColor3 = Color3.fromRGB(0, 0, 255)
}

function InfoAlertView.render(p1)
	-- upvalues: Roact (copy), AlertViewBuilderModule (copy), ButtonType (copy)
	local Props = p1.props
	
	return Roact.createElement(AlertViewBuilderModule, {
		title = Props.titleText,
		bodyText = Props.bodyText,
		width = Props.width,
		screenSize = Props.screenSize,
		onModalClose = Props.onModalClose,
		buttons = {
			{
				buttonType = ButtonType.PrimarySystem,
				props = {
					text = Props.confirmText,
					onActivated = Props.onModalClose
				}
			}
		},
		soakAreaColor3 = Props.soakAreaColor3,
		soakAreaTransparency = Props.soakAreaTransparency
	})
end

return InfoAlertView