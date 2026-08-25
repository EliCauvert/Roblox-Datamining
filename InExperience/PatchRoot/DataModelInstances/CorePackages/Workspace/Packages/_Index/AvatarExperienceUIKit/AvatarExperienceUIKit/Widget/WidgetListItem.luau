local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local roactGamepadModule = require(parent.RoactGamepad)

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), roactGamepadModule (ref)
	local horizontalMargin = p0.horizontalMargin or 0
	local var3 = useDesignTokens()
	
	return reactModule.createElement(roactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = p1,
		NextSelectionUp = p0.NextSelectionUp,
		NextSelectionDown = p0.NextSelectionDown,
		NextSelectionRight = p0.NextSelectionRight,
		NextSelectionLeft = p0.NextSelectionLeft,
		onFocusGained = p0.onFocusGained
	}, {
		GradientBackground = if p0.hasBackground then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = -1,
			Size = UDim2.new(1, horizontalMargin * 2, 1, 0),
			Position = UDim2.new(0, -horizontalMargin, 0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, var3.Color.Surface.Surface_200.Color3),
					ColorSequenceKeypoint.new(1, var3.Color.Surface.Surface_0.Color3)
				})
			})
		}) else nil,
		WidgetListItemPadding = if p0.padding then reactModule.createElement("UIPadding", {
			PaddingBottom = p0.padding.bottom,
			PaddingTop = p0.padding.top,
			PaddingRight = p0.padding.right,
			PaddingLeft = p0.padding.left
		}) else nil,
		Widget = reactModule.createElement(reactModule.Fragment, nil, p0.children)
	})
end)