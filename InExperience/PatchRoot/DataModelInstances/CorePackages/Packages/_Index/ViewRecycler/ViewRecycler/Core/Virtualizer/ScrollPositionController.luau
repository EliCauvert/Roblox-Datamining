local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local typesModule = require(viewRecycler.Core.Types)

return function(p1)
	-- upvalues: dataSourceChangeTypeModule (ref), typesModule (ref), diagnosticsModule (ref), scrollAlignmentModule (ref)
	local var1 = nil
	
	local function findKeyIndex(p2, p3)
		-- upvalues: p1 (ref)
		local itemCount = p1.getItemCount()
		
		if p3 ~= nil and p3 >= 1 and (p3 <= itemCount and p1.getItemKey(p3) == p2) then
			return p3
		end
		for i = 1, itemCount do
			if p1.getItemKey(i) ~= p2 then
				continue
			end
			return i
		end
		return nil
	end
	
	local function projectIndex(p4, p5)
		-- upvalues: dataSourceChangeTypeModule (copy)
		if p4 == nil or p5.type == dataSourceChangeTypeModule.Reset or p5.type == dataSourceChangeTypeModule.Reorder then
			return nil
		elseif p5.type == dataSourceChangeTypeModule.Insert then
			return if p5.index <= p4 then p4 + #p5.keys else p4
		elseif p5.type == dataSourceChangeTypeModule.Remove then
			return if p4 < p5.index then p4 elseif p5.index + #p5.keys <= p4 then p4 - #p5.keys else nil
		elseif p5.type == dataSourceChangeTypeModule.Move then
			return if p4 == p5.fromIndex then p5.toIndex elseif p5.fromIndex < p4 and p4 <= p5.toIndex then p4 - 1 elseif p5.toIndex <= p4 and p4 < p5.fromIndex then p4 + 1 else p4
		end
	end
	
	local function captureViewportAnchor(p4, p5)
		-- upvalues: p1 (ref), typesModule (copy)
		local itemCount = p1.getItemCount()
		local viewportLength = p1.getViewportLength()
		
		if itemCount == 0 or viewportLength <= 0 then
			return nil
		end
		local firstIndex
		local _ = nil
		
		if p5 == nil then
			local visibleRange = p1.getVisibleRange(p4, p4 + viewportLength)
			
			if typesModule.isIndexRangeEmpty(visibleRange) then
				return nil
			end
			firstIndex = visibleRange.firstIndex
		else
			firstIndex = p5
		end
		local clampedValue = math.clamp(firstIndex, 1, itemCount)
		clampedValue = p1.getItemLayout(clampedValue)
		
		return {
			kind = "viewportPosition",
			key = p1.getItemKey(clampedValue),
			indexHint = clampedValue,
			viewportCoordinate = clampedValue.startOffset - p4,
			itemLength = clampedValue.length,
			scrollOffset = p4,
			viewportLength = viewportLength
		}
	end
	
	local function prepareDataChange(p4, p5)
		-- upvalues: var1 (write), projectIndex (ref), findKeyIndex (ref), p1 (ref)
		if var1 == nil then return end
		local indexHint = var1.indexHint
		
		for i, v in p4.changes do
			indexHint = projectIndex(indexHint, v)
		end
		var1 = if var1.kind == "itemAlignment" then {
			kind = "itemAlignment",
			key = var1.key,
			indexHint = indexHint,
			alignment = var1.alignment
		} else {
			kind = "viewportPosition",
			key = var1.key,
			indexHint = indexHint,
			viewportCoordinate = var1.viewportCoordinate,
			itemLength = var1.itemLength,
			scrollOffset = var1.scrollOffset,
			viewportLength = var1.viewportLength
		}
		local var2 = var1
		
		if findKeyIndex(var2.key, var2.indexHint) ~= nil or var2.kind == "itemAlignment" then return end
		if p5 == nil or p5.viewportLength <= 0 then
			var1 = nil
			
			return
		end
		for i, v_1 in p5.visibleItems do
			local var3
			local key = v_1.key
			
			for i_2 = 1, p1.getItemCount() do
				if p1.getItemKey(i_2) ~= key then
					continue
				end
				var3 = i_2
				if var3 ~= nil then
					var1 = {
						kind = "viewportPosition",
						key = v_1.key,
						indexHint = var3,
						viewportCoordinate = v_1.viewportCoordinate,
						itemLength = v_1.itemLength,
						scrollOffset = p5.scrollOffset,
						viewportLength = p5.viewportLength
					}
					
					return
				end
			end
			var3 = nil
		end
		var1 = nil
	end
	
	local function resolve(p6)
		-- upvalues: var1 (write), captureViewportAnchor (ref), p1 (ref), findKeyIndex (ref), diagnosticsModule (copy)
		if var1 == nil then
			var1 = captureViewportAnchor(p1.getScrollOffset(), nil)
			
			return nil
		end
		local var4 = findKeyIndex(var1.key, var1.indexHint)
		
		if var4 == nil then
			var1 = captureViewportAnchor(p1.getScrollOffset(), nil)
			
			return nil
		end
		local var5
		local source = p6.source
		local _ = nil
		
		if var1.kind == "itemAlignment" then
			var1.indexHint = var4
			source = diagnosticsModule.ScrollCorrectionSource.ProgrammaticScroll
			var5 = p1.getScrollOffsetForItem(var4, var1.alignment) - p1.getScrollOffset()
		elseif not p1.shouldPreserveUserPosition() then
			var1 = captureViewportAnchor(p1.getScrollOffset(), nil)
			
			return nil
		end
		var1.indexHint = var4
		local startInsetDelta = p6.startInsetDelta or 0
		var5 = p1.getItemLayout(var4).startOffset - p1.getScrollOffset() - var1.viewportCoordinate - startInsetDelta
		
		if p6.preserveStartAnchor and p1.getScrollOffset() > 0 then
			var5 += startInsetDelta
		end
		local scrollOffset = p1.getScrollOffset()
		var5 = p1.clampScrollOffset(scrollOffset + var5) - scrollOffset
		
		if var1.kind == "viewportPosition" then
			local itemLayout = p1.getItemLayout(var4)
			local var6 = scrollOffset + (if math.abs(var5) < 1 then 0 else var5)
			local var7 = itemLayout.startOffset - var6
			local viewportLength = p1.getViewportLength()
			var1 = if var7 < viewportLength and var7 + itemLayout.length > 0 then {
				kind = "viewportPosition",
				key = var1.key,
				indexHint = var4,
				viewportCoordinate = var7,
				itemLength = itemLayout.length,
				scrollOffset = var6,
				viewportLength = viewportLength
			} else captureViewportAnchor(var6, nil)
		end
		return if math.abs(var5) < 1 then nil else { delta = var5, source = source }
	end
	
	return {
		setItemAnchor = function(value, p6)
			-- upvalues: p1 (ref), var1 (write), scrollAlignmentModule (copy)
			local itemCount = p1.getItemCount()
			
			if itemCount == 0 then
				var1 = nil
				
				return
			end
			local clampedValue = math.clamp(value, 1, itemCount)
			var1 = {
				kind = "itemAlignment",
				key = p1.getItemKey(clampedValue),
				indexHint = clampedValue,
				alignment = p6 or scrollAlignmentModule.Start
			}
		end,
		setViewportAnchor = function(value, p6)
			-- upvalues: var1 (write), captureViewportAnchor (ref)
			if var1 ~= nil and var1.kind == "viewportPosition" then
				local var4 = var1.viewportCoordinate - (value - var1.scrollOffset)
				
				if var4 < var1.viewportLength and var4 + var1.itemLength > 0 then
					var1.viewportCoordinate = var4
					var1.scrollOffset = value
					
					return
				end
			end
			var1 = captureViewportAnchor(value, if p6 == nil then nil else p6())
		end,
		restoreSnapshotAnchor = function(p6, p7)
			-- upvalues: findKeyIndex (ref), var1 (write), captureViewportAnchor (ref)
			var1 = captureViewportAnchor(p7, if p6.anchorKey == nil then nil else findKeyIndex(p6.anchorKey, p6.anchorIndex))
		end,
		reconcileHostOffset = function(value)
			-- upvalues: var1 (write), captureViewportAnchor (ref)
			if var1 == nil or var1.kind == "viewportPosition" then
				local var4 = var1
				
				if var4 ~= nil and var4.kind == "viewportPosition" then
					local var5 = var4.viewportCoordinate - (value - var4.scrollOffset)
					
					if var5 < var4.viewportLength and var5 + var4.itemLength > 0 then
						var4.viewportCoordinate = var5
						var4.scrollOffset = value
						
						return
					end
				end
				var1 = captureViewportAnchor(value, nil)
			end
		end,
		applyGeometryChange = function(p6, p7)
			-- upvalues: prepareDataChange (ref), resolve (ref)
			if p6.dataSourceChange ~= nil then
				prepareDataChange(p6.dataSourceChange, p6.anchorEvidence)
			end
			p7()
			
			return resolve(p6)
		end,
		allowsExternalPositionApplication = function()
			-- upvalues: var1 (write)
			return if var1 ~= nil then var1.kind == "viewportPosition" else true
		end,
		reset = function()
			-- upvalues: var1 (write)
			var1 = nil
		end,
		captureSnapshot = function()
			-- upvalues: p1 (ref), var1 (write), typesModule (copy)
			local scrollOffset = p1.getScrollOffset()
			
			if var1 ~= nil and var1.kind == "viewportPosition" and math.abs(var1.scrollOffset - scrollOffset) < 0.5 then
				return {
					anchorKey = var1.key,
					anchorIndex = var1.indexHint,
					offsetWithinItem = -var1.viewportCoordinate,
					fallbackScrollOffset = scrollOffset
				}
			end
			local viewportLength = p1.getViewportLength()
			
			if viewportLength > 0 then
				local visibleRange = p1.getVisibleRange(scrollOffset, scrollOffset + viewportLength)
				
				if typesModule.isIndexRangeEmpty(visibleRange) then
					return {
						anchorKey = nil,
						anchorIndex = nil,
						offsetWithinItem = 0,
						fallbackScrollOffset = scrollOffset
					}
				else
					local firstIndex = visibleRange.firstIndex
					
					return {
						anchorKey = p1.getItemKey(firstIndex),
						anchorIndex = firstIndex,
						offsetWithinItem = scrollOffset - p1.getItemLayout(firstIndex).startOffset,
						fallbackScrollOffset = scrollOffset
					}
				end
			end
		end,
		getSnapshotOffset = function(value)
			-- upvalues: findKeyIndex (ref), p1 (ref)
			if value.anchorKey ~= nil then
				local var4 = findKeyIndex(value.anchorKey, value.anchorIndex)
				
				return if var4 == nil then value.fallbackScrollOffset else p1.getItemLayout(var4).startOffset + value.offsetWithinItem
			end
		end,
		destroy = function()
			-- upvalues: var1 (write)
			var1 = nil
		end
	}
end