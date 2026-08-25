local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local highlightHeight = constantsModule.TabRowFormatting.HighlightHeight
local frameHeight = constantsModule.TabRowFormatting.FrameHeight

return function(p0)
	-- upvalues: constantsModule (ref), roactModule (ref), frameHeight (ref), highlightHeight (ref)
	local index = p0.index
	local name = p0.name
	local textWidth = p0.textWidth
	local padding = p0.padding
	local isSelected = p0.isSelected
	local onTabButtonClicked = p0.onTabButtonClicked
	
	return roactModule.createElement("TextButton", {
		Text = name,
		TextSize = constantsModule.DefaultFontSize.TabBar,
		Font = constantsModule.Font.TabBar,
		TextScaled = false,
		TextTransparency = if isSelected then constantsModule.TabRowFormatting.SelectedTextTransparency else constantsModule.TabRowFormatting.UnselectedTextTransparency,
		Size = UDim2.new(0, textWidth + padding, 0, frameHeight),
		AutoButtonColor = false,
		TextColor3 = constantsModule.Color.Text,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		[roactModule.Event.Activated] = function(_)
			-- upvalues: onTabButtonClicked (ref), index (ref)
			onTabButtonClicked(index)
		end
	}, {
		BlueHighlight = isSelected and roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, -highlightHeight),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = constantsModule.Color.HighlightBlue
		})
	})
end