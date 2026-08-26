local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local roactGamepadModule = require(parent.RoactGamepad)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useDesignTokens (ref), reactModule (ref), roactGamepadModule (ref)
	local horizontalMargin = p1.horizontalMargin or 0
	local var1 = useDesignTokens()
	
	return reactModule.createElement(roactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = p2,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown,
		NextSelectionRight = p1.NextSelectionRight,
		NextSelectionLeft = p1.NextSelectionLeft,
		onFocusGained = p1.onFocusGained
	}, {
		GradientBackground = if p1.hasBackground then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = -1,
			Size = UDim2.new(1, horizontalMargin * 2, 1, 0),
			Position = UDim2.new(0, -horizontalMargin, 0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, var1.Color.Surface.Surface_200.Color3),
					ColorSequenceKeypoint.new(1, var1.Color.Surface.Surface_0.Color3)
				})
			})
		}) else nil,
		WidgetListItemPadding = if p1.padding then reactModule.createElement("UIPadding", {
			PaddingBottom = p1.padding.bottom,
			PaddingTop = p1.padding.top,
			PaddingRight = p1.padding.right,
			PaddingLeft = p1.padding.left
		}) else nil,
		Widget = reactModule.createElement(reactModule.Fragment, nil, p1.children)
	})
end)