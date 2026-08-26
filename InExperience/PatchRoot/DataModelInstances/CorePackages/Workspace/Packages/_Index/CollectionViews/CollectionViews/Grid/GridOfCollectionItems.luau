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

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), luaAppFixCollectionGridWindowAbsoluteCanvasSize (ref), argCheckModule (ref), fFlagCollectionViewMathChanges (ref), calculateSpacePerItemModule (ref), calculateRelativeColumnGapModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = reactModule.useRef(nil)
	local minValue = math.min(math.ceil(#var1.items / var1.numColumns), var1.maxNumRows)
	local var3 = var1.itemSizeBinding:map(function(p2)
		-- upvalues: minValue (ref), var1 (ref)
		return minValue * (p2.Y + var1.verticalPadding) - var1.verticalPadding
	end)
	local var4, var5 = reactModule.useState(-1)
	local var6, var7 = reactModule.useState(-1)
	local var8, var9 = reactModule.useState(var1.bufferRowsBelowScreen + var1.bufferRowsAboveScreen)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), minValue (ref), var5 (ref), var7 (ref), var9 (ref), luaAppFixCollectionGridWindowAbsoluteCanvasSize (copy)
		local t = {}
		
		if var1.verticalScrollingFrameRef and var1.verticalScrollingFrameRef.current and var2.current then
			local current = var2.current
			local current_1 = var1.verticalScrollingFrameRef.current
			local y = var1.itemSizeBinding:getValue().Y
			local y_1 = current_1.AbsolutePosition.Y
			local y_2 = current_1.AbsoluteWindowSize.Y
			local var10 = math.ceil(y_2 / math.max(1, y + var1.verticalPadding)) + 1
			
			local function _()
				-- upvalues: current (ref), current_1 (ref), y_1 (write)
				return current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
			end
			
			local var11 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
			
			local function updateRowsToRender()
				-- upvalues: current_1 (ref), var1 (copy), minValue (copy), var11 (write), y_2 (write), var10 (write), var5 (copy), var7 (copy)
				local maxValue_1, minValue_1
				local y = current_1.CanvasPosition.Y
				local y_1 = var1.itemSizeBinding:getValue().Y
				local maxValue = math.max(1, y_1 + var1.verticalPadding)
				local var12 = minValue * (y_1 + var1.verticalPadding) - var1.verticalPadding
				local var13 = var11 - y
				local var14 = var1.bufferRowsAboveScreen * maxValue
				local var15 = var1.bufferRowsBelowScreen * maxValue
				local _ = nil
				local _ = nil
				
				if y_2 + var15 < var13 or var13 + var12 < -var14 then
					maxValue_1 = -1
					minValue_1 = -1
				else
					local floored = math.floor(-var13 / maxValue)
					maxValue_1 = math.max(1, floored + 1 - var1.bufferRowsAboveScreen)
					local var16 = var10 + var1.bufferRowsBelowScreen
					minValue_1 = math.min(minValue, maxValue_1 + math.max(1, if floored <= 0 then var16 + floored else var16 + math.min(floored, var1.bufferRowsAboveScreen)) - 1)
				end
				var5(maxValue_1)
				var7(minValue_1)
			end
			
			local function updateWindowParams()
				-- upvalues: var1 (copy), y_1 (write), current_1 (ref), y_2 (write), var11 (write), current (ref), var10 (write), var9 (copy), minValue (copy), updateRowsToRender (ref)
				local maxValue = math.max(1, var1.itemSizeBinding:getValue().Y + var1.verticalPadding)
				y_1 = current_1.AbsolutePosition.Y
				y_2 = current_1.AbsoluteWindowSize.Y
				var11 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y_1
				var10 = math.ceil(y_2 / maxValue) + 1
				var9(math.min(minValue, var10 + var1.bufferRowsBelowScreen + var1.bufferRowsAboveScreen))
				updateRowsToRender()
			end
			
			table.insert(t, current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal(if luaAppFixCollectionGridWindowAbsoluteCanvasSize then "AbsoluteCanvasSize" else "CanvasSize"):Connect(updateWindowParams))
			table.insert(t, current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(updateRowsToRender))
			updateWindowParams()
		else
			var5(1)
			var7(minValue)
			var9(minValue)
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		var2, minValue, var1.itemSizeBinding, var1.verticalScrollingFrameRef,
		var1.verticalPadding, var1.bufferRowsAboveScreen, var1.bufferRowsBelowScreen,
		var1.onViewableItemsChanged
	})
	var6 = math.min(var6, minValue)
	local maxValue = math.max(-1, (var4 - 1) * var1.numColumns + 1)
	local maxValue_1 = math.max(-1, math.min(#var1.items, var6 * var1.numColumns))
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), maxValue (ref), maxValue_1 (ref)
		if var1.onViewableItemsChanged then
			var1.onViewableItemsChanged(maxValue, maxValue_1)
		end
	end, { maxValue, maxValue_1, var1.onViewableItemsChanged })
	local var12 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var6 (write), minValue (ref), var1 (ref), var12 (ref)
		if minValue - var1.thresholdRowsFromBottom <= var6 and var12.current ~= var1.items and var1.onReachedThresholdFromEnd then
			var1.onReachedThresholdFromEnd()
			var12.current = var1.items
		end
	end, {
		var6,
		minValue,
		var1.thresholdRowsFromBottom,
		var1.onReachedThresholdFromEnd,
		var1.items
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = var2,
		Size = var3:map(function(p2)
			return UDim2.new(1, 0, 0, p2)
		end),
		LayoutOrder = var1.LayoutOrder,
		Position = var1.Position
	}, reactModule.useMemo(function()
		-- upvalues: var4 (ref), var6 (write), maxValue (ref), maxValue_1 (ref), var1 (ref), minValue (ref), argCheckModule (copy), reactModule (copy), fFlagCollectionViewMathChanges (copy), calculateSpacePerItemModule (copy), calculateRelativeColumnGapModule (copy), var8 (ref)
		local t = {}
		
		if var4 <= 0 or var6 < var4 then
			return nil
		elseif maxValue <= 0 or maxValue_1 < maxValue then
			return nil
		elseif var1.numColumns <= 0 or minValue - var4 < 0 then
			return nil
		end
		argCheckModule.assert(var4 >= 1)
		argCheckModule.assert(var4 <= var6 and var6 <= minValue)
		
		if var4 > 1 then
			local var13 = var4 - 1
			t.Padding = reactModule.createElement("UIPadding", {
				PaddingTop = var1.itemSizeBinding:map(function(p2)
					-- upvalues: var13 (ref), var1 (copy)
					return UDim.new(0, var13 * (p2.Y + var1.verticalPadding))
				end)
			})
		end
		local uDim2, var14
		local var15 = minValue - var4 + 1
		argCheckModule.assert(var15 >= 1)
		argCheckModule.assert(var1.numColumns >= 1)
		local _ = nil
		local _ = nil
		
		if fFlagCollectionViewMathChanges then
			local var16 = calculateSpacePerItemModule(var1.numColumns, var1.columnGap)
			local var17 = calculateSpacePerItemModule(var15, var1.verticalPadding)
			uDim2 = UDim2.new(1 / var1.numColumns, -var16.gapOffsetPerItem, 1 / var15, -var17.gapOffsetPerItem)
			var14 = UDim2.new(0, var16.adjustedGap, 0, var17.adjustedGap)
		else
			local var18 = var1.numColumns - 1
			uDim2 = UDim2.new(1 / var1.numColumns, math.floor(-(var18 / var1.numColumns) * var1.columnGap), 1 / var15, math.floor(-((var15 - 1) / var15) * var1.verticalPadding))
			var14 = if var1.disableRelativeGap then UDim2.new(0, var1.columnGap + (math.floor(var18 / var1.numColumns * var1.columnGap) * var1.numColumns - var1.columnGap * var18) / var18, 0, var1.verticalPadding) else var1.itemSizeBinding:map(function(p2)
				-- upvalues: calculateRelativeColumnGapModule (copy), var1 (copy)
				return UDim2.new(calculateRelativeColumnGapModule(var1.numColumns, var1.columnGap, p2.X, var1.sideMargin), 0, 0, var1.verticalPadding)
			end)
		end
		t.Layout = reactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = var1.numColumns,
			CellPadding = var14,
			CellSize = uDim2,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		argCheckModule.assert(maxValue >= 1)
		argCheckModule.assert(maxValue <= maxValue_1 and maxValue_1 <= #var1.items)
		
		for i = maxValue, maxValue_1 do
			if i <= #var1.items then
				local var19, var20 = var1.renderItem(var1.items[i], i, UDim2.fromScale(1, 1), math.ceil(i / var1.numColumns))
				t[`{var20}{i % (var8 * var1.numColumns)}`] = var19
			end
		end
		return t
	end, {
		var1.columnGap, var1.numColumns, var1.itemSizeBinding, var4, var6,
		var1.items, var1.renderItem, var1.verticalPadding, var8, minValue,
		if not fFlagCollectionViewMathChanges then var1.sideMargin else nil, maxValue,
		maxValue_1,
		if not fFlagCollectionViewMathChanges then var1.disableRelativeGap else nil
	}))
end)