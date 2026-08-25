local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local calculateRelativeColumnGapModule = require(collectionViews.Grid.calculateRelativeColumnGap)
local calculateSpacePerItemModule = require(collectionViews.calculateSpacePerItem)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges
local luaAppFixCollectionGridWindowAbsoluteCanvasSize = game:DefineFastFlag("LuaAppFixCollectionGridWindowAbsoluteCanvasSize", false)
local t = {
	maxNumRows = 1e999,
	numColumns = 1,
	bufferRowsBelowScreen = 4,
	bufferRowsAboveScreen = 4,
	columnGap = 0,
	sideMargin = 0,
	verticalPadding = 0,
	thresholdRowsFromBottom = 0
}

return reactModule.memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), luaAppFixCollectionGridWindowAbsoluteCanvasSize (ref), argCheckModule (ref), fFlagCollectionViewMathChanges (ref), calculateSpacePerItemModule (ref), calculateRelativeColumnGapModule (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9 = reactModule.useRef(nil)
	local minValue = math.min(math.ceil(#var8.items / var8.numColumns), var8.maxNumRows)
	local var11 = var8.itemSizeBinding:map(function(p1)
		-- upvalues: minValue (ref), var8 (ref)
		return minValue * (p1.Y + var8.verticalPadding) - var8.verticalPadding
	end)
	local var12, var13 = reactModule.useState(-1)
	local var14, var15 = reactModule.useState(-1)
	local var16, var17 = reactModule.useState(var8.bufferRowsBelowScreen + var8.bufferRowsAboveScreen)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var9 (ref), minValue (ref), var13 (ref), var15 (ref), var17 (ref), luaAppFixCollectionGridWindowAbsoluteCanvasSize (copy)
		local t = {}
		
		if var8.verticalScrollingFrameRef and var8.verticalScrollingFrameRef.current and var9.current then
			local current = var9.current
			local current_1 = var8.verticalScrollingFrameRef.current
			local y = var8.itemSizeBinding:getValue().Y
			local y_1 = current_1.AbsolutePosition.Y
			local y_2 = current_1.AbsoluteWindowSize.Y
			local var22 = math.ceil(y_2 / math.max(1, y + var8.verticalPadding)) + 1
			
			local function _()
				-- upvalues: current (ref), current_1 (ref), y_1 (write)
				return current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
			end
			
			local var23 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
			
			local function updateRowsToRender()
				-- upvalues: current_1 (ref), var8 (copy), minValue (copy), var23 (write), y_2 (write), var22 (write), var13 (copy), var15 (copy)
				local maxValue_1, minValue_1
				local y = current_1.CanvasPosition.Y
				local y_1 = var8.itemSizeBinding:getValue().Y
				local maxValue = math.max(1, y_1 + var8.verticalPadding)
				local var27 = minValue * (y_1 + var8.verticalPadding) - var8.verticalPadding
				local var28 = var23 - y
				local var29 = var8.bufferRowsAboveScreen * maxValue
				local var30 = var8.bufferRowsBelowScreen * maxValue
				local _ = nil
				local _ = nil
				
				if y_2 + var30 < var28 or var28 + var27 < -var29 then
					maxValue_1 = -1
					minValue_1 = -1
				else
					local floored = math.floor(-var28 / maxValue)
					maxValue_1 = math.max(1, floored + 1 - var8.bufferRowsAboveScreen)
					local var33 = var22 + var8.bufferRowsBelowScreen
					minValue_1 = math.min(minValue, maxValue_1 + math.max(1, if floored <= 0 then var33 + floored else var33 + math.min(floored, var8.bufferRowsAboveScreen)) - 1)
				end
				var13(maxValue_1)
				var15(minValue_1)
			end
			
			local function updateWindowParams()
				-- upvalues: var8 (copy), y_1 (write), current_1 (ref), y_2 (write), var23 (write), current (ref), var22 (write), var17 (copy), minValue (copy), updateRowsToRender (ref)
				local maxValue = math.max(1, var8.itemSizeBinding:getValue().Y + var8.verticalPadding)
				y_1 = current_1.AbsolutePosition.Y
				y_2 = current_1.AbsoluteWindowSize.Y
				var23 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
				var22 = math.ceil(y_2 / maxValue) + 1
				var17(math.min(minValue, var22 + var8.bufferRowsBelowScreen + var8.bufferRowsAboveScreen))
				updateRowsToRender()
			end
			
			table.insert(t, current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal(if luaAppFixCollectionGridWindowAbsoluteCanvasSize then "AbsoluteCanvasSize" else "CanvasSize"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(updateRowsToRender))
			updateWindowParams()
		else
			var13(1)
			var15(minValue)
			var17(minValue)
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		var9, minValue, var8.itemSizeBinding, var8.verticalScrollingFrameRef,
		var8.verticalPadding, var8.bufferRowsAboveScreen, var8.bufferRowsBelowScreen,
		var8.onViewableItemsChanged
	})
	var14 = math.min(var14, minValue)
	local maxValue = math.max(-1, (var12 - 1) * var8.numColumns + 1)
	local maxValue_1 = math.max(-1, math.min(#var8.items, var14 * var8.numColumns))
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), maxValue (ref), maxValue_1 (ref)
		if var8.onViewableItemsChanged then
			var8.onViewableItemsChanged(maxValue, maxValue_1)
		end
	end, { maxValue, maxValue_1, var8.onViewableItemsChanged })
	local var20 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var14 (write), minValue (ref), var8 (ref), var20 (ref)
		if minValue - var8.thresholdRowsFromBottom <= var14 and var20.current ~= var8.items and var8.onReachedThresholdFromEnd then
			var8.onReachedThresholdFromEnd()
			var20.current = var8.items
		end
	end, {
		var14,
		minValue,
		var8.thresholdRowsFromBottom,
		var8.onReachedThresholdFromEnd,
		var8.items
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = var9,
		Size = var11:map(function(p2)
			return UDim2.new(1, 0, 0, p2)
		end),
		LayoutOrder = var8.LayoutOrder,
		Position = var8.Position
	}, reactModule.useMemo(function()
		-- upvalues: var12 (ref), var14 (write), maxValue (ref), maxValue_1 (ref), var8 (ref), minValue (ref), argCheckModule (copy), reactModule (copy), fFlagCollectionViewMathChanges (copy), calculateSpacePerItemModule (copy), calculateRelativeColumnGapModule (copy), var16 (ref)
		local t = {}
		
		if var12 <= 0 or var14 < var12 then
			return nil
		elseif maxValue <= 0 or maxValue_1 < maxValue then
			return nil
		elseif var8.numColumns <= 0 or minValue - var12 < 0 then
			return nil
		end
		argCheckModule.assert(var12 >= 1)
		argCheckModule.assert(var12 <= var14 and var14 <= minValue)
		
		if var12 > 1 then
			local var37 = var12 - 1
			t.Padding = reactModule.createElement("UIPadding", {
				PaddingTop = var8.itemSizeBinding:map(function(p3)
					-- upvalues: var37 (ref), var8 (copy)
					return UDim.new(0, var37 * (p3.Y + var8.verticalPadding))
				end)
			})
		end
		local uDim2, var41
		local var38 = minValue - var12 + 1
		argCheckModule.assert(var38 >= 1)
		argCheckModule.assert(var8.numColumns >= 1)
		local _ = nil
		local _ = nil
		
		if fFlagCollectionViewMathChanges then
			local var42 = calculateSpacePerItemModule(var8.numColumns, var8.columnGap)
			local var43 = calculateSpacePerItemModule(var38, var8.verticalPadding)
			uDim2 = UDim2.new(1 / var8.numColumns, -var42.gapOffsetPerItem, 1 / var38, -var43.gapOffsetPerItem)
			var41 = UDim2.new(0, var42.adjustedGap, 0, var43.adjustedGap)
		else
			local var39 = var8.numColumns - 1
			uDim2 = UDim2.new(1 / var8.numColumns, math.floor(-(var39 / var8.numColumns) * var8.columnGap), 1 / var38, math.floor(-((var38 - 1) / var38) * var8.verticalPadding))
			var41 = if var8.disableRelativeGap then UDim2.new(0, var8.columnGap + (math.floor(var39 / var8.numColumns * var8.columnGap) * var8.numColumns - var8.columnGap * var39) / var39, 0, var8.verticalPadding) else var8.itemSizeBinding:map(function(p4)
				-- upvalues: calculateRelativeColumnGapModule (copy), var8 (copy)
				return UDim2.new(calculateRelativeColumnGapModule(var8.numColumns, var8.columnGap, p4.X, var8.sideMargin), 0, 0, var8.verticalPadding)
			end)
		end
		t.Layout = reactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = var8.numColumns,
			CellPadding = var41,
			CellSize = uDim2,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		argCheckModule.assert(maxValue >= 1)
		argCheckModule.assert(maxValue <= maxValue_1 and maxValue_1 <= #var8.items)
		
		for i = maxValue, maxValue_1 do
			if i <= #var8.items then
				local var44, var45 = var8.renderItem(var8.items[i], i, UDim2.fromScale(1, 1), math.ceil(i / var8.numColumns))
				t[`{var45}{i % (var16 * var8.numColumns)}`] = var44
			end
		end
		return t
	end, {
		var8.columnGap, var8.numColumns, var8.itemSizeBinding, var12, var14,
		var8.items, var8.renderItem, var8.verticalPadding, var16, minValue,
		if not fFlagCollectionViewMathChanges then var8.sideMargin else nil, maxValue,
		maxValue_1,
		if not fFlagCollectionViewMathChanges then var8.disableRelativeGap else nil
	}))
end)