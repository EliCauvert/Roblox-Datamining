local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useDesignTokens = require(parent.Style).useDesignTokens
local itemModule = require(script.Parent.Item)

return function(p0) --[[ line: 23 | named "ItemList_DEPRECATED" ]]
	-- upvalues: useDesignTokens (ref), reactModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref), itemModule (ref)
	local var2 = useDesignTokens()
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var2.Size.Size_300 else var2.Global.Space_150)
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