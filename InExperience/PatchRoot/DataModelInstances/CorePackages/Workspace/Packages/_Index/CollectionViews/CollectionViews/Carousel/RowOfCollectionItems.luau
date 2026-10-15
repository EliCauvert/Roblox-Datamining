local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), argCheckModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), argCheckModule (copy)
		if p1.numToRender == 0 or p1.numItemsForSizing == 0 then
			return nil
		end
		local var1 = p1.startingIndex - 1
		local t = {}
		local numItemsForSizing = p1.numItemsForSizing
		local var2 = numItemsForSizing - 1
		local floored = math.floor(var2 / numItemsForSizing * p1.columnGap)
		local uDim2 = UDim2.new(1 / numItemsForSizing, -floored, 1, 0)
		local var3 = p1.columnGap + (floored * numItemsForSizing - p1.columnGap * var2) / var2
		t.Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, var3),
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		})
		
		if var1 > 0 then
			t.Padding = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(var1 * uDim2.X.Scale, (var1 - 1) * var3 + var1 * uDim2.X.Offset, 0, 0)
			})
		end
		argCheckModule.assert(p1.startingIndex >= 1 and p1.startingIndex <= #p1.items)
		argCheckModule.assert(p1.startingIndex <= p1.endingIndex and p1.endingIndex <= #p1.items)
		
		for i = p1.startingIndex, p1.endingIndex do
			if i >= 1 and i <= #p1.items then
				local var4, var5 = p1.renderItem(p1.items[i], i, uDim2)
				t[var5 .. tostring(i % p1.numToRender + 1)] = var4
			end
		end
		return t
	end, {
		p1.columnGap, p1.startingIndex, p1.endingIndex, p1.items, p1.numToRender,
		p1.renderItem, p1.sideMargin, p1.totalItemsOnCanvas, p1.numItemsForSizing
	}))
end)