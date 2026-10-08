local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Layout)
local reachedThresholdModule = require(viewRecycler.Core.ViewportBehavior.ReachedThreshold)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local typesModule = require(viewRecycler.Core.Types)
local frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })

local function _(p1)
	p1 = p1 or 1
	assert(p1 >= 0 and p1 % 1 == 0, "Virtualizer: overscan must be a non-negative integer")
	
	return p1
end

local _ = function(p1)
	-- upvalues: scrollAlignmentModule (ref)
	assert(if p1 ~= scrollAlignmentModule.Start then if p1 ~= scrollAlignmentModule.Center then p1 == scrollAlignmentModule.End else true else true, "Virtualizer: invalid content alignment")
end

local _ = function(value)
	assert(value >= 0 and value < 1e999, "Virtualizer: content insets must be finite non-negative numbers")
end

local _ = function(p1, p2)
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

return function(p1)
	-- upvalues: scrollAlignmentModule (ref), reachedThresholdModule (ref), frozen (ref), typesModule (ref)
	local layout = p1.layout
	local overscan = p1.overscan or 1
	assert(overscan >= 0 and overscan % 1 == 0, "Virtualizer: overscan must be a non-negative integer")
	local var1 = overscan
	local contentAlignment = p1.contentAlignment or scrollAlignmentModule.Start
	local endThreshold = p1.endThreshold
	local var2 = contentAlignment
	assert(if var2 ~= scrollAlignmentModule.Start then if var2 ~= scrollAlignmentModule.Center then var2 == scrollAlignmentModule.End else true else true, "Virtualizer: invalid content alignment")
	
	if endThreshold ~= nil then
		reachedThresholdModule.validate(endThreshold, "Virtualizer: end threshold")
	end
	local var3 = 0
	local var4 = 0
	local var5 = 0
	local var6 = 0
	local var7 = 0
	local var8 = 0
	local var9 = 0
	local var10 = frozen
	local var11 = frozen
	
	local function _()
		-- upvalues: layout (write), var6 (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local contentLength = layout.getContentLength()
		local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
		
		return var3 + contentLength + var4, var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
	end
	
	local function refresh()
		-- upvalues: var8 (write), var9 (write), layout (write), var6 (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local contentLength = layout.getContentLength()
		local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
		var8 = var3 + contentLength + var4
		var9 = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
	end
	
	local function clamp(value)
		-- upvalues: layout (write), var6 (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local contentLength = layout.getContentLength()
		local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
		local _ = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		
		return math.clamp(value, 0, math.max(0, var3 + contentLength + var4 - var6))
	end
	
	local function scrollTo(p2)
		-- upvalues: var5 (write), layout (write), var6 (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
		assert(math.abs(p2) < 1e999, "Virtualizer: scroll offset must be finite")
		local contentLength = layout.getContentLength()
		local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
		local _ = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var5 = math.clamp(p2, 0, math.max(0, var3 + contentLength + var4 - var6))
		
		return var5
	end
	
	local function visibleRangeAt(p2, p3)
		-- upvalues: var3 (write), var9 (write), var4 (write), layout (write)
		local var12 = p2 + var3 - var9
		
		return layout.getIntersectingIndexRange(var12, math.max(var12, p3 - var4 - var9))
	end
	
	local contentLength = layout.getContentLength()
	local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
	var8 = var3 + contentLength + var4
	var9 = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
	
	return {
		setLayout = function(value)
			-- upvalues: layout (write), var8 (write), var9 (write), var6 (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
			layout = value
			local contentLength = layout.getContentLength()
			local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
			var8 = var3 + contentLength + var4
			var9 = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		end,
		getLayout = function()
			-- upvalues: layout (write)
			return layout
		end,
		setScrollOffset = function(value)
			-- upvalues: var5 (write)
			if var5 == value then
				return false
			end
			var5 = value
			
			return true
		end,
		scrollTo = scrollTo,
		scrollBy = function(p2)
			-- upvalues: var5 (write), layout (write), var6 (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
			assert(math.abs(p2) < 1e999, "Virtualizer: scroll delta must be finite")
			local var12 = var5 + p2
			assert(math.abs(var12) < 1e999, "Virtualizer: scroll offset must be finite")
			local contentLength = layout.getContentLength()
			local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
			local _ = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
			var5 = math.clamp(var12, 0, math.max(0, var3 + contentLength + var4 - var6))
			
			return var5
		end,
		clamp = clamp,
		setSize = function(value, p2)
			-- upvalues: var6 (write), var7 (write), var8 (write), var9 (write), layout (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
			if var6 == value and var7 == p2 then
				return false
			end
			var6 = value
			var7 = p2
			local contentLength = layout.getContentLength()
			local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
			var8 = var3 + contentLength + var4
			var9 = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
			
			return true
		end,
		setOverscan = function(value)
			-- upvalues: var1 (write)
			local value_1 = value or 1
			assert(value_1 >= 0 and value_1 % 1 == 0, "Virtualizer: overscan must be a non-negative integer")
			var1 = value_1
		end,
		setContentAlignment = function(value)
			-- upvalues: scrollAlignmentModule (copy), contentAlignment (write), var8 (write), var9 (write), layout (write), var6 (write), var3 (write), var4 (write)
			local value_1 = value or scrollAlignmentModule.Start
			assert(if value_1 ~= scrollAlignmentModule.Start then if value_1 ~= scrollAlignmentModule.Center then value_1 == scrollAlignmentModule.End else true else true, "Virtualizer: invalid content alignment")
			
			if contentAlignment == value_1 then
				return false
			end
			contentAlignment = value_1
			local contentLength = layout.getContentLength()
			local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
			var8 = var3 + contentLength + var4
			var9 = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
			
			return true
		end,
		getContentAlignment = function()
			-- upvalues: contentAlignment (write)
			return contentAlignment
		end,
		setInsets = function(value, p2)
			-- upvalues: var3 (write), var4 (write), var8 (write), var9 (write), layout (write), var6 (write), contentAlignment (write), scrollAlignmentModule (copy)
			assert(value >= 0 and value < 1e999, "Virtualizer: content insets must be finite non-negative numbers")
			assert(p2 >= 0 and p2 < 1e999, "Virtualizer: content insets must be finite non-negative numbers")
			
			if var3 == value and var4 == p2 then
				return false
			end
			var3 = value
			var4 = p2
			local contentLength = layout.getContentLength()
			local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
			var8 = var3 + contentLength + var4
			var9 = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
			
			return true
		end,
		setEndThreshold = function(value)
			-- upvalues: reachedThresholdModule (copy), endThreshold (write)
			if value ~= nil then
				reachedThresholdModule.validate(value, "Virtualizer: end threshold")
			end
			endThreshold = value
		end,
		refresh = refresh,
		updateRanges = function()
			-- upvalues: var5 (write), var6 (write), var3 (write), var9 (write), var4 (write), layout (write), typesModule (copy), frozen (copy), var1 (write), var10 (write), var11 (write)
			local var12 = var5 + var3 - var9
			local intersectingIndexRange = layout.getIntersectingIndexRange(var12, math.max(var12, var5 + var6 - var4 - var9))
			local var13 = if typesModule.isIndexRangeEmpty(intersectingIndexRange) then frozen else layout.expandIndexRange(intersectingIndexRange, var1, var1)
			local var14 = not (var10.firstIndex == intersectingIndexRange.firstIndex and var10.lastIndex == intersectingIndexRange.lastIndex)
			local var15 = var11
			local var16 = not (var15.firstIndex == var13.firstIndex and var15.lastIndex == var13.lastIndex)
			
			if var14 then
				var10 = table.freeze({
					firstIndex = intersectingIndexRange.firstIndex,
					lastIndex = intersectingIndexRange.lastIndex
				})
			end
			if var16 then
				var11 = table.freeze({
					firstIndex = var13.firstIndex,
					lastIndex = var13.lastIndex
				})
			end
			return var14, var16
		end,
		getScrollOffset = function()
			-- upvalues: var5 (write)
			return var5
		end,
		getLength = function()
			-- upvalues: var6 (write)
			return var6
		end,
		getCrossAxisLength = function()
			-- upvalues: var7 (write)
			return var7
		end,
		getContentLength = function()
			-- upvalues: var8 (write)
			return var8
		end,
		getContentStartOffset = function()
			-- upvalues: var9 (write)
			return var9
		end,
		getVisibleRange = function()
			-- upvalues: var10 (write)
			return var10
		end,
		getMountedRange = function()
			-- upvalues: var11 (write)
			return var11
		end,
		visibleRangeAt = visibleRangeAt,
		placedItemLayout = function(p2)
			-- upvalues: layout (write), var9 (write)
			local itemLayout = layout.getItemLayout(p2)
			
			return {
				startOffset = itemLayout.startOffset + var9,
				length = itemLayout.length,
				crossAxisIndex = itemLayout.crossAxisIndex,
				crossAxisCount = itemLayout.crossAxisCount
			}
		end,
		offsetForItem = function(value, p2)
			-- upvalues: layout (write), var6 (write), var3 (write), var4 (write), contentAlignment (write), scrollAlignmentModule (copy)
			local itemCount = layout.getItemCount()
			
			if itemCount == 0 then
				return 0
			end
			local itemLayout = layout.getItemLayout(math.clamp(value, 1, itemCount))
			local contentLength = layout.getContentLength()
			local maxValue = math.max(0, var6 - var3 - var4 - contentLength)
			local var12 = var3 + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
			
			return math.clamp(if p2 == scrollAlignmentModule.Center then var12 + itemLayout.startOffset + itemLayout.length / 2 - var3 - math.max(0, var6 - var3 - var4) / 2 elseif p2 == scrollAlignmentModule.End then var12 + itemLayout.startOffset + itemLayout.length - var6 + var4 else var12 + itemLayout.startOffset - var3, 0, math.max(0, var3 + contentLength + var4 - var6))
		end,
		scrollState = function(p2)
			-- upvalues: var8 (write), var6 (write), var5 (write), reachedThresholdModule (copy), endThreshold (write)
			local maxValue = math.max(0, var8 - var6 - var5)
			local var12 = var5 <= 0
			local var13 = maxValue <= reachedThresholdModule.resolve(endThreshold, var6, 1)
			
			return if p2 == nil or p2.scrollOffset ~= var5 or (p2.viewportLength ~= var6 or p2.contentLength ~= var8) or (p2.distanceFromEnd ~= maxValue or p2.atStart ~= var12 or p2.atEnd ~= var13) then table.freeze({
				scrollOffset = var5,
				viewportLength = var6,
				contentLength = var8,
				distanceFromEnd = maxValue,
				atStart = var12,
				atEnd = var13
			}) else p2
		end
	}
end