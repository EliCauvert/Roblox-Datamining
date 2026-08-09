local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p0) --[[ line: 21 | named "WidgetLayout" ]]
	-- upvalues: useDesignTokens (ref), reactModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var1 = useDesignTokens()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}, {
		UIPadding = if p0.padding then reactModule.createElement("UIPadding", {
			PaddingLeft = p0.padding.left,
			PaddingRight = p0.padding.right,
			PaddingTop = p0.padding.top,
			PaddingBottom = p0.padding.bottom
		}) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var1.Size.Size_300 else var1.Global.Space_150)
		}),
		TopContent = if p0.headerSlot then reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p0.headerSlot) else nil,
		ItemGroup = if p0.contentSlot then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p0.contentSlot) else nil
	})
end