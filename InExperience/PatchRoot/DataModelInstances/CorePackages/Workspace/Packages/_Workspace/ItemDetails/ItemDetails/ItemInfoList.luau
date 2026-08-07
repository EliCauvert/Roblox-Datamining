local parent = script:FindFirstAncestor("ItemDetails").Parent
local reactModule = require(parent.React)
local itemInfoRowModule = require(script.Parent.ItemInfoRow)
local cryoModule = require(parent.Cryo)

return function(a) --[[ line: 42 | named "ItemInfoList" ]]
	-- upvalues: reactModule (ref), cryoModule (ref), itemInfoRowModule (ref)
	local t = {
		layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	
	for i, v in a.rowData do
		table.insert(t, reactModule.createElement(itemInfoRowModule, cryoModule.Dictionary.join(v, { LayoutOrder = i, hideDivider = next(a.rowData, i) == nil })))
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = a.LayoutOrder
	}, t)
end