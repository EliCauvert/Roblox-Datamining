local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local HighlightHeight = ConstantsModule.TabRowFormatting.HighlightHeight
local FrameHeight = ConstantsModule.TabRowFormatting.FrameHeight

return function(p1) --[[ Line: 10 | Named "TabRowButton" ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy), FrameHeight (copy), HighlightHeight (copy)
	local Index = p1.index
	local IsSelected = p1.isSelected
	local OnTabButtonClickedFunction = p1.onTabButtonClicked
	
	return RoactModule.createElement("TextButton", {
		Text = p1.name,
		TextSize = ConstantsModule.DefaultFontSize.TabBar,
		Font = ConstantsModule.Font.TabBar,
		TextScaled = false,
		TextTransparency = if IsSelected then ConstantsModule.TabRowFormatting.SelectedTextTransparency else ConstantsModule.TabRowFormatting.UnselectedTextTransparency,
		Size = UDim2.new(0, p1.textWidth + p1.padding, 0, FrameHeight),
		AutoButtonColor = false,
		TextColor3 = ConstantsModule.Color.Text,
		BackgroundColor3 = ConstantsModule.Color.UnselectedGray,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		[RoactModule.Event.Activated] = function(_) --[[ Line: 38 ]]
			-- upvalues: OnTabButtonClickedFunction (copy), Index (copy)
			OnTabButtonClickedFunction(Index)
		end
	}, {
		BlueHighlight = IsSelected and RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, -HighlightHeight),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = ConstantsModule.Color.HighlightBlue
		})
	})
end