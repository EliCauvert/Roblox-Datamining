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
	onActivated = function() --[[ line: 13 ]] end,
	Size = UDim2.new(1, 0, 1, 0)
}

function alertViewButton.render(p0) --[[ line: 18 ]]
	-- upvalues: buttonType (ref), roact (ref), button (ref)
	return roact.createElement(button, {
		buttonType = if p0.props.secondary then buttonType.Secondary else buttonType.PrimarySystem,
		size = p0.props.Size,
		layoutOrder = p0.props.LayoutOrder,
		text = p0.props.Text,
		onActivated = p0.props.onActivated
	})
end

return alertViewButton