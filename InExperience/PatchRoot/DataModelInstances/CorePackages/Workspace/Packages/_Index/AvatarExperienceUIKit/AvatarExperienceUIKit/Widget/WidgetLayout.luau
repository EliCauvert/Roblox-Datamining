local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(Frame) --[[ Line: 19 | Named "WidgetLayout" ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UIPadding = if Frame.padding then ReactModule.createElement("UIPadding", {
			PaddingLeft = Frame.padding.left,
			PaddingRight = Frame.padding.right,
			PaddingTop = Frame.padding.top,
			PaddingBottom = Frame.padding.bottom
		}) else nil,
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseDesignTokensFunction().Size.Size_300)
		}),
		TopContent = if Frame.headerSlot then ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, Frame.headerSlot) else nil,
		ItemGroup = if Frame.contentSlot then ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, Frame.contentSlot) else nil
	})
end