local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local itemModule = require(script.Parent.Item)

return function(p0)
	-- upvalues: useDesignTokens (ref), reactModule (ref), itemModule (ref)
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, useDesignTokens().Size.Size_300)
		})
	}
	
	for i, v in p0.items do
		t[v.id] = reactModule.createElement(itemModule, {
			name = v.name,
			image = v.image,
			endSlot = v.endSlot,
			LayoutOrder = i
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, t)
end