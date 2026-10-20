local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local UseHorizontalScrolledToEndThresholdModule = require(CollectionViews.Carousel.useHorizontalScrolledToEndThreshold)
local UseHorizontalWindowStartIndexModule = require(CollectionViews.Carousel.useHorizontalWindowStartIndex)
local RowOfCollectionItemsModule = require(CollectionViews.Carousel.RowOfCollectionItems)

local function _(p1: number, p2, p3): number
	return if p2 == 0 then 0 else math.min(p2 + (p3 or 6), p1)
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ReactModule (copy), UseHorizontalScrolledToEndThresholdModule (copy), ArgCheckModule (copy), UseHorizontalWindowStartIndexModule (copy), RowOfCollectionItemsModule (copy)
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
	local Smallest1 = math.min(UseHorizontalWindowStartIndexModule(UseRefResult, Frame.itemSizeBinding, Frame.columnGap, IsTotalItemsOnCanvasAbove), #Frame.items)
	local Largest1 = math.max(0, (math.min(Frame.totalItemsOnCanvas, Smallest1 + Smallest - 1)))
	ArgCheckModule.assert(Smallest1 >= 0 and Smallest1 <= #Frame.items, `startingIndex: {Smallest1} failed check >= 0 and <= {#Frame.items}`)
	ArgCheckModule.assert(Smallest1 <= Largest1 and Largest1 <= #Frame.items, `endingIndex: {Largest1} failed check >= {Smallest1} and <= {#Frame.items}`)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), Smallest1 (copy), Largest1 (copy)
		if Frame.onViewableItemsChanged then
			Frame.onViewableItemsChanged(Smallest1, Largest1)
		end
	end, { Smallest1, Largest1, Frame.onViewableItemsChanged })
	
	return ReactModule.createElement("ScrollingFrame", {
		Size = if Frame.Size then Frame.Size else Frame.itemSizeBinding:map(function(p1): UDim2
			return UDim2.new(1, 0, 0, p1.Y)
		end),
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = Frame.itemSizeBinding:map(function(Vector): UDim2
			-- upvalues: Largest (copy), Frame (copy)
			return UDim2.new(0, math.max(0, Largest * (Vector.X + Frame.columnGap) - Frame.columnGap), 0, Vector.Y)
		end),
		ScrollingEnabled = Frame.ScrollingEnabled and Frame.numColumns < Frame.totalItemsOnCanvas,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		Selectable = false,
		[ReactModule.Change.CanvasPosition] = Frame.onChangeCanvasPosition,
		ref = UseResult,
		AutomaticSize = Frame.AutomaticSize
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
			numItemsForSizing = Largest
		})
	})
end)