local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local CalculateSpacePerItemModule = require(CollectionViews.calculateSpacePerItem)
local _ = require(CollectionViews.Carousel.calculateCarouselSpacingMetrics)
local FFlagCollectionViewMathChanges = require(Parent.SharedFlags).FFlagCollectionViewMathChanges

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagCollectionViewMathChanges (copy), CalculateSpacePerItemModule (copy), ArgCheckModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FFlagCollectionViewMathChanges (upval), CalculateSpacePerItemModule (upval), ReactModule (upval), ArgCheckModule (upval)
		if p1.numToRender == 0 or (if FFlagCollectionViewMathChanges then p1.numColumns == 0 else p1.numItemsForSizing == 0) then
			return nil
		end
		local StartingIndexDelta = p1.startingIndex - 1
		local t = {}
		local _UDim2 = nil
		local AdjustedGap = nil
		
		if FFlagCollectionViewMathChanges then
			local NumColumns: number = p1.numColumns
			local SpacePerItemModule = CalculateSpacePerItemModule(NumColumns, p1.columnGap)
			_UDim2 = UDim2.new(1 / NumColumns, -SpacePerItemModule.gapOffsetPerItem, 1, 0)
			AdjustedGap = SpacePerItemModule.adjustedGap
		else
			local NumItemsForSizing: number = p1.numItemsForSizing
			local NumItemsForSizingDelta = NumItemsForSizing - 1
			local Floored = math.floor(NumItemsForSizingDelta / NumItemsForSizing * p1.columnGap)
			_UDim2 = UDim2.new(1 / NumItemsForSizing, -Floored, 1, 0)
			AdjustedGap = p1.columnGap + (Floored * NumItemsForSizing - p1.columnGap * NumItemsForSizingDelta) / NumItemsForSizingDelta
		end
		t.Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, AdjustedGap),
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		})
		
		if StartingIndexDelta > 0 then
			t.Padding = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = if FFlagCollectionViewMathChanges then p1.spacingMetricsBinding:map(function(p2): UDim2
					-- upvalues: StartingIndexDelta (copy)
					return UDim2.fromOffset(math.max(0, StartingIndexDelta * p2.stride - p2.renderedGap), 0)
				end) else UDim2.new(StartingIndexDelta * _UDim2.X.Scale, (StartingIndexDelta - 1) * AdjustedGap + StartingIndexDelta * _UDim2.X.Offset, 0, 0)
			})
		end
		ArgCheckModule.assert(p1.startingIndex >= 1 and p1.startingIndex <= #p1.items)
		ArgCheckModule.assert(p1.startingIndex <= p1.endingIndex and p1.endingIndex <= #p1.items)
		
		for i = p1.startingIndex, p1.endingIndex do
			if i >= 1 and i <= #p1.items then
				local RenderItemResult2
				t[RenderItemResult2 .. tostring(i % p1.numToRender + 1)], RenderItemResult2 = p1.renderItem(p1.items[i], i, _UDim2)
			end
		end
		return t
	end, {
		p1.columnGap, p1.startingIndex, p1.endingIndex, p1.items, p1.numToRender,
		p1.renderItem, p1.sideMargin, p1.totalItemsOnCanvas,
		if FFlagCollectionViewMathChanges then p1.numColumns else p1.numItemsForSizing,
		if FFlagCollectionViewMathChanges then p1.spacingMetricsBinding else nil
	})))
end)