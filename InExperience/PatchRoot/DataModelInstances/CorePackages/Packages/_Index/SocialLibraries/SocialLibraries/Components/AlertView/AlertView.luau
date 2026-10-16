local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local FitFrameVerticalModule = require(script.Parent.Parent.FitFrameVertical)
local AlertView = Roact.Component:extend("AlertView")
AlertView.defaultProps = {
	Visible = false,
	contentPaddingLeft = 12,
	contentPaddingRight = 12,
	contentPaddingTop = 12,
	contentPaddingBottom = 12,
	width = UDim.new(0.5, 0)
}

function AlertView.render(p1) --[[ Line: 18 ]]
	-- upvalues: UIBlox (copy), Roact (copy), FitFrameVerticalModule (copy)
	return UIBlox.Style.withStyle(function(p2) --[[ Line: 19 ]]
		-- upvalues: Roact (upval), FitFrameVerticalModule (upval), p1 (copy)
		return Roact.createElement(FitFrameVerticalModule, {
			Visible = p1.props.Visible,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			width = p1.props.width
		}, {
			InnerFrame = Roact.createElement(FitFrameVerticalModule, {
				BackgroundTransparency = 1,
				margin = {
					top = p1.props.contentPaddingTop,
					bottom = p1.props.contentPaddingBottom,
					left = p1.props.contentPaddingLeft,
					right = p1.props.contentPaddingRight
				},
				width = UDim.new(1, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}, p1.props[Roact.Children])
		})
	end)
end

return AlertView