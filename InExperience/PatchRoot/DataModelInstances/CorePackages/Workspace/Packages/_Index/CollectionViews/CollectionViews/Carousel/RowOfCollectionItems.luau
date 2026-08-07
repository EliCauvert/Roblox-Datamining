local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local calculateSpacePerItemModule = require(collectionViews.calculateSpacePerItem)
local _ = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges

return reactModule.memo(function(p0) --[[ line: 52 | named "RowOfCollectionItems" ]]
	-- upvalues: reactModule (ref), fFlagCollectionViewMathChanges (ref), calculateSpacePerItemModule (ref), argCheckModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, reactModule.useMemo(function() --[[ line: 54 ]]
		-- upvalues: p0 (ref), fFlagCollectionViewMathChanges (copy), calculateSpacePerItemModule (copy), reactModule (copy), argCheckModule (copy)
		if p0.numToRender ~= 0 then
			local var4
			if fFlagCollectionViewMathChanges then
				var4 = p0.numColumns == 0
				var4 = nil
			else
				var4 = p0.numItemsForSizing == 0
			end
			if var4 then
				return nil
			end
			local uDim2, adjustedGap
			local var5 = p0.startingIndex - 1
			local t = {}
			local _ = nil
			local _ = nil
			
			if fFlagCollectionViewMathChanges then
				local numColumns = p0.numColumns
				local var7 = calculateSpacePerItemModule(numColumns, p0.columnGap)
				uDim2 = UDim2.new(1 / numColumns, -var7.gapOffsetPerItem, 1, 0)
				adjustedGap = var7.adjustedGap
			else
				local numItemsForSizing = p0.numItemsForSizing
				local var9 = numItemsForSizing - 1
				local floored = math.floor(var9 / numItemsForSizing * p0.columnGap)
				uDim2 = UDim2.new(1 / numItemsForSizing, -floored, 1, 0)
				adjustedGap = p0.columnGap + (floored * numItemsForSizing - p0.columnGap * var9) / var9
			end
			t.Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, adjustedGap),
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			})
			
			if var5 > 0 then
				t.Padding = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = if fFlagCollectionViewMathChanges then p0.spacingMetricsBinding:map(function(p1) --[[ line: 100 ]]
						-- upvalues: var5 (ref)
						return UDim2.fromOffset(math.max(0, var5 * p1.stride - p1.renderedGap), 0)
					end) else UDim2.new(var5 * uDim2.X.Scale, (var5 - 1) * adjustedGap + var5 * uDim2.X.Offset, 0, 0)
				})
			end
			argCheckModule.assert(p0.startingIndex >= 1 and p0.startingIndex <= #p0.items)
			argCheckModule.assert(p0.startingIndex <= p0.endingIndex and p0.endingIndex <= #p0.items)
			
			for i = p0.startingIndex, p0.endingIndex do
				if i >= 1 and i <= #p0.items then
					local var11, var12 = p0.renderItem(p0.items[i], i, uDim2)
					t[var12 .. tostring(i % p0.numToRender + 1)] = var11
				end
			end
			return t
		end
	end, {
		p0.columnGap, p0.startingIndex, p0.endingIndex, p0.items, p0.numToRender,
		p0.renderItem, p0.sideMargin, p0.totalItemsOnCanvas,
		if fFlagCollectionViewMathChanges then p0.numColumns else p0.numItemsForSizing,
		if fFlagCollectionViewMathChanges then p0.spacingMetricsBinding else nil
	}))
end)