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

function alertView.render(p1)
	-- upvalues: UIBlox (ref), roact (ref), fitFrameVerticalModule (ref)
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: roact (copy), fitFrameVerticalModule (copy), p1 (ref)
		return roact.createElement(fitFrameVerticalModule, {
			Visible = p1.props.Visible,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			width = p1.props.width
		}, {
			InnerFrame = roact.createElement(fitFrameVerticalModule, {
				BackgroundTransparency = 1,
				margin = {
					top = p1.props.contentPaddingTop,
					bottom = p1.props.contentPaddingBottom,
					left = p1.props.contentPaddingLeft,
					right = p1.props.contentPaddingRight
				},
				width = UDim.new(1, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}, p1.props[roact.Children])
		})
	end)
end

return alertView