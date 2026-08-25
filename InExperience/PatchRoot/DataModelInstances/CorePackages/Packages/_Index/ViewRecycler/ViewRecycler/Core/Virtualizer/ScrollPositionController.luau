local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local typesModule = require(viewRecycler.Core.Types)

return function(p0)
	-- upvalues: dataSourceChangeTypeModule (ref), typesModule (ref), diagnosticsModule (ref), scrollAlignmentModule (ref)
	local var5 = nil
	
	local function findKeyIndex(p1, p2)
		-- upvalues: p0 (ref)
		local itemCount = p0.getItemCount()
		
		if p2 ~= nil and p2 >= 1 and (p2 <= itemCount and p0.getItemKey(p2) == p1) then
			return p2
		end
		for i = 1, itemCount do
			if p0.getItemKey(i) ~= p1 then
				continue
			end
			return i
		end
		return nil
	end
	
	local function projectIndex(p3, p4)
		-- upvalues: dataSourceChangeTypeModule (copy)
		if p3 == nil or p4.type == dataSourceChangeTypeModule.Reset or p4.type == dataSourceChangeTypeModule.Reorder then
			return nil
		elseif p4.type == dataSourceChangeTypeModule.Insert then
			return if p4.index <= p3 then p3 + #p4.keys else p3
		elseif p4.type == dataSourceChangeTypeModule.Remove then
			return if p3 < p4.index then p3 elseif p4.index + #p4.keys <= p3 then p3 - #p4.keys else nil
		elseif p4.type == dataSourceChangeTypeModule.Move then
			return if p3 == p4.fromIndex then p4.toIndex elseif p4.fromIndex < p3 and p3 <= p4.toIndex then p3 - 1 elseif p4.toIndex <= p3 and p3 < p4.fromIndex then p3 + 1 else p3
		end
	end
	
	local function captureViewportAnchor(p5, p6)
		-- upvalues: p0 (ref), typesModule (copy)
		local itemCount = p0.getItemCount()
		local viewportLength = p0.getViewportLength()
		
		if itemCount == 0 or viewportLength <= 0 then
			return nil
		end
		local firstIndex
		local _ = nil
		
		if p6 == nil then
			local visibleRange = p0.getVisibleRange(p5, p5 + viewportLength)
			
			if typesModule.isIndexRangeEmpty(visibleRange) then
				return nil
			end
			firstIndex = visibleRange.firstIndex
		else
			firstIndex = p6
		end
		local clampedValue = math.clamp(firstIndex, 1, itemCount)
		clampedValue = p0.getItemLayout(clampedValue)
		
		return {
			kind = "viewportPosition",
			key = p0.getItemKey(clampedValue),
			indexHint = clampedValue,
			viewportCoordinate = clampedValue.startOffset - p5,
			itemLength = clampedValue.length,
			scrollOffset = p5,
			viewportLength = viewportLength
		}
	end
	
	local function prepareDataChange(p7, p8)
		-- upvalues: var5 (write), projectIndex (ref), findKeyIndex (ref), p0 (ref)
		if var5 == nil then return end
		local indexHint = var5.indexHint
		
		for i, v in p7.changes do
			indexHint = projectIndex(indexHint, v)
		end
		var5 = if var5.kind == "itemAlignment" then {
			kind = "itemAlignment",
			key = var5.key,
			indexHint = indexHint,
			alignment = var5.alignment
		} else {
			kind = "viewportPosition",
			key = var5.key,
			indexHint = indexHint,
			viewportCoordinate = var5.viewportCoordinate,
			itemLength = var5.itemLength,
			scrollOffset = var5.scrollOffset,
			viewportLength = var5.viewportLength
		}
		local var16 = var5
		
		if findKeyIndex(var16.key, var16.indexHint) ~= nil or var16.kind == "itemAlignment" then return end
		if p8 == nil or p8.viewportLength <= 0 then
			var5 = nil
			
			return
		end
		for i, v_1 in p8.visibleItems do
			local var17
			local key = v_1.key
			
			for i_2 = 1, p0.getItemCount() do
				if p0.getItemKey(i_2) ~= key then
					continue
				end
				var17 = i_2
				if var17 ~= nil then
					var5 = {
						kind = "viewportPosition",
						key = v_1.key,
						indexHint = var17,
						viewportCoordinate = v_1.viewportCoordinate,
						itemLength = v_1.itemLength,
						scrollOffset = p8.scrollOffset,
						viewportLength = p8.viewportLength
					}
					
					return
				end
			end
			var17 = nil
		end
		var5 = nil
	end
	
	local function resolve(p9)
		-- upvalues: var5 (write), captureViewportAnchor (ref), p0 (ref), findKeyIndex (ref), diagnosticsModule (copy)
		if var5 == nil then
			var5 = captureViewportAnchor(p0.getScrollOffset(), nil)
			
			return nil
		end
		local var18 = findKeyIndex(var5.key, var5.indexHint)
		
		if var18 == nil then
			var5 = captureViewportAnchor(p0.getScrollOffset(), nil)
			
			return nil
		end
		local var19
		local source = p9.source
		local _ = nil
		
		if var5.kind == "itemAlignment" then
			var5.indexHint = var18
			source = diagnosticsModule.ScrollCorrectionSource.ProgrammaticScroll
			var19 = p0.getScrollOffsetForItem(var18, var5.alignment) - p0.getScrollOffset()
		elseif not p0.shouldPreserveUserPosition() then
			var5 = captureViewportAnchor(p0.getScrollOffset(), nil)
			
			return nil
		end
		var5.indexHint = var18
		local startInsetDelta = p9.startInsetDelta or 0
		var19 = p0.getItemLayout(var18).startOffset - p0.getScrollOffset() - var5.viewportCoordinate - startInsetDelta
		
		if p9.preserveStartAnchor and p0.getScrollOffset() > 0 then
			var19 += startInsetDelta
		end
		local scrollOffset = p0.getScrollOffset()
		var19 = p0.clampScrollOffset(scrollOffset + var19) - scrollOffset
		
		if var5.kind == "viewportPosition" then
			local itemLayout = p0.getItemLayout(var18)
			local var23 = scrollOffset + (if math.abs(var19) < 1 then 0 else var19)
			local var24 = itemLayout.startOffset - var23
			local viewportLength = p0.getViewportLength()
			var5 = if var24 < viewportLength and var24 + itemLayout.length > 0 then {
				kind = "viewportPosition",
				key = var5.key,
				indexHint = var18,
				viewportCoordinate = var24,
				itemLength = itemLayout.length,
				scrollOffset = var23,
				viewportLength = viewportLength
			} else captureViewportAnchor(var23, nil)
		end
		return if math.abs(var19) < 1 then nil else { delta = var19, source = source }
	end
	
	return {
		setItemAnchor = function(value, p10)
			-- upvalues: p0 (ref), var5 (write), scrollAlignmentModule (copy)
			local itemCount = p0.getItemCount()
			
			if itemCount == 0 then
				var5 = nil
				
				return
			end
			local clampedValue = math.clamp(value, 1, itemCount)
			var5 = {
				kind = "itemAlignment",
				key = p0.getItemKey(clampedValue),
				indexHint = clampedValue,
				alignment = p10 or scrollAlignmentModule.Start
			}
		end,
		setViewportAnchor = function(value, p11)
			-- upvalues: var5 (write), captureViewportAnchor (ref)
			if var5 ~= nil and var5.kind == "viewportPosition" then
				local var28 = var5.viewportCoordinate - (value - var5.scrollOffset)
				
				if var28 < var5.viewportLength and var28 + var5.itemLength > 0 then
					var5.viewportCoordinate = var28
					var5.scrollOffset = value
					
					return
				end
			end
			var5 = captureViewportAnchor(value, if p11 == nil then nil else p11())
		end,
		restoreSnapshotAnchor = function(p12, p13)
			-- upvalues: findKeyIndex (ref), var5 (write), captureViewportAnchor (ref)
			var5 = captureViewportAnchor(p13, if p12.anchorKey == nil then nil else findKeyIndex(p12.anchorKey, p12.anchorIndex))
		end,
		reconcileHostOffset = function(value)
			-- upvalues: var5 (write), captureViewportAnchor (ref)
			if var5 == nil or var5.kind == "viewportPosition" then
				local var29 = var5
				
				if var29 ~= nil and var29.kind == "viewportPosition" then
					local var30 = var29.viewportCoordinate - (value - var29.scrollOffset)
					
					if var30 < var29.viewportLength and var30 + var29.itemLength > 0 then
						var29.viewportCoordinate = var30
						var29.scrollOffset = value
						
						return
					end
				end
				var5 = captureViewportAnchor(value, nil)
			end
		end,
		applyGeometryChange = function(p14, p15)
			-- upvalues: prepareDataChange (ref), resolve (ref)
			if p14.dataSourceChange ~= nil then
				prepareDataChange(p14.dataSourceChange, p14.anchorEvidence)
			end
			p15()
			
			return resolve(p14)
		end,
		allowsExternalPositionApplication = function()
			-- upvalues: var5 (write)
			return if var5 ~= nil then var5.kind == "viewportPosition" else true
		end,
		reset = function()
			-- upvalues: var5 (write)
			var5 = nil
		end,
		captureSnapshot = function()
			-- upvalues: p0 (ref), var5 (write), typesModule (copy)
			local scrollOffset = p0.getScrollOffset()
			
			if var5 ~= nil and var5.kind == "viewportPosition" and math.abs(var5.scrollOffset - scrollOffset) < 0.5 then
				return {
					anchorKey = var5.key,
					anchorIndex = var5.indexHint,
					offsetWithinItem = -var5.viewportCoordinate,
					fallbackScrollOffset = scrollOffset
				}
			end
			local viewportLength = p0.getViewportLength()
			
			if viewportLength > 0 then
				local visibleRange = p0.getVisibleRange(scrollOffset, scrollOffset + viewportLength)
				
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
						anchorKey = p0.getItemKey(firstIndex),
						anchorIndex = firstIndex,
						offsetWithinItem = scrollOffset - p0.getItemLayout(firstIndex).startOffset,
						fallbackScrollOffset = scrollOffset
					}
				end
			end
		end,
		getSnapshotOffset = function(value)
			-- upvalues: findKeyIndex (ref), p0 (ref)
			if value.anchorKey ~= nil then
				local var34 = findKeyIndex(value.anchorKey, value.anchorIndex)
				
				return if var34 == nil then value.fallbackScrollOffset else p0.getItemLayout(var34).startOffset + value.offsetWithinItem
			end
		end,
		destroy = function()
			-- upvalues: var5 (write)
			var5 = nil
		end
	}
end