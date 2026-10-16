local Parent = script:FindFirstAncestor("ItemDetails").Parent
local ReactModule = require(Parent.React)
local ItemInfoRowModule = require(script.Parent.ItemInfoRow)
local CryoModule = require(Parent.Cryo)

return function(Frame) --[[ Line: 42 | Named "ItemInfoList" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy), ItemInfoRowModule (copy)
	local config = {
		layout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	
	for LayoutOrder, value in Frame.rowData do
		table.insert(config, ReactModule.createElement(ItemInfoRowModule, (CryoModule.Dictionary.join(value, {
			LayoutOrder = LayoutOrder,
			hideDivider = next(Frame.rowData, LayoutOrder) == nil
		}))))
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		LayoutOrder = Frame.LayoutOrder
	}, config)
end