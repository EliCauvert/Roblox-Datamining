local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local fitFrameVerticalModule = require(script.Parent.Parent.FitFrameVertical)
local alertView = roact.Component:extend("AlertView")
alertView.defaultProps = {
	Visible = false,
	contentPaddingLeft = 12,
	contentPaddingRight = 12,
	contentPaddingTop = 12,
	contentPaddingBottom = 12,
	width = UDim.new(0.5, 0)
}

function alertView.render(p0) --[[ line: 18 ]]
	-- upvalues: UIBlox (ref), roact (ref), fitFrameVerticalModule (ref)
	return UIBlox.Style.withStyle(function(p1) --[[ line: 19 ]]
		-- upvalues: roact (copy), fitFrameVerticalModule (copy), p0 (ref)
		return roact.createElement(fitFrameVerticalModule, {
			Visible = p0.props.Visible,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = p1.Theme.BackgroundUIDefault.Color,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			width = p0.props.width
		}, {
			InnerFrame = roact.createElement(fitFrameVerticalModule, {
				BackgroundTransparency = 1,
				margin = {
					top = p0.props.contentPaddingTop,
					bottom = p0.props.contentPaddingBottom,
					left = p0.props.contentPaddingLeft,
					right = p0.props.contentPaddingRight
				},
				width = UDim.new(1, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}, p0.props[roact.Children])
		})
	end)
end

return alertView