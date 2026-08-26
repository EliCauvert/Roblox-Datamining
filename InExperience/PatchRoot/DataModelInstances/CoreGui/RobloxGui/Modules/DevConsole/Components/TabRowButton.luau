local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local highlightHeight = constantsModule.TabRowFormatting.HighlightHeight
local frameHeight = constantsModule.TabRowFormatting.FrameHeight

return function(p1)
	-- upvalues: constantsModule (ref), roactModule (ref), frameHeight (ref), highlightHeight (ref)
	local index = p1.index
	local name = p1.name
	local textWidth = p1.textWidth
	local padding = p1.padding
	local isSelected = p1.isSelected
	local onTabButtonClicked = p1.onTabButtonClicked
	
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
		LayoutOrder = p1.layoutOrder,
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