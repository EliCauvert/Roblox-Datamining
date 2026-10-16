local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local AlertViewButton = Roact.PureComponent:extend("AlertViewButton")
AlertViewButton.defaultProps = {
	LayoutOrder = 0,
	secondary = false,
	Text = "",
	onActivated = function() --[[ Line: 13 ]] end,
	Size = UDim2.new(1, 0, 1, 0)
}

function AlertViewButton.render(p1) --[[ Line: 18 ]]
	-- upvalues: ButtonType (copy), Roact (copy), Button (copy)
	return Roact.createElement(Button, {
		buttonType = if p1.props.secondary then ButtonType.Secondary else ButtonType.PrimarySystem,
		size = p1.props.Size,
		layoutOrder = p1.props.LayoutOrder,
		text = p1.props.Text,
		onActivated = p1.props.onActivated
	})
end

return AlertViewButton