local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local calculateSpacePerItemModule = require(collectionViews.calculateSpacePerItem)
local _ = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagCollectionViewMathChanges (ref), calculateSpacePerItemModule (ref), argCheckModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagCollectionViewMathChanges (copy), calculateSpacePerItemModule (copy), reactModule (copy), argCheckModule (copy)
		if p1.numToRender ~= 0 then
			local var1
			if fFlagCollectionViewMathChanges then
				var1 = p1.numColumns == 0
				var1 = nil
			else
				var1 = p1.numItemsForSizing == 0
			end
			if var1 then
				return nil
			end
			local uDim2, adjustedGap
			local var2 = p1.startingIndex - 1
			local t = {}
			local _ = nil
			local _ = nil
			
			if fFlagCollectionViewMathChanges then
				local numColumns = p1.numColumns
				local var3 = calculateSpacePerItemModule(numColumns, p1.columnGap)
				uDim2 = UDim2.new(1 / numColumns, -var3.gapOffsetPerItem, 1, 0)
				adjustedGap = var3.adjustedGap
			else
				local numItemsForSizing = p1.numItemsForSizing
				local var4 = numItemsForSizing - 1
				local floored = math.floor(var4 / numItemsForSizing * p1.columnGap)
				uDim2 = UDim2.new(1 / numItemsForSizing, -floored, 1, 0)
				adjustedGap = p1.columnGap + (floored * numItemsForSizing - p1.columnGap * var4) / var4
			end
			t.Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, adjustedGap),
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			})
			
			if var2 > 0 then
				t.Padding = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = if fFlagCollectionViewMathChanges then p1.spacingMetricsBinding:map(function(p2)
						-- upvalues: var2 (ref)
						return UDim2.fromOffset(math.max(0, var2 * p2.stride - p2.renderedGap), 0)
					end) else UDim2.new(var2 * uDim2.X.Scale, (var2 - 1) * adjustedGap + var2 * uDim2.X.Offset, 0, 0)
				})
			end
			argCheckModule.assert(p1.startingIndex >= 1 and p1.startingIndex <= #p1.items)
			argCheckModule.assert(p1.startingIndex <= p1.endingIndex and p1.endingIndex <= #p1.items)
			
			for i = p1.startingIndex, p1.endingIndex do
				if i >= 1 and i <= #p1.items then
					local var5, var6 = p1.renderItem(p1.items[i], i, uDim2)
					t[var6 .. tostring(i % p1.numToRender + 1)] = var5
				end
			end
			return t
		end
	end, {
		p1.columnGap, p1.startingIndex, p1.endingIndex, p1.items, p1.numToRender,
		p1.renderItem, p1.sideMargin, p1.totalItemsOnCanvas,
		if fFlagCollectionViewMathChanges then p1.numColumns else p1.numItemsForSizing,
		if fFlagCollectionViewMathChanges then p1.spacingMetricsBinding else nil
	}))
end)