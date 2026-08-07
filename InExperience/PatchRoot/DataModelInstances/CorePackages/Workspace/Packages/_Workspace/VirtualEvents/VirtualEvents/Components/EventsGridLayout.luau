local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local t = { numItemsShown = 1e999, itemPadding = UDim.new(0, 12) }

return function(p0) --[[ line: 19 | named "EventsGridLayout" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref)
	local var4 = cryoModule.Dictionary.join(t, p0)
	local var5 = reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: var4 (ref), reactModule (copy)
		local t = {}
		
		for i = 1, var4.numItemsShown do
			t[i] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = i,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Content = var4.items[i] })
		end
		return t
	end, { var4.items, var4.numItemsShown })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			Padding = var4.itemPadding,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		Rows = reactModule.createElement(reactModule.Fragment, nil, reactModule.useMemo(function() --[[ line: 39 ]]
			-- upvalues: var5 (ref), reactModule (copy), var4 (ref)
			local t = {}
			
			for i = 1, #var5, 2 do
				local var8 = var5[i + 1]
				t["Row" .. math.ceil(i / 2)] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = i
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						Padding = var4.itemPadding,
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					CellFrame1 = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(0.5, -var4.itemPadding.Offset / 2, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Item = reactModule.createElement(reactModule.Fragment, nil, var5[i])
					}),
					CellFrame2 = var8 and reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(0.5, -var4.itemPadding.Offset / 2, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Item = reactModule.createElement(reactModule.Fragment, nil, var8)
					})
				})
			end
			return t
		end, { var4.items, var5 }))
	})
end