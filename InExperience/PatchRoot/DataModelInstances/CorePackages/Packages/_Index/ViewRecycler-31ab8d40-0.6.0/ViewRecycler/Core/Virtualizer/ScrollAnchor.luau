local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Virtualizer.ItemSequence)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local typesModule = require(viewRecycler.Core.Types)
local _ = require(viewRecycler.Core.Virtualizer.Viewport)

local function projectIndex(p1, p2)
	-- upvalues: dataSourceChangeTypeModule (ref)
	if p1 == nil or p2.type == dataSourceChangeTypeModule.Reset or p2.type == dataSourceChangeTypeModule.Reorder then
		return nil
	elseif p2.type == dataSourceChangeTypeModule.Insert then
		return if p2.index <= p1 then p1 + #p2.keys else p1
	elseif p2.type == dataSourceChangeTypeModule.Remove then
		return if p1 < p2.index then p1 elseif p2.index + #p2.keys <= p1 then p1 - #p2.keys else nil
	elseif p2.type == dataSourceChangeTypeModule.Move then
		return if p1 == p2.fromIndex then p2.toIndex elseif p2.fromIndex < p1 and p1 <= p2.toIndex then p1 - 1 elseif p2.toIndex <= p1 and p1 < p2.fromIndex then p1 + 1 else p1
	end
end

return function(p1)
	-- upvalues: typesModule (ref), projectIndex (ref), diagnosticsModule (ref), scrollAlignmentModule (ref)
	local viewport = p1.viewport
	local var1 = nil
	
	local function findKeyIndex(p2, p3)
		-- upvalues: p1 (ref)
		local itemSequence = p1.getItemSequence()
		local itemCount = itemSequence.getItemCount()
		
		if p3 ~= nil and p3 >= 1 and (p3 <= itemCount and itemSequence.getItemKey(p3) == p2) then
			return p3
		end
		for i = 1, itemCount do
			if itemSequence.getItemKey(i) ~= p2 then
				continue
			end
			return i
		end
		return nil
	end
	
	local function captureViewport(p4, p5)
		-- upvalues: p1 (ref), viewport (ref), typesModule (copy)
		local itemSequence = p1.getItemSequence()
		local itemCount = itemSequence.getItemCount()
		local length = viewport.getLength()
		
		if itemCount == 0 or length <= 0 then
			return nil
		end
		local isItemMeasured
		local var2 = p5
		
		if var2 == nil then
			local var3 = viewport.visibleRangeAt(p4, p4 + length)
			
			if typesModule.isIndexRangeEmpty(var3) then
				return nil
			end
			var2 = var3.firstIndex
			isItemMeasured = viewport.getLayout().isItemMeasured
			
			if isItemMeasured ~= nil then
				for i = var3.firstIndex, math.min(var3.lastIndex, itemCount) do
					if not isItemMeasured(i) then
						continue
					end
					var2 = i
					break
				end
			end
		end
		local clampedValue = math.clamp(var2, 1, itemCount)
		isItemMeasured = viewport.placedItemLayout(clampedValue)
		
		return {
			kind = "viewport",
			key = itemSequence.getItemKey(clampedValue),
			indexHint = clampedValue,
			viewportCoordinate = isItemMeasured.startOffset - p4,
			itemLength = isItemMeasured.length,
			scrollOffset = p4,
			viewportLength = length
		}
	end
	
	local function captureEvidence()
		-- upvalues: viewport (ref), typesModule (copy), p1 (ref)
		local scrollOffset = viewport.getScrollOffset()
		local length = viewport.getLength()
		local visibleRange = viewport.getVisibleRange()
		
		if typesModule.isIndexRangeEmpty(visibleRange) then
			return nil
		end
		local itemSequence = p1.getItemSequence()
		local t = {}
		
		for i = visibleRange.firstIndex, math.min(visibleRange.lastIndex, itemSequence.getItemCount()) do
			local var4 = viewport.placedItemLayout(i)
			table.insert(t, {
				key = itemSequence.getItemKey(i),
				viewportCoordinate = var4.startOffset - scrollOffset,
				itemLength = var4.length
			})
		end
		return {
			scrollOffset = scrollOffset,
			viewportLength = length,
			items = t
		}
	end
	
	local function prepareDataChange(p6, p7)
		-- upvalues: var1 (write), projectIndex (copy), findKeyIndex (ref), p1 (ref)
		if var1 == nil then return end
		local indexHint = var1.indexHint
		
		for i, v in p6.changes do
			indexHint = projectIndex(indexHint, v)
		end
		var1.indexHint = indexHint
		
		if var1.kind == "itemTarget" or findKeyIndex(var1.key, indexHint) ~= nil then return end
		if p7 ~= nil and p7.viewportLength > 0 then
			for i, v_1 in p7.items do
				local var5
				local key = v_1.key
				local itemSequence = p1.getItemSequence()
				
				for i_2 = 1, itemSequence.getItemCount() do
					if itemSequence.getItemKey(i_2) ~= key then
						continue
					end
					var5 = i_2
					if var5 ~= nil then
						var1 = {
							kind = "viewport",
							key = v_1.key,
							indexHint = var5,
							viewportCoordinate = v_1.viewportCoordinate,
							itemLength = v_1.itemLength,
							scrollOffset = p7.scrollOffset,
							viewportLength = p7.viewportLength
						}
						
						return
					end
				end
				var5 = nil
			end
		end
		var1 = nil
	end
	
	local function resolve(p8)
		-- upvalues: var1 (write), captureViewport (ref), viewport (ref), findKeyIndex (ref), diagnosticsModule (copy), p1 (ref)
		if var1 == nil then
			var1 = captureViewport(viewport.getScrollOffset(), nil)
			
			return nil
		end
		local var6 = findKeyIndex(var1.key, var1.indexHint)
		
		if var6 == nil then
			var1 = captureViewport(viewport.getScrollOffset(), nil)
			
			return nil
		end
		local var7
		local source = p8.source
		local scrollOffset = viewport.getScrollOffset()
		local _ = nil
		
		if var1.kind == "itemTarget" then
			var1.indexHint = var6
			source = diagnosticsModule.ScrollCorrectionSource.ProgrammaticScroll
			var7 = viewport.offsetForItem(var6, var1.alignment) - scrollOffset
		elseif not p1.shouldPreserveUserPosition() then
			var1 = captureViewport(scrollOffset, nil)
			
			return nil
		end
		var1.indexHint = var6
		local startInsetDelta = p8.startInsetDelta or 0
		var7 = viewport.placedItemLayout(var6).startOffset - scrollOffset - var1.viewportCoordinate - startInsetDelta
		
		if p8.preserveStartAnchor and scrollOffset > 0 then
			var7 += startInsetDelta
		end
		var7 = viewport.clamp(scrollOffset + var7) - scrollOffset
		
		if var1.kind == "viewport" then
			local var8 = scrollOffset + (if math.abs(var7) < 1 then 0 else var7)
			local var9 = viewport.placedItemLayout(var6)
			local var10 = var9.startOffset - var8
			local length = viewport.getLength()
			var1 = if var10 < length and var10 + var9.length > 0 then {
				kind = "viewport",
				key = var1.key,
				indexHint = var6,
				viewportCoordinate = var10,
				itemLength = var9.length,
				scrollOffset = var8,
				viewportLength = length
			} else captureViewport(var8, nil)
		end
		return if math.abs(var7) < 1 then nil else { delta = var7, source = source }
	end
	
	return {
		setItemTarget = function(value, p8)
			-- upvalues: p1 (ref), var1 (write), scrollAlignmentModule (copy)
			local itemSequence = p1.getItemSequence()
			local itemCount = itemSequence.getItemCount()
			
			if itemCount == 0 then
				var1 = nil
				
				return
			end
			local clampedValue = math.clamp(value, 1, itemCount)
			var1 = {
				kind = "itemTarget",
				key = itemSequence.getItemKey(clampedValue),
				indexHint = clampedValue,
				alignment = p8 or scrollAlignmentModule.Start
			}
		end,
		setViewport = function(value)
			-- upvalues: var1 (write), captureViewport (ref)
			if var1 ~= nil and var1.kind == "viewport" then
				local var6 = var1.viewportCoordinate - (value - var1.scrollOffset)
				
				if var6 < var1.viewportLength and var6 + var1.itemLength > 0 then
					var1.viewportCoordinate = var6
					var1.scrollOffset = value
					
					return
				end
			end
			var1 = captureViewport(value, nil)
		end,
		observeHost = function(p8)
			-- upvalues: var1 (write), captureViewport (ref)
			if var1 == nil or var1.kind == "viewport" then
				local var6 = var1
				
				if var6 ~= nil and var6.kind == "viewport" then
					local var7 = var6.viewportCoordinate - (p8 - var6.scrollOffset)
					
					if var7 < var6.viewportLength and var7 + var6.itemLength > 0 then
						var6.viewportCoordinate = var7
						var6.scrollOffset = p8
						
						return
					end
				end
				var1 = captureViewport(p8, nil)
			end
		end,
		restore = function(p8, p9)
			-- upvalues: findKeyIndex (ref), var1 (write), captureViewport (ref)
			var1 = captureViewport(p9, if p8.anchorKey == nil then nil else findKeyIndex(p8.anchorKey, p8.anchorIndex))
		end,
		snapshotOffset = function(value)
			-- upvalues: findKeyIndex (ref), viewport (ref)
			if value.anchorKey ~= nil then
				local var6 = findKeyIndex(value.anchorKey, value.anchorIndex)
				
				return if var6 == nil then value.fallbackScrollOffset else viewport.placedItemLayout(var6).startOffset + value.offsetWithinItem
			end
		end,
		preserve = function(p8, p9)
			-- upvalues: prepareDataChange (ref), captureEvidence (ref), resolve (ref)
			if p8.dataSourceChange ~= nil then
				prepareDataChange(p8.dataSourceChange, captureEvidence())
			end
			p9()
			
			return resolve(p8)
		end,
		allowsPolicyOffset = function()
			-- upvalues: var1 (write)
			return if var1 ~= nil then var1.kind == "viewport" else true
		end,
		getAnchoredItem = function()
			-- upvalues: var1 (write), p1 (ref), scrollAlignmentModule (copy)
			if var1 == nil or var1.kind == "viewport" and not p1.shouldPreserveUserPosition() then
				return nil
			end
			local indexHint = var1.indexHint
			
			return if indexHint == nil then nil else table.freeze({
				index = indexHint,
				alignment = if var1.kind == "itemTarget" then var1.alignment else scrollAlignmentModule.Start
			})
		end,
		reset = function()
			-- upvalues: var1 (write)
			var1 = nil
		end
	}
end