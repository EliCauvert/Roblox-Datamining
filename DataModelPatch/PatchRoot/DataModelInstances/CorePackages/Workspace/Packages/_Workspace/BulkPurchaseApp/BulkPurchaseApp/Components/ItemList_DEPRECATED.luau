local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local ItemModule = require(script.Parent.Item)

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ItemModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150)
		})
	}
	
	for LayoutOrder, item in Frame.items do
		config[item.id] = ReactModule.createElement(ItemModule, {
			name = item.name,
			image = item.image,
			endSlot = item.endSlot,
			LayoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, config)
end