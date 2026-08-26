local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local alertViewButton = roact.PureComponent:extend("AlertViewButton")
alertViewButton.defaultProps = {
	LayoutOrder = 0,
	secondary = false,
	Text = "",
	onActivated = function() end,
	Size = UDim2.new(1, 0, 1, 0)
}

function alertViewButton.render(p1)
	-- upvalues: buttonType (ref), roact (ref), button (ref)
	return roact.createElement(button, {
		buttonType = if p1.props.secondary then buttonType.Secondary else buttonType.PrimarySystem,
		size = p1.props.Size,
		layoutOrder = p1.props.LayoutOrder,
		text = p1.props.Text,
		onActivated = p1.props.onActivated
	})
end

return alertViewButton