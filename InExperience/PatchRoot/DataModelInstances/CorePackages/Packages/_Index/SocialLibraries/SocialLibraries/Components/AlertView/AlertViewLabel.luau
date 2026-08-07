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

function alertViewLabel.render(p0) --[[ line: 14 ]]
	-- upvalues: UIBlox (ref), roact (ref)
	return UIBlox.Style.withStyle(function(p1) --[[ line: 15 ]]
		-- upvalues: p0 (ref), roact (copy)
		return roact.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = p0.props.BackgroundTransparency,
			Font = p0.props.Font or p1.Font.Body.Font,
			LayoutOrder = p0.props.LayoutOrder,
			Size = p0.props.Size,
			Text = p0.props.Text,
			TextColor3 = p0.props.TextColor3 or p1.Theme.TextDefault.Color,
			TextSize = p0.props.TextSize or p1.Font.Body.RelativeSize * p1.Font.BaseSize,
			TextXAlignment = p0.props.TextXAlignment
		})
	end)
end

return alertViewLabel