local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Layout)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local signalsModule = require(viewRecycler.Parent.Signals)
local _ = require(viewRecycler.Core.Types)

local function _(p0)
	-- upvalues: scrollAlignmentModule (ref)
	assert(if p0 ~= scrollAlignmentModule.Start then if p0 ~= scrollAlignmentModule.Center then p0 == scrollAlignmentModule.End else true else true, "ViewportModel: invalid content alignment")
end

local _ = function(value)
	assert(value >= 0 and value < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
end

local _ = function(p1)
	assert(p1 >= 0 and p1 < 1e999, "ViewportModel: end threshold must be a finite non-negative number")
end

return function(p2)
	-- upvalues: scrollAlignmentModule (ref), signalsModule (ref)
	local contentAlignment = p2.contentAlignment or scrollAlignmentModule.Start
	local contentInsetStart = p2.contentInsetStart or 0
	local contentInsetEnd = p2.contentInsetEnd or 0
	local endThreshold = p2.endThreshold or 1
	local var7 = contentAlignment
	assert(if var7 ~= scrollAlignmentModule.Start then if var7 ~= scrollAlignmentModule.Center then var7 == scrollAlignmentModule.End else true else true, "ViewportModel: invalid content alignment")
	local var8 = contentInsetStart
	assert(var8 >= 0 and var8 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
	local var9 = contentInsetEnd
	assert(var9 >= 0 and var9 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
	local var10 = endThreshold
	assert(var10 >= 0 and var10 < 1e999, "ViewportModel: end threshold must be a finite non-negative number")
	local var11 = 0
	local var12 = 0
	local var13 = 0
	local var14 = "none"
	local var15, var16 = signalsModule.createSignal(0)
	local var17, var18 = signalsModule.createSignal(0)
	
	local function _()
		-- upvalues: p2 (ref), contentInsetStart (write), contentInsetEnd (write), var12 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local contentLength = p2.getLayout().getContentLength()
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		
		return contentInsetStart + contentLength + contentInsetEnd, contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
	end
	
	local function refreshContentMetrics()
		-- upvalues: p2 (ref), contentInsetStart (write), contentInsetEnd (write), var12 (write), contentAlignment (write), scrollAlignmentModule (copy), var16 (ref), var18 (ref)
		local contentLength = p2.getLayout().getContentLength()
		local var38 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		local var40 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var16(var38)
		var18(var40)
	end
	
	local function setScrollOffset(value)
		-- upvalues: var11 (write), var14 (write)
		if var11 == value then
			return false
		end
		var14 = if var11 < value then "forward" else "backward"
		var11 = value
		
		return true
	end
	
	local function clampScrollOffset(value)
		-- upvalues: p2 (ref), contentInsetStart (write), contentInsetEnd (write), var12 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local contentLength = p2.getLayout().getContentLength()
		local var42 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		local _ = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		
		return math.clamp(value, 0, math.max(0, var42 - var12))
	end
	
	local function scrollToOffset(value)
		-- upvalues: p2 (ref), contentInsetStart (write), contentInsetEnd (write), var12 (write), contentAlignment (write), scrollAlignmentModule (copy), var11 (write), var14 (write)
		assert(math.abs(value) < 1e999, "ViewportModel: scroll offset must be finite")
		local contentLength = p2.getLayout().getContentLength()
		local var45 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		local _ = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		local clampedValue = math.clamp(value, 0, math.max(0, var45 - var12))
		
		if var11 == clampedValue then
			return clampedValue
		end
		var14 = if var11 < clampedValue then "forward" else "backward"
		var11 = clampedValue
		
		return clampedValue
	end
	
	local function setViewportSize(value, p3)
		-- upvalues: var12 (write), var13 (write), p2 (ref), contentInsetStart (write), contentInsetEnd (write), contentAlignment (write), scrollAlignmentModule (copy), var16 (ref), var18 (ref)
		if var12 == value and var13 == p3 then
			return false
		end
		var12 = value
		var13 = p3
		local contentLength = p2.getLayout().getContentLength()
		local var49 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		local var51 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var16(var49)
		var18(var51)
		
		return true
	end
	
	local function setContentAlignment(value)
		-- upvalues: scrollAlignmentModule (copy), contentAlignment (write), p2 (ref), contentInsetStart (write), contentInsetEnd (write), var12 (write), var16 (ref), var18 (ref)
		local value_1 = value or scrollAlignmentModule.Start
		assert(if value_1 ~= scrollAlignmentModule.Start then if value_1 ~= scrollAlignmentModule.Center then value_1 == scrollAlignmentModule.End else true else true, "ViewportModel: invalid content alignment")
		
		if contentAlignment == value_1 then
			return false
		end
		contentAlignment = value_1
		local contentLength = p2.getLayout().getContentLength()
		local var54 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		local var56 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var16(var54)
		var18(var56)
		
		return true
	end
	
	local function setContentInsets(value, p4)
		-- upvalues: contentInsetStart (write), contentInsetEnd (write), p2 (ref), var12 (write), contentAlignment (write), scrollAlignmentModule (copy), var16 (ref), var18 (ref)
		assert(value >= 0 and value < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
		assert(p4 >= 0 and p4 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
		
		if contentInsetStart == value and contentInsetEnd == p4 then
			return false
		end
		contentInsetStart = value
		contentInsetEnd = p4
		local contentLength = p2.getLayout().getContentLength()
		local var58 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		local var60 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var16(var58)
		var18(var60)
		
		return true
	end
	
	local function getLayoutViewport(p5, p6)
		-- upvalues: var11 (write), var12 (write), var17 (ref), contentInsetStart (write), contentInsetEnd (write)
		p5 = p5 or var11
		p6 = p6 or p5 + var12
		local var63 = var17(false)
		local var64 = p5 + contentInsetStart - var63
		
		return var64, math.max(var64, p6 - contentInsetEnd - var63)
	end
	
	local function getVisibleRange(p7, p8)
		-- upvalues: var11 (write), var12 (write), var17 (ref), contentInsetStart (write), contentInsetEnd (write), p2 (ref)
		p7 = p7 or var11
		p8 = p8 or p7 + var12
		local var67 = var17(false)
		local var68 = p7 + contentInsetStart - var67
		
		return p2.getLayout().getIntersectingIndexRange(var68, math.max(var68, p8 - contentInsetEnd - var67))
	end
	
	local function getPlacedItemLayout(p9)
		-- upvalues: p2 (ref), var17 (ref)
		local itemLayout = p2.getLayout().getItemLayout(p9)
		
		return {
			startOffset = itemLayout.startOffset + var17(false),
			length = itemLayout.length,
			crossAxisIndex = itemLayout.crossAxisIndex,
			crossAxisCount = itemLayout.crossAxisCount
		}
	end
	
	local function getScrollState()
		-- upvalues: var15 (ref), var12 (write), var11 (write), endThreshold (write)
		local var70 = var15(false)
		local maxValue = math.max(0, var70 - var12 - var11)
		
		return {
			scrollOffset = var11,
			viewportLength = var12,
			contentLength = var70,
			distanceFromEnd = maxValue,
			atStart = var11 <= 0,
			atEnd = maxValue <= endThreshold
		}
	end
	
	local function getScrollOffsetForItem(value, p10)
		-- upvalues: p2 (ref), contentInsetStart (write), contentInsetEnd (write), var12 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local layout = p2.getLayout()
		local itemCount = layout.getItemCount()
		
		if itemCount == 0 then
			return 0
		end
		local itemLayout = layout.getItemLayout(math.clamp(value, 1, itemCount))
		local contentLength = p2.getLayout().getContentLength()
		local var76 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
		local var78 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		
		return math.clamp(if p10 == scrollAlignmentModule.Center then var78 + itemLayout.startOffset + itemLayout.length / 2 - contentInsetStart - math.max(0, var12 - contentInsetStart - contentInsetEnd) / 2 elseif p10 == scrollAlignmentModule.End then var78 + itemLayout.startOffset + itemLayout.length - var12 + contentInsetEnd else var78 + itemLayout.startOffset - contentInsetStart, 0, math.max(0, var76 - var12))
	end
	
	local contentLength = p2.getLayout().getContentLength()
	local var32 = contentInsetStart + contentLength + contentInsetEnd
	local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
	local var34 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
	var16(var32)
	var18(var34)
	
	return {
		setScrollOffset = setScrollOffset,
		clampScrollOffset = clampScrollOffset,
		scrollToOffset = scrollToOffset,
		scrollBy = function(p11)
			-- upvalues: var11 (write), p2 (ref), contentInsetStart (write), contentInsetEnd (write), var12 (write), contentAlignment (write), scrollAlignmentModule (copy), var14 (write)
			assert(math.abs(p11) < 1e999, "ViewportModel: scroll delta must be finite")
			local var79 = var11 + p11
			assert(math.abs(var79) < 1e999, "ViewportModel: scroll offset must be finite")
			local contentLength = p2.getLayout().getContentLength()
			local var81 = contentInsetStart + contentLength + contentInsetEnd
			local maxValue = math.max(0, var12 - contentInsetStart - contentInsetEnd - contentLength)
			local _ = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
			local clampedValue = math.clamp(var79, 0, math.max(0, var81 - var12))
			
			if var11 ~= clampedValue then
				var14 = if var11 < clampedValue then "forward" else "backward"
				var11 = clampedValue
			end
			return clampedValue
		end,
		setViewportSize = setViewportSize,
		setContentAlignment = setContentAlignment,
		setContentInsets = setContentInsets,
		setEndThreshold = function(value)
			-- upvalues: endThreshold (write)
			local value_1 = value or 1
			assert(value_1 >= 0 and value_1 < 1e999, "ViewportModel: end threshold must be a finite non-negative number")
			endThreshold = value_1
		end,
		refreshContentMetrics = refreshContentMetrics,
		getScrollOffset = function()
			-- upvalues: var11 (write)
			return var11
		end,
		getScrollDirection = function()
			-- upvalues: var14 (write)
			return var14
		end,
		getScrollAxisLength = function()
			-- upvalues: var12 (write)
			return var12
		end,
		getCrossAxisLength = function()
			-- upvalues: var13 (write)
			return var13
		end,
		getContentInsets = function()
			-- upvalues: contentInsetStart (write), contentInsetEnd (write)
			return { start = contentInsetStart, finish = contentInsetEnd }
		end,
		getLayoutViewport = getLayoutViewport,
		getVisibleRange = getVisibleRange,
		getPlacedItemLayout = getPlacedItemLayout,
		getScrollState = getScrollState,
		getScrollOffsetForItem = getScrollOffsetForItem,
		contentLength = var15,
		contentStartOffset = var17
	}
end