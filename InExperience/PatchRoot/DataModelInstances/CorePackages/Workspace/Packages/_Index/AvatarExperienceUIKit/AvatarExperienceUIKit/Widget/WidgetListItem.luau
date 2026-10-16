local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local RoactGamepadModule = require(Parent.RoactGamepad)

return (ReactModule.forwardRef(function(Gui, Ref) --[[ Line: 28 ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), RoactGamepadModule (copy)
	local HorizontalMargin = Gui.horizontalMargin or 0
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = Ref,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionLeft = Gui.NextSelectionLeft,
		onFocusGained = Gui.onFocusGained
	}, {
		GradientBackground = if Gui.hasBackground then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = -1,
			Size = UDim2.new(1, HorizontalMargin * 2, 1, 0),
			Position = UDim2.new(0, -HorizontalMargin, 0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, UseDesignTokensResult.Color.Surface.Surface_200.Color3),
					ColorSequenceKeypoint.new(1, UseDesignTokensResult.Color.Surface.Surface_0.Color3)
				})
			})
		}) else nil,
		WidgetListItemPadding = if Gui.padding then ReactModule.createElement("UIPadding", {
			PaddingBottom = Gui.padding.bottom,
			PaddingTop = Gui.padding.top,
			PaddingRight = Gui.padding.right,
			PaddingLeft = Gui.padding.left
		}) else nil,
		Widget = ReactModule.createElement(ReactModule.Fragment, nil, Gui.children)
	})
end))