local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local calculateRelativeColumnGapModule = require(collectionViews.Grid.calculateRelativeColumnGap)
local calculateSpacePerItemModule = require(collectionViews.calculateSpacePerItem)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges
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

return reactModule.memo(function(p0) --[[ line: 82 | named "GridOfCollectionItems" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), argCheckModule (ref), fFlagCollectionViewMathChanges (ref), calculateSpacePerItemModule (ref), calculateRelativeColumnGapModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8 = reactModule.useRef(nil)
	local minValue = math.min(math.ceil(#var7.items / var7.numColumns), var7.maxNumRows)
	local var10 = var7.itemSizeBinding:map(function(p1) --[[ line: 90 ]]
		-- upvalues: minValue (ref), var7 (ref)
		return minValue * (p1.Y + var7.verticalPadding) - var7.verticalPadding
	end)
	local var11, var12 = reactModule.useState(-1)
	local var13, var14 = reactModule.useState(-1)
	local var15, var16 = reactModule.useState(var7.bufferRowsBelowScreen + var7.bufferRowsAboveScreen)
	reactModule.useEffect(function() --[[ line: 103 ]]
		-- upvalues: var7 (ref), var8 (ref), minValue (ref), var12 (ref), var14 (ref), var16 (ref)
		local t = {}
		
		if var7.verticalScrollingFrameRef and var7.verticalScrollingFrameRef.current and var8.current then
			local current = var8.current
			local current_1 = var7.verticalScrollingFrameRef.current
			local y = var7.itemSizeBinding:getValue().Y
			local y_1 = current_1.AbsolutePosition.Y
			local y_2 = current_1.AbsoluteWindowSize.Y
			local var21 = math.ceil(y_2 / math.max(1, y + var7.verticalPadding)) + 1
			
			local function _() --[[ line: 120 | named "calculateOffsetOfGrid" ]]
				-- upvalues: current (ref), current_1 (ref), y_1 (write)
				return current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
			end
			
			local var22 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
			
			local function updateRowsToRender() --[[ line: 127 ]]
				-- upvalues: current_1 (ref), var7 (copy), minValue (copy), var22 (write), y_2 (write), var21 (write), var12 (copy), var14 (copy)
				local maxValue_1, minValue_1
				local y = current_1.CanvasPosition.Y
				local y_1 = var7.itemSizeBinding:getValue().Y
				local maxValue = math.max(1, y_1 + var7.verticalPadding)
				local var26 = minValue * (y_1 + var7.verticalPadding) - var7.verticalPadding
				local var27 = var22 - y
				local var28 = var7.bufferRowsAboveScreen * maxValue
				local var29 = var7.bufferRowsBelowScreen * maxValue
				local _ = nil
				local _ = nil
				
				if y_2 + var29 < var27 or var27 + var26 < -var28 then
					maxValue_1 = -1
					minValue_1 = -1
				else
					local floored = math.floor(-var27 / maxValue)
					maxValue_1 = math.max(1, floored + 1 - var7.bufferRowsAboveScreen)
					local var32 = var21 + var7.bufferRowsBelowScreen
					minValue_1 = math.min(minValue, maxValue_1 + math.max(1, if floored <= 0 then var32 + floored else var32 + math.min(floored, var7.bufferRowsAboveScreen)) - 1)
				end
				var12(maxValue_1)
				var14(minValue_1)
			end
			
			local function updateWindowParams() --[[ line: 172 ]]
				-- upvalues: var7 (copy), y_1 (write), current_1 (ref), y_2 (write), var22 (write), current (ref), var21 (write), var16 (copy), minValue (copy), updateRowsToRender (ref)
				local maxValue = math.max(1, var7.itemSizeBinding:getValue().Y + var7.verticalPadding)
				y_1 = current_1.AbsolutePosition.Y
				y_2 = current_1.AbsoluteWindowSize.Y
				var22 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
				var21 = math.ceil(y_2 / maxValue) + 1
				var16(math.min(minValue, var21 + var7.bufferRowsBelowScreen + var7.bufferRowsAboveScreen))
				updateRowsToRender()
			end
			
			table.insert(t, current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal("CanvasSize"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(updateRowsToRender))
			updateWindowParams()
		else
			var12(1)
			var14(minValue)
			var16(minValue)
		end
		return function() --[[ line: 213 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		var8, minValue, var7.itemSizeBinding, var7.verticalScrollingFrameRef,
		var7.verticalPadding, var7.bufferRowsAboveScreen, var7.bufferRowsBelowScreen,
		var7.onViewableItemsChanged
	})
	var13 = math.min(var13, minValue)
	local maxValue = math.max(-1, (var11 - 1) * var7.numColumns + 1)
	local maxValue_1 = math.max(-1, math.min(#var7.items, var13 * var7.numColumns))
	reactModule.useEffect(function() --[[ line: 238 ]]
		-- upvalues: var7 (ref), maxValue (ref), maxValue_1 (ref)
		if var7.onViewableItemsChanged then
			var7.onViewableItemsChanged(maxValue, maxValue_1)
		end
	end, { maxValue, maxValue_1, var7.onViewableItemsChanged })
	local var19 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 246 ]]
		-- upvalues: var13 (write), minValue (ref), var7 (ref), var19 (ref)
		if minValue - var7.thresholdRowsFromBottom <= var13 and var19.current ~= var7.items and var7.onReachedThresholdFromEnd then
			var7.onReachedThresholdFromEnd()
			var19.current = var7.items
		end
	end, {
		var13,
		minValue,
		var7.thresholdRowsFromBottom,
		var7.onReachedThresholdFromEnd,
		var7.items
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = var8,
		Size = var10:map(function(p2) --[[ line: 371 ]]
			return UDim2.new(1, 0, 0, p2)
		end),
		LayoutOrder = var7.LayoutOrder,
		Position = var7.Position
	}, reactModule.useMemo(function() --[[ line: 265 ]]
		-- upvalues: var11 (ref), var13 (write), maxValue (ref), maxValue_1 (ref), var7 (ref), minValue (ref), argCheckModule (copy), reactModule (copy), fFlagCollectionViewMathChanges (copy), calculateSpacePerItemModule (copy), calculateRelativeColumnGapModule (copy), var15 (ref)
		local t = {}
		
		if var11 <= 0 or var13 < var11 then
			return nil
		elseif maxValue <= 0 or maxValue_1 < maxValue then
			return nil
		elseif var7.numColumns <= 0 or minValue - var11 < 0 then
			return nil
		end
		argCheckModule.assert(var11 >= 1)
		argCheckModule.assert(var11 <= var13 and var13 <= minValue)
		
		if var11 > 1 then
			local var36 = var11 - 1
			t.Padding = reactModule.createElement("UIPadding", {
				PaddingTop = var7.itemSizeBinding:map(function(p3) --[[ line: 283 ]]
					-- upvalues: var36 (ref), var7 (copy)
					return UDim.new(0, var36 * (p3.Y + var7.verticalPadding))
				end)
			})
		end
		local uDim2, var40
		local var37 = minValue - var11 + 1
		argCheckModule.assert(var37 >= 1)
		argCheckModule.assert(var7.numColumns >= 1)
		local _ = nil
		local _ = nil
		
		if fFlagCollectionViewMathChanges then
			local var41 = calculateSpacePerItemModule(var7.numColumns, var7.columnGap)
			local var42 = calculateSpacePerItemModule(var37, var7.verticalPadding)
			uDim2 = UDim2.new(1 / var7.numColumns, -var41.gapOffsetPerItem, 1 / var37, -var42.gapOffsetPerItem)
			var40 = UDim2.new(0, var41.adjustedGap, 0, var42.adjustedGap)
		else
			local var38 = var7.numColumns - 1
			uDim2 = UDim2.new(1 / var7.numColumns, math.floor(-(var38 / var7.numColumns) * var7.columnGap), 1 / var37, math.floor(-((var37 - 1) / var37) * var7.verticalPadding))
			var40 = if var7.disableRelativeGap then UDim2.new(0, var7.columnGap + (math.floor(var38 / var7.numColumns * var7.columnGap) * var7.numColumns - var7.columnGap * var38) / var38, 0, var7.verticalPadding) else var7.itemSizeBinding:map(function(p4) --[[ line: 321 ]]
				-- upvalues: calculateRelativeColumnGapModule (copy), var7 (copy)
				return UDim2.new(calculateRelativeColumnGapModule(var7.numColumns, var7.columnGap, p4.X, var7.sideMargin), 0, 0, var7.verticalPadding)
			end)
		end
		t.Layout = reactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = var7.numColumns,
			CellPadding = var40,
			CellSize = uDim2,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		argCheckModule.assert(maxValue >= 1)
		argCheckModule.assert(maxValue <= maxValue_1 and maxValue_1 <= #var7.items)
		
		for i = maxValue, maxValue_1 do
			if i <= #var7.items then
				local var43, var44 = var7.renderItem(var7.items[i], i, UDim2.fromScale(1, 1), math.ceil(i / var7.numColumns))
				t[`{var44}{i % (var15 * var7.numColumns)}`] = var43
			end
		end
		return t
	end, {
		var7.columnGap, var7.numColumns, var7.itemSizeBinding, var11, var13,
		var7.items, var7.renderItem, var7.verticalPadding, var15, minValue,
		if not fFlagCollectionViewMathChanges then var7.sideMargin else nil, maxValue,
		maxValue_1,
		if not fFlagCollectionViewMathChanges then var7.disableRelativeGap else nil
	}))
end)