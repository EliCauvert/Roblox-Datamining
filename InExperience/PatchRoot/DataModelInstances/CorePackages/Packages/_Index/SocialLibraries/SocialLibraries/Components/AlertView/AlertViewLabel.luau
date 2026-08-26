local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local alertViewLabel = roact.PureComponent:extend("AlertViewLabel")
alertViewLabel.defaultProps = {
	BackgroundTransparency = 1,
	Text = "",
	Size = UDim2.new(1, 0, 0, 40),
	TextXAlignment = Enum.TextXAlignment.Center
}

function alertViewLabel.render(p1)
	-- upvalues: UIBlox (ref), roact (ref)
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: p1 (ref), roact (copy)
		return roact.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = p1.props.BackgroundTransparency,
			Font = p1.props.Font or p2.Font.Body.Font,
			LayoutOrder = p1.props.LayoutOrder,
			Size = p1.props.Size,
			Text = p1.props.Text,
			TextColor3 = p1.props.TextColor3 or p2.Theme.TextDefault.Color,
			TextSize = p1.props.TextSize or p2.Font.Body.RelativeSize * p2.Font.BaseSize,
			TextXAlignment = p1.props.TextXAlignment
		})
	end)
end

return alertViewLabel