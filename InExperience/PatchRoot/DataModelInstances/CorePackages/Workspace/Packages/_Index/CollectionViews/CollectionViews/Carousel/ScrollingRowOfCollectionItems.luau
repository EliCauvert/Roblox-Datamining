local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local useHorizontalScrolledToEndThresholdModule = require(collectionViews.Carousel.useHorizontalScrolledToEndThreshold)
local useHorizontalWindowStartIndexModule = require(collectionViews.Carousel.useHorizontalWindowStartIndex)
local rowOfCollectionItemsModule = require(collectionViews.Carousel.RowOfCollectionItems)

local function _(p1, p2, p3)
	return if p2 == 0 then 0 else math.min(p2 + (p3 or 6), p1)
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useHorizontalScrolledToEndThresholdModule (ref), argCheckModule (ref), useHorizontalWindowStartIndexModule (ref), rowOfCollectionItemsModule (ref)
	local minValue
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), p1 (ref)
		var1.current = p2
		
		if p1.onScrollingFrameRefCallback then
			p1.onScrollingFrameRefCallback(p2)
		end
	end, { p1.onScrollingFrameRefCallback })
	useHorizontalScrolledToEndThresholdModule(var1, p1.thresholdFromEnd, p1.onReachedThresholdFromEnd, p1.ScrollingEnabled)
	argCheckModule.assert(p1.totalItemsOnCanvas >= 0)
	argCheckModule.assert(p1.numColumns >= 1)
	argCheckModule.assert(p1.columnGap >= 0)
	local var3 = p1.numItemsToRenderOffScreen ~= -1 and (p1.ScrollingEnabled and p1.numColumns * 2 < p1.totalItemsOnCanvas)
	
	if var3 then
		local numColumns = p1.numColumns
		minValue = if numColumns == 0 then 0 else math.min(numColumns + (p1.numItemsToRenderOffScreen or 6), p1.totalItemsOnCanvas)
	else
		minValue = math.min(p1.totalItemsOnCanvas, #p1.items)
	end
	local maxValue = math.max(p1.numColumns, p1.totalItemsOnCanvas)
	argCheckModule.assert(minValue >= 0)
	local minValue_1 = math.min(useHorizontalWindowStartIndexModule(var1, p1.itemSizeBinding, p1.columnGap, var3), #p1.items)
	local maxValue_1 = math.max(0, math.min(p1.totalItemsOnCanvas, minValue_1 + minValue - 1))
	argCheckModule.assert(minValue_1 >= 0 and minValue_1 <= #p1.items, `startingIndex: {minValue_1} failed check >= 0 and <= {#p1.items}`)
	argCheckModule.assert(minValue_1 <= maxValue_1 and maxValue_1 <= #p1.items, `endingIndex: {maxValue_1} failed check >= {minValue_1} and <= {#p1.items}`)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), minValue_1 (ref), maxValue_1 (ref)
		if p1.onViewableItemsChanged then
			p1.onViewableItemsChanged(minValue_1, maxValue_1)
		end
	end, { minValue_1, maxValue_1, p1.onViewableItemsChanged })
	
	return reactModule.createElement("ScrollingFrame", {
		Size = if p1.Size then p1.Size else p1.itemSizeBinding:map(function(p2)
			return UDim2.new(1, 0, 0, p2.Y)
		end),
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = p1.itemSizeBinding:map(function(p2)
			-- upvalues: maxValue (ref), p1 (ref)
			return UDim2.new(0, math.max(0, maxValue * (p2.X + p1.columnGap) - p1.columnGap), 0, p2.Y)
		end),
		ScrollingEnabled = p1.ScrollingEnabled and p1.numColumns < p1.totalItemsOnCanvas,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		Selectable = false,
		[reactModule.Change.CanvasPosition] = p1.onChangeCanvasPosition,
		ref = var2,
		AutomaticSize = p1.AutomaticSize
	}, {
		RowOfCollectionItems = reactModule.createElement(rowOfCollectionItemsModule, {
			startingIndex = minValue_1,
			endingIndex = maxValue_1,
			numToRender = minValue,
			items = p1.items,
			totalItemsOnCanvas = p1.totalItemsOnCanvas,
			columnGap = p1.columnGap,
			renderItem = p1.renderItem,
			sideMargin = p1.sideMargin,
			numItemsForSizing = maxValue
		})
	})
end)