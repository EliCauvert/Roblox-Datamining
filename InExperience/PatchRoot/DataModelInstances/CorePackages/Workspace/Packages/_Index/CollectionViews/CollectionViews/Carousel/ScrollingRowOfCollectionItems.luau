local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local useHorizontalScrolledToEndThresholdModule = require(collectionViews.Carousel.useHorizontalScrolledToEndThreshold)
local useHorizontalWindowStartIndexModule = require(collectionViews.Carousel.useHorizontalWindowStartIndex)
local rowOfCollectionItemsModule = require(collectionViews.Carousel.RowOfCollectionItems)
local _ = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagCollectionViewMathChanges = sharedFlagsModule.FFlagCollectionViewMathChanges
local fFlagLuaAppFixCarouselCanvasOverflow = sharedFlagsModule.FFlagLuaAppFixCarouselCanvasOverflow

local function _(p0, p1, p2)
	return if p1 == 0 then 0 else math.min(p1 + (p2 or 6), p0)
end

return reactModule.memo(function(p3)
	-- upvalues: reactModule (ref), useHorizontalScrolledToEndThresholdModule (ref), argCheckModule (ref), useHorizontalWindowStartIndexModule (ref), fFlagCollectionViewMathChanges (ref), fFlagLuaAppFixCarouselCanvasOverflow (ref), rowOfCollectionItemsModule (ref)
	local minValue
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useCallback(function(p4)
		-- upvalues: var7 (ref), p3 (ref)
		var7.current = p4
		
		if p3.onScrollingFrameRefCallback then
			p3.onScrollingFrameRefCallback(p4)
		end
	end, { p3.onScrollingFrameRefCallback })
	useHorizontalScrolledToEndThresholdModule(var7, p3.thresholdFromEnd, p3.onReachedThresholdFromEnd, p3.ScrollingEnabled)
	argCheckModule.assert(p3.totalItemsOnCanvas >= 0)
	argCheckModule.assert(p3.numColumns >= 1)
	argCheckModule.assert(p3.columnGap >= 0)
	local var9 = p3.numItemsToRenderOffScreen ~= -1 and (p3.ScrollingEnabled and p3.numColumns * 2 < p3.totalItemsOnCanvas)
	
	if var9 then
		local numColumns = p3.numColumns
		minValue = if numColumns == 0 then 0 else math.min(numColumns + (p3.numItemsToRenderOffScreen or 6), p3.totalItemsOnCanvas)
	else
		minValue = math.min(p3.totalItemsOnCanvas, #p3.items)
	end
	local maxValue = math.max(p3.numColumns, p3.totalItemsOnCanvas)
	argCheckModule.assert(minValue >= 0)
	local minValue_1 = math.min(useHorizontalWindowStartIndexModule(var7, if fFlagCollectionViewMathChanges then nil else p3.itemSizeBinding, if fFlagCollectionViewMathChanges then nil else p3.columnGap, var9, if fFlagCollectionViewMathChanges then p3.numColumns else nil, if fFlagCollectionViewMathChanges then p3.spacingMetricsBinding else nil), #p3.items)
	local maxValue_1 = math.max(0, math.min(p3.totalItemsOnCanvas, minValue_1 + minValue - 1))
	argCheckModule.assert(minValue_1 >= 0 and minValue_1 <= #p3.items, `startingIndex: {minValue_1} failed check >= 0 and <= {#p3.items}`)
	argCheckModule.assert(minValue_1 <= maxValue_1 and maxValue_1 <= #p3.items, `endingIndex: {maxValue_1} failed check >= {minValue_1} and <= {#p3.items}`)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), minValue_1 (ref), maxValue_1 (ref)
		if p3.onViewableItemsChanged then
			p3.onViewableItemsChanged(minValue_1, maxValue_1)
		end
	end, { minValue_1, maxValue_1, p3.onViewableItemsChanged })
	
	return reactModule.createElement("ScrollingFrame", {
		Size = if p3.Size then p3.Size else p3.itemSizeBinding:map(function(p5)
			return UDim2.new(1, 0, 0, p5.Y)
		end),
		Position = p3.Position,
		LayoutOrder = p3.LayoutOrder,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = if fFlagCollectionViewMathChanges then if fFlagCollectionViewMathChanges then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), p3 (ref), fFlagLuaAppFixCarouselCanvasOverflow (copy), maxValue (ref)
			return reactModule.joinBindings({ p3.spacingMetricsBinding, p3.itemSizeBinding }):map(function(p7)
				-- upvalues: fFlagLuaAppFixCarouselCanvasOverflow (copy), maxValue (copy), p3 (copy)
				local var14 = p7[1]
				
				return UDim2.fromOffset(math.max(0, if var14.effectiveWidth > 0 then if fFlagLuaAppFixCarouselCanvasOverflow then (maxValue - 1) * var14.stride + var14.renderedItemWidth else (maxValue - p3.numColumns) * var14.stride + var14.containerWidth else 0), math.ceil(p7[2].Y))
			end)
		end, {
			p3.spacingMetricsBinding,
			p3.itemSizeBinding,
			p3.numColumns,
			maxValue
		}) else nil else p3.itemSizeBinding:map(function(p6)
			-- upvalues: maxValue (ref), p3 (ref)
			return UDim2.new(0, math.max(0, maxValue * (p6.X + p3.columnGap) - p3.columnGap), 0, p6.Y)
		end),
		ScrollingEnabled = p3.ScrollingEnabled and p3.numColumns < p3.totalItemsOnCanvas,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		Selectable = false,
		[reactModule.Change.CanvasPosition] = p3.onChangeCanvasPosition,
		[reactModule.Change.AbsoluteSize] = if fFlagCollectionViewMathChanges then p3.onScrollingFrameAbsoluteSizeChanged else nil,
		ref = var8,
		AutomaticSize = p3.AutomaticSize
	}, {
		RowOfCollectionItems = if fFlagCollectionViewMathChanges then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			Size = p3.spacingMetricsBinding:map(function(p8)
				return UDim2.new(0, p8.effectiveWidth, 1, 0)
			end)
		}, {
			RowOfCollectionItems = reactModule.createElement(rowOfCollectionItemsModule, {
				startingIndex = minValue_1,
				endingIndex = maxValue_1,
				numToRender = minValue,
				items = p3.items,
				totalItemsOnCanvas = p3.totalItemsOnCanvas,
				columnGap = p3.columnGap,
				renderItem = p3.renderItem,
				sideMargin = p3.sideMargin,
				numColumns = p3.numColumns,
				spacingMetricsBinding = p3.spacingMetricsBinding
			})
		}) else reactModule.createElement(rowOfCollectionItemsModule, {
			startingIndex = minValue_1,
			endingIndex = maxValue_1,
			numToRender = minValue,
			items = p3.items,
			totalItemsOnCanvas = p3.totalItemsOnCanvas,
			columnGap = p3.columnGap,
			renderItem = p3.renderItem,
			sideMargin = p3.sideMargin,
			numItemsForSizing = maxValue
		})
	})
end)