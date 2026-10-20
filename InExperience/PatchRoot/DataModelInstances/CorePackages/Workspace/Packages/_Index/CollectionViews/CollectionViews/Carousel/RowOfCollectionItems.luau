local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ArgCheckModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), ArgCheckModule (upval)
		if p1.numToRender == 0 or p1.numItemsForSizing == 0 then
			return nil
		end
		local StartingIndexDelta = p1.startingIndex - 1
		local NumItemsForSizing: number = p1.numItemsForSizing
		local NumItemsForSizingDelta = NumItemsForSizing - 1
		local Floored = math.floor(NumItemsForSizingDelta / NumItemsForSizing * p1.columnGap)
		local _UDim2 = UDim2.new(1 / NumItemsForSizing, -Floored, 1, 0)
		local NewColumnGap = p1.columnGap + (Floored * NumItemsForSizing - p1.columnGap * NumItemsForSizingDelta) / NumItemsForSizingDelta
		local config = {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, NewColumnGap),
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			})
		}
		
		if StartingIndexDelta > 0 then
			config.Padding = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(StartingIndexDelta * _UDim2.X.Scale, (StartingIndexDelta - 1) * NewColumnGap + StartingIndexDelta * _UDim2.X.Offset, 0, 0)
			})
		end
		ArgCheckModule.assert(p1.startingIndex >= 1 and p1.startingIndex <= #p1.items)
		ArgCheckModule.assert(p1.startingIndex <= p1.endingIndex and p1.endingIndex <= #p1.items)
		
		for i = p1.startingIndex, p1.endingIndex do
			if i >= 1 and i <= #p1.items then
				local RenderItemResult2
				config[RenderItemResult2 .. tostring(i % p1.numToRender + 1)], RenderItemResult2 = p1.renderItem(p1.items[i], i, _UDim2)
			end
		end
		return config
	end, {
		p1.columnGap, p1.startingIndex, p1.endingIndex, p1.items, p1.numToRender,
		p1.renderItem, p1.sideMargin, p1.totalItemsOnCanvas, p1.numItemsForSizing
	})))
end)