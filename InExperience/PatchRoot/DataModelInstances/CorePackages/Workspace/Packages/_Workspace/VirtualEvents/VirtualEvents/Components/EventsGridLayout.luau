local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local t = { numItemsShown = 1e999, itemPadding = UDim.new(0, 12) }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactModule (copy)
		local t = {}
		
		for i = 1, var1.numItemsShown do
			t[i] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = i,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Content = var1.items[i] })
		end
		return t
	end, { var1.items, var1.numItemsShown })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			Padding = var1.itemPadding,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		Rows = reactModule.createElement(reactModule.Fragment, nil, reactModule.useMemo(function()
			-- upvalues: var2 (ref), reactModule (copy), var1 (ref)
			local t = {}
			
			for i = 1, #var2, 2 do
				local var3 = var2[i + 1]
				t["Row" .. math.ceil(i / 2)] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = i
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						Padding = var1.itemPadding,
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					CellFrame1 = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(0.5, -var1.itemPadding.Offset / 2, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Item = reactModule.createElement(reactModule.Fragment, nil, var2[i])
					}),
					CellFrame2 = var3 and reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(0.5, -var1.itemPadding.Offset / 2, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Item = reactModule.createElement(reactModule.Fragment, nil, var3)
					})
				})
			end
			return t
		end, { var1.items, var2 }))
	})
end