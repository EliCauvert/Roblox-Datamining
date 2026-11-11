local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local UseHorizontalScrolledToEndThresholdModule = require(CollectionViews.Carousel.useHorizontalScrolledToEndThreshold)
local UseHorizontalWindowStartIndexModule = require(CollectionViews.Carousel.useHorizontalWindowStartIndex)
local RowOfCollectionItemsModule = require(CollectionViews.Carousel.RowOfCollectionItems)
local _ = require(CollectionViews.Carousel.calculateCarouselSpacingMetrics)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagCollectionViewMathChanges = SharedFlagsModule.FFlagCollectionViewMathChanges
local FFlagLuaAppFixCarouselCanvasOverflow = SharedFlagsModule.FFlagLuaAppFixCarouselCanvasOverflow

local function _(p1: number, p2, p3): number
	return if p2 == 0 then 0 else math.min(p2 + (p3 or 6), p1)
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ReactModule (copy), UseHorizontalScrolledToEndThresholdModule (copy), ArgCheckModule (copy), UseHorizontalWindowStartIndexModule (copy), FFlagCollectionViewMathChanges (copy), FFlagLuaAppFixCarouselCanvasOverflow (copy), RowOfCollectionItemsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), Frame (copy)
		UseRefResult.current = Current
		
		if Frame.onScrollingFrameRefCallback then
			Frame.onScrollingFrameRefCallback(Current)
		end
	end, { Frame.onScrollingFrameRefCallback })
	UseHorizontalScrolledToEndThresholdModule(UseRefResult, Frame.thresholdFromEnd, Frame.onReachedThresholdFromEnd, Frame.ScrollingEnabled)
	ArgCheckModule.assert(Frame.totalItemsOnCanvas >= 0)
	ArgCheckModule.assert(Frame.numColumns >= 1)
	ArgCheckModule.assert(Frame.columnGap >= 0)
	local IsTotalItemsOnCanvasAbove: boolean = Frame.numItemsToRenderOffScreen ~= -1 and (Frame.ScrollingEnabled and Frame.totalItemsOnCanvas > Frame.numColumns * 2)
	local Smallest = nil
	
	if IsTotalItemsOnCanvasAbove then
		local TotalItemsOnCanvas: number = Frame.totalItemsOnCanvas
		local NumColumns = Frame.numColumns
		local NumItemsToRenderOffScreen = Frame.numItemsToRenderOffScreen
		Smallest = if NumColumns == 0 then 0 else math.min(NumColumns + (NumItemsToRenderOffScreen or 6), TotalItemsOnCanvas)
	else
		Smallest = math.min(Frame.totalItemsOnCanvas, #Frame.items)
	end
	local Largest = math.max(Frame.numColumns, Frame.totalItemsOnCanvas)
	ArgCheckModule.assert(Smallest >= 0)
	local Smallest1 = math.min(UseHorizontalWindowStartIndexModule(UseRefResult, if FFlagCollectionViewMathChanges then nil else Frame.itemSizeBinding, if FFlagCollectionViewMathChanges then nil else Frame.columnGap, IsTotalItemsOnCanvasAbove, if FFlagCollectionViewMathChanges then Frame.numColumns else nil, if FFlagCollectionViewMathChanges then Frame.spacingMetricsBinding else nil), #Frame.items)
	local Largest1 = math.max(0, (math.min(Frame.totalItemsOnCanvas, Smallest1 + Smallest - 1)))
	ArgCheckModule.assert(Smallest1 >= 0 and Smallest1 <= #Frame.items, `startingIndex: {Smallest1} failed check >= 0 and <= {#Frame.items}`)
	ArgCheckModule.assert(Smallest1 <= Largest1 and Largest1 <= #Frame.items, `endingIndex: {Largest1} failed check >= {Smallest1} and <= {#Frame.items}`)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), Smallest1 (copy), Largest1 (copy)
		if Frame.onViewableItemsChanged then
			Frame.onViewableItemsChanged(Smallest1, Largest1)
		end
	end, { Smallest1, Largest1, Frame.onViewableItemsChanged })
	local UseMemoResult = if FFlagCollectionViewMathChanges then ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Frame (copy), FFlagLuaAppFixCarouselCanvasOverflow (upval), Largest (copy)
		return ReactModule.joinBindings({ Frame.spacingMetricsBinding, Frame.itemSizeBinding }):map(function(Entry): UDim2
			-- upvalues: FFlagLuaAppFixCarouselCanvasOverflow (upval), Largest (upval), Frame (upval)
			local Entry1 = Entry[1]
			
			return UDim2.fromOffset(math.max(0, if Entry1.effectiveWidth > 0 then if FFlagLuaAppFixCarouselCanvasOverflow then (Largest - 1) * Entry1.stride + Entry1.renderedItemWidth else (Largest - Frame.numColumns) * Entry1.stride + Entry1.containerWidth else 0), (math.ceil(Entry[2].Y)))
		end)
	end, {
		Frame.spacingMetricsBinding,
		Frame.itemSizeBinding,
		Frame.numColumns,
		Largest
	}) else nil
	
	return ReactModule.createElement("ScrollingFrame", {
		Size = if Frame.Size then Frame.Size else Frame.itemSizeBinding:map(function(p1): UDim2
			return UDim2.new(1, 0, 0, p1.Y)
		end),
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = if FFlagCollectionViewMathChanges then UseMemoResult else Frame.itemSizeBinding:map(function(Vector): UDim2
			-- upvalues: Largest (copy), Frame (copy)
			return UDim2.new(0, math.max(0, Largest * (Vector.X + Frame.columnGap) - Frame.columnGap), 0, Vector.Y)
		end),
		ScrollingEnabled = Frame.ScrollingEnabled and Frame.numColumns < Frame.totalItemsOnCanvas,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		Selectable = false,
		[ReactModule.Change.CanvasPosition] = Frame.onChangeCanvasPosition,
		[ReactModule.Change.AbsoluteSize] = if FFlagCollectionViewMathChanges then Frame.onScrollingFrameAbsoluteSizeChanged else nil,
		ref = UseResult,
		AutomaticSize = Frame.AutomaticSize
	}, {
		RowOfCollectionItems = if FFlagCollectionViewMathChanges then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			Size = Frame.spacingMetricsBinding:map(function(p1): UDim2
				return UDim2.new(0, p1.effectiveWidth, 1, 0)
			end)
		}, {
			RowOfCollectionItems = ReactModule.createElement(RowOfCollectionItemsModule, {
				startingIndex = Smallest1,
				endingIndex = Largest1,
				numToRender = Smallest,
				items = Frame.items,
				totalItemsOnCanvas = Frame.totalItemsOnCanvas,
				columnGap = Frame.columnGap,
				renderItem = Frame.renderItem,
				sideMargin = Frame.sideMargin,
				numColumns = Frame.numColumns,
				spacingMetricsBinding = Frame.spacingMetricsBinding
			})
		}) else ReactModule.createElement(RowOfCollectionItemsModule, {
			startingIndex = Smallest1,
			endingIndex = Largest1,
			numToRender = Smallest,
			items = Frame.items,
			totalItemsOnCanvas = Frame.totalItemsOnCanvas,
			columnGap = Frame.columnGap,
			renderItem = Frame.renderItem,
			sideMargin = Frame.sideMargin,
			numItemsForSizing = Largest
		})
	})
end)