local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	}, {
		UIPadding = if p1.padding then reactModule.createElement("UIPadding", {
			PaddingLeft = p1.padding.left,
			PaddingRight = p1.padding.right,
			PaddingTop = p1.padding.top,
			PaddingBottom = p1.padding.bottom
		}) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, useDesignTokens().Size.Size_300)
		}),
		TopContent = if p1.headerSlot then reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p1.headerSlot) else nil,
		ItemGroup = if p1.contentSlot then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p1.contentSlot) else nil
	})
end