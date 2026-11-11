local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local CalculateRelativeColumnGapModule = require(CollectionViews.Grid.calculateRelativeColumnGap)
local CalculateSpacePerItemModule = require(CollectionViews.calculateSpacePerItem)
local FFlagCollectionViewMathChanges = require(Parent.SharedFlags).FFlagCollectionViewMathChanges
local config = {
	maxNumRows = 1e999,
	numColumns = 1,
	bufferRowsBelowScreen = 4,
	bufferRowsAboveScreen = 4,
	columnGap = 0,
	sideMargin = 0,
	verticalPadding = 0,
	thresholdRowsFromBottom = 0
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), ArgCheckModule (copy), FFlagCollectionViewMathChanges (copy), CalculateSpacePerItemModule (copy), CalculateRelativeColumnGapModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseRefResult = ReactModule.useRef(nil)
	local Smallest = math.min(math.ceil(#JoinResult.items / JoinResult.numColumns), JoinResult.maxNumRows)
	local MapResult = JoinResult.itemSizeBinding:map(function(p2)
		-- upvalues: Smallest (copy), JoinResult (copy)
		return Smallest * (p2.Y + JoinResult.verticalPadding) - JoinResult.verticalPadding
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(-1)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(-1)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(JoinResult.bufferRowsBelowScreen + JoinResult.bufferRowsAboveScreen)
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy), UseRefResult (copy), Smallest (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local List = {}
		
		if JoinResult.verticalScrollingFrameRef and JoinResult.verticalScrollingFrameRef.current and UseRefResult.current then
			local Current = UseRefResult.current
			local Current1 = JoinResult.verticalScrollingFrameRef.current
			local Y = Current1.AbsolutePosition.Y
			local Y1 = Current1.AbsoluteWindowSize.Y
			local NewCeiled = math.ceil(Y1 / math.max(1, JoinResult.itemSizeBinding:getValue().Y + JoinResult.verticalPadding)) + 1
			
			local function _()
				-- upvalues: Current (copy), Current1 (copy), Y (ref)
				return Current.AbsolutePosition.Y + Current1.CanvasPosition.Y - Y
			end
			
			local YDelta = Current.AbsolutePosition.Y + Current1.CanvasPosition.Y - Y
			
			local function updateRowsToRender()
				-- upvalues: Current1 (copy), JoinResult (upval), Smallest (upval), YDelta (ref), Y1 (ref), NewCeiled (ref), UseStateResult2 (upval), UseStateResult2_1 (upval)
				local Y = JoinResult.itemSizeBinding:getValue().Y
				local Largest = math.max(1, Y + JoinResult.verticalPadding)
				local SmallestDelta = Smallest * (Y + JoinResult.verticalPadding) - JoinResult.verticalPadding
				local YDeltaDelta = YDelta - Current1.CanvasPosition.Y
				local ScaledBufferRowsAboveScreen = JoinResult.bufferRowsAboveScreen * Largest
				local Smallest1 = nil
				local Largest1 = nil
				
				if Y1 + JoinResult.bufferRowsBelowScreen * Largest < YDeltaDelta or YDeltaDelta + SmallestDelta < -ScaledBufferRowsAboveScreen then
					Largest1 = -1
					Smallest1 = -1
				else
					local Floored = math.floor(-YDeltaDelta / Largest)
					Largest1 = math.max(1, Floored + 1 - JoinResult.bufferRowsAboveScreen)
					local NewNewCeiled = NewCeiled + JoinResult.bufferRowsBelowScreen
					Smallest1 = math.min(Smallest, Largest1 + math.max(1, if Floored <= 0 then NewNewCeiled + Floored else NewNewCeiled + math.min(Floored, JoinResult.bufferRowsAboveScreen)) - 1)
				end
				UseStateResult2(Largest1)
				UseStateResult2_1(Smallest1)
			end
			
			local function updateWindowParams()
				-- upvalues: JoinResult (upval), Y (ref), Current1 (copy), Y1 (ref), YDelta (ref), Current (copy), NewCeiled (ref), UseStateResult2_2 (upval), Smallest (upval), updateRowsToRender (copy)
				Y = Current1.AbsolutePosition.Y
				Y1 = Current1.AbsoluteWindowSize.Y
				YDelta = Current.AbsolutePosition.Y + Current1.CanvasPosition.Y - Y
				NewCeiled = math.ceil(Y1 / math.max(1, JoinResult.itemSizeBinding:getValue().Y + JoinResult.verticalPadding)) + 1
				UseStateResult2_2((math.min(Smallest, NewCeiled + JoinResult.bufferRowsBelowScreen + JoinResult.bufferRowsAboveScreen)))
				updateRowsToRender()
			end
			
			table.insert(List, Current1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateWindowParams))
			table.insert(List, Current1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateWindowParams))
			table.insert(List, Current1:GetPropertyChangedSignal("CanvasSize"):Connect(updateWindowParams))
			table.insert(List, Current1:GetPropertyChangedSignal("CanvasPosition"):Connect(updateRowsToRender))
			updateWindowParams()
		else
			UseStateResult2(1)
			UseStateResult2_1(Smallest)
			UseStateResult2_2(Smallest)
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		UseRefResult, Smallest, JoinResult.itemSizeBinding,
		JoinResult.verticalScrollingFrameRef, JoinResult.verticalPadding,
		JoinResult.bufferRowsAboveScreen, JoinResult.bufferRowsBelowScreen,
		JoinResult.onViewableItemsChanged
	})
	local Smallest1 = math.min(UseStateResult1, Smallest)
	local Largest = math.max(-1, (UseStateResult - 1) * JoinResult.numColumns + 1)
	local Largest1 = math.max(-1, (math.min(#JoinResult.items, Smallest1 * JoinResult.numColumns)))
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy), Largest (copy), Largest1 (copy)
		if JoinResult.onViewableItemsChanged then
			JoinResult.onViewableItemsChanged(Largest, Largest1)
		end
	end, { Largest, Largest1, JoinResult.onViewableItemsChanged })
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: Smallest1 (ref), Smallest (copy), JoinResult (copy), UseRefResult1 (copy)
		if Smallest - JoinResult.thresholdRowsFromBottom <= Smallest1 and UseRefResult1.current ~= JoinResult.items and JoinResult.onReachedThresholdFromEnd then
			JoinResult.onReachedThresholdFromEnd()
			UseRefResult1.current = JoinResult.items
		end
	end, {
		Smallest1,
		Smallest,
		JoinResult.thresholdRowsFromBottom,
		JoinResult.onReachedThresholdFromEnd,
		JoinResult.items
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseRefResult,
		Size = MapResult:map(function(YOffset): UDim2
			return UDim2.new(1, 0, 0, YOffset)
		end),
		LayoutOrder = JoinResult.LayoutOrder,
		Position = JoinResult.Position
	}, (ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), Smallest1 (ref), Largest (copy), Largest1 (copy), JoinResult (copy), Smallest (copy), ArgCheckModule (upval), ReactModule (upval), FFlagCollectionViewMathChanges (upval), CalculateSpacePerItemModule (upval), CalculateRelativeColumnGapModule (upval), UseStateResult3 (copy)
		local t = {}
		
		if UseStateResult <= 0 or Smallest1 < UseStateResult then
			return nil
		end
		if Largest <= 0 or Largest1 < Largest then
			return nil
		end
		if JoinResult.numColumns <= 0 or Smallest - UseStateResult < 0 then
			return nil
		end
		ArgCheckModule.assert(UseStateResult >= 1)
		ArgCheckModule.assert(UseStateResult <= Smallest1 and Smallest1 <= Smallest)
		
		if UseStateResult > 1 then
			local UseStateResultDelta = UseStateResult - 1
			t.Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = JoinResult.itemSizeBinding:map(function(p2): UDim
					-- upvalues: UseStateResultDelta (copy), JoinResult (upval)
					return UDim.new(0, UseStateResultDelta * (p2.Y + JoinResult.verticalPadding))
				end)
			})
		end
		local NewSmallest = Smallest - UseStateResult + 1
		ArgCheckModule.assert(NewSmallest >= 1)
		ArgCheckModule.assert(JoinResult.numColumns >= 1)
		local _UDim2 = nil
		local _UDim2_1 = nil
		
		if FFlagCollectionViewMathChanges then
			local SpacePerItemModule = CalculateSpacePerItemModule(JoinResult.numColumns, JoinResult.columnGap)
			local SpacePerItemModule1 = CalculateSpacePerItemModule(NewSmallest, JoinResult.verticalPadding)
			_UDim2 = UDim2.new(1 / JoinResult.numColumns, -SpacePerItemModule.gapOffsetPerItem, 1 / NewSmallest, -SpacePerItemModule1.gapOffsetPerItem)
			_UDim2_1 = UDim2.new(0, SpacePerItemModule.adjustedGap, 0, SpacePerItemModule1.adjustedGap)
		else
			local NumColumnsDelta = JoinResult.numColumns - 1
			_UDim2 = UDim2.new(1 / JoinResult.numColumns, math.floor(-(NumColumnsDelta / JoinResult.numColumns) * JoinResult.columnGap), 1 / NewSmallest, (math.floor(-((NewSmallest - 1) / NewSmallest) * JoinResult.verticalPadding)))
			local NewColumnGap = JoinResult.columnGap + (math.floor(NumColumnsDelta / JoinResult.numColumns * JoinResult.columnGap) * JoinResult.numColumns - JoinResult.columnGap * NumColumnsDelta) / NumColumnsDelta
			_UDim2_1 = if JoinResult.disableRelativeGap then UDim2.new(0, NewColumnGap, 0, JoinResult.verticalPadding) else JoinResult.itemSizeBinding:map(function(p2): UDim2
				-- upvalues: CalculateRelativeColumnGapModule (upval), JoinResult (upval)
				return UDim2.new(CalculateRelativeColumnGapModule(JoinResult.numColumns, JoinResult.columnGap, p2.X, JoinResult.sideMargin), 0, 0, JoinResult.verticalPadding)
			end)
		end
		t.Layout = ReactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = JoinResult.numColumns,
			CellPadding = _UDim2_1,
			CellSize = _UDim2,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		ArgCheckModule.assert(Largest >= 1)
		ArgCheckModule.assert(Largest <= Largest1 and Largest1 <= #JoinResult.items)
		
		for i = Largest, Largest1 do
			if i <= #JoinResult.items then
				local RenderItemResult2
				t[`{RenderItemResult2}{i % (UseStateResult3 * JoinResult.numColumns)}`], RenderItemResult2 = JoinResult.renderItem(JoinResult.items[i], i, UDim2.fromScale(1, 1), (math.ceil(i / JoinResult.numColumns)))
			end
		end
		return t
	end, {
		JoinResult.columnGap, JoinResult.numColumns, JoinResult.itemSizeBinding,
		UseStateResult, Smallest1, JoinResult.items, JoinResult.renderItem,
		JoinResult.verticalPadding, UseStateResult3, Smallest,
		if FFlagCollectionViewMathChanges then nil else JoinResult.sideMargin, Largest,
		Largest1,
		if FFlagCollectionViewMathChanges then nil else JoinResult.disableRelativeGap
	})))
end)