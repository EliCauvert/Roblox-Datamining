local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Layout)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local scrollDirectionModule = require(viewRecycler.Core.Enums.ScrollDirection)
local signalsModule = require(viewRecycler.Parent.Signals)
local _ = require(viewRecycler.Core.Types)

local function _(p1)
	-- upvalues: scrollAlignmentModule (ref)
	assert(if p1 ~= scrollAlignmentModule.Start then if p1 ~= scrollAlignmentModule.Center then p1 == scrollAlignmentModule.End else true else true, "ViewportModel: invalid content alignment")
end

local _ = function(value)
	assert(value >= 0 and value < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
end

local _ = function(p1)
	assert(p1 >= 0 and p1 < 1e999, "ViewportModel: end threshold must be a finite non-negative number")
end

return function(p1)
	-- upvalues: scrollAlignmentModule (ref), scrollDirectionModule (ref), signalsModule (ref)
	local contentAlignment = p1.contentAlignment or scrollAlignmentModule.Start
	local contentInsetStart = p1.contentInsetStart or 0
	local contentInsetEnd = p1.contentInsetEnd or 0
	local endThreshold = p1.endThreshold or 1
	local var1 = contentAlignment
	assert(if var1 ~= scrollAlignmentModule.Start then if var1 ~= scrollAlignmentModule.Center then var1 == scrollAlignmentModule.End else true else true, "ViewportModel: invalid content alignment")
	local var2 = contentInsetStart
	assert(var2 >= 0 and var2 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
	local var3 = contentInsetEnd
	assert(var3 >= 0 and var3 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
	local var4 = endThreshold
	assert(var4 >= 0 and var4 < 1e999, "ViewportModel: end threshold must be a finite non-negative number")
	local var5 = 0
	local var6 = 0
	local var7 = 0
	local none = scrollDirectionModule.None
	local var8, var9 = signalsModule.createSignal(0)
	local var10, var11 = signalsModule.createSignal(0)
	
	local function _()
		-- upvalues: p1 (ref), contentInsetStart (write), contentInsetEnd (write), var6 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local contentLength = p1.getLayout().getContentLength()
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		
		return contentInsetStart + contentLength + contentInsetEnd, contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
	end
	
	local function refreshContentMetrics()
		-- upvalues: p1 (ref), contentInsetStart (write), contentInsetEnd (write), var6 (write), contentAlignment (write), scrollAlignmentModule (copy), var9 (ref), var11 (ref)
		local contentLength = p1.getLayout().getContentLength()
		local var12 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		local var13 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var9(var12)
		var11(var13)
	end
	
	local function setScrollOffset(value)
		-- upvalues: var5 (write), none (write), scrollDirectionModule (copy)
		if var5 == value then
			return false
		end
		none = if var5 < value then scrollDirectionModule.Forward else scrollDirectionModule.Backward
		var5 = value
		
		return true
	end
	
	local function clampScrollOffset(value)
		-- upvalues: p1 (ref), contentInsetStart (write), contentInsetEnd (write), var6 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local contentLength = p1.getLayout().getContentLength()
		local var12 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		local _ = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		
		return math.clamp(value, 0, math.max(0, var12 - var6))
	end
	
	local function scrollToOffset(value)
		-- upvalues: p1 (ref), contentInsetStart (write), contentInsetEnd (write), var6 (write), contentAlignment (write), scrollAlignmentModule (copy), var5 (write), none (write), scrollDirectionModule (copy)
		assert(math.abs(value) < 1e999, "ViewportModel: scroll offset must be finite")
		local contentLength = p1.getLayout().getContentLength()
		local var12 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		local _ = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		local clampedValue = math.clamp(value, 0, math.max(0, var12 - var6))
		
		if var5 == clampedValue then
			return clampedValue
		end
		none = if var5 < clampedValue then scrollDirectionModule.Forward else scrollDirectionModule.Backward
		var5 = clampedValue
		
		return clampedValue
	end
	
	local function setViewportSize(value, p2)
		-- upvalues: var6 (write), var7 (write), p1 (ref), contentInsetStart (write), contentInsetEnd (write), contentAlignment (write), scrollAlignmentModule (copy), var9 (ref), var11 (ref)
		if var6 == value and var7 == p2 then
			return false
		end
		var6 = value
		var7 = p2
		local contentLength = p1.getLayout().getContentLength()
		local var12 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		local var13 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var9(var12)
		var11(var13)
		
		return true
	end
	
	local function setContentAlignment(value)
		-- upvalues: scrollAlignmentModule (copy), contentAlignment (write), p1 (ref), contentInsetStart (write), contentInsetEnd (write), var6 (write), var9 (ref), var11 (ref)
		local value_1 = value or scrollAlignmentModule.Start
		assert(if value_1 ~= scrollAlignmentModule.Start then if value_1 ~= scrollAlignmentModule.Center then value_1 == scrollAlignmentModule.End else true else true, "ViewportModel: invalid content alignment")
		
		if contentAlignment == value_1 then
			return false
		end
		contentAlignment = value_1
		local contentLength = p1.getLayout().getContentLength()
		local var12 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		local var13 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var9(var12)
		var11(var13)
		
		return true
	end
	
	local function setContentInsets(value, p2)
		-- upvalues: contentInsetStart (write), contentInsetEnd (write), p1 (ref), var6 (write), contentAlignment (write), scrollAlignmentModule (copy), var9 (ref), var11 (ref)
		assert(value >= 0 and value < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
		assert(p2 >= 0 and p2 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
		
		if contentInsetStart == value and contentInsetEnd == p2 then
			return false
		end
		contentInsetStart = value
		contentInsetEnd = p2
		local contentLength = p1.getLayout().getContentLength()
		local var12 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		local var13 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		var9(var12)
		var11(var13)
		
		return true
	end
	
	local function getLayoutViewport(p2, p3)
		-- upvalues: var5 (write), var6 (write), var10 (ref), contentInsetStart (write), contentInsetEnd (write)
		p2 = p2 or var5
		p3 = p3 or p2 + var6
		local var12 = var10(false)
		local var13 = p2 + contentInsetStart - var12
		
		return var13, math.max(var13, p3 - contentInsetEnd - var12)
	end
	
	local function getVisibleRange(p2, p3)
		-- upvalues: var5 (write), var6 (write), var10 (ref), contentInsetStart (write), contentInsetEnd (write), p1 (ref)
		p2 = p2 or var5
		p3 = p3 or p2 + var6
		local var12 = var10(false)
		local var13 = p2 + contentInsetStart - var12
		
		return p1.getLayout().getIntersectingIndexRange(var13, math.max(var13, p3 - contentInsetEnd - var12))
	end
	
	local function getPlacedItemLayout(p2)
		-- upvalues: p1 (ref), var10 (ref)
		local itemLayout = p1.getLayout().getItemLayout(p2)
		
		return {
			startOffset = itemLayout.startOffset + var10(false),
			length = itemLayout.length,
			crossAxisIndex = itemLayout.crossAxisIndex,
			crossAxisCount = itemLayout.crossAxisCount
		}
	end
	
	local function getScrollState()
		-- upvalues: var8 (ref), var6 (write), var5 (write), endThreshold (write)
		local var12 = var8(false)
		local maxValue = math.max(0, var12 - var6 - var5)
		
		return {
			scrollOffset = var5,
			viewportLength = var6,
			contentLength = var12,
			distanceFromEnd = maxValue,
			atStart = var5 <= 0,
			atEnd = maxValue <= endThreshold
		}
	end
	
	local function getScrollOffsetForItem(value, p2)
		-- upvalues: p1 (ref), contentInsetStart (write), contentInsetEnd (write), var6 (write), contentAlignment (write), scrollAlignmentModule (copy)
		local layout = p1.getLayout()
		local itemCount = layout.getItemCount()
		
		if itemCount == 0 then
			return 0
		end
		local itemLayout = layout.getItemLayout(math.clamp(value, 1, itemCount))
		local contentLength = p1.getLayout().getContentLength()
		local var12 = contentInsetStart + contentLength + contentInsetEnd
		local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
		local var13 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
		
		return math.clamp(if p2 == scrollAlignmentModule.Center then var13 + itemLayout.startOffset + itemLayout.length / 2 - contentInsetStart - math.max(0, var6 - contentInsetStart - contentInsetEnd) / 2 elseif p2 == scrollAlignmentModule.End then var13 + itemLayout.startOffset + itemLayout.length - var6 + contentInsetEnd else var13 + itemLayout.startOffset - contentInsetStart, 0, math.max(0, var12 - var6))
	end
	
	local contentLength = p1.getLayout().getContentLength()
	local var12 = contentInsetStart + contentLength + contentInsetEnd
	local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
	local var13 = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
	var9(var12)
	var11(var13)
	
	return {
		setScrollOffset = setScrollOffset,
		clampScrollOffset = clampScrollOffset,
		scrollToOffset = scrollToOffset,
		scrollBy = function(p2)
			-- upvalues: var5 (write), p1 (ref), contentInsetStart (write), contentInsetEnd (write), var6 (write), contentAlignment (write), scrollAlignmentModule (copy), none (write), scrollDirectionModule (copy)
			assert(math.abs(p2) < 1e999, "ViewportModel: scroll delta must be finite")
			local var14 = var5 + p2
			assert(math.abs(var14) < 1e999, "ViewportModel: scroll offset must be finite")
			local contentLength = p1.getLayout().getContentLength()
			local var15 = contentInsetStart + contentLength + contentInsetEnd
			local maxValue = math.max(0, var6 - contentInsetStart - contentInsetEnd - contentLength)
			local _ = contentInsetStart + (if contentAlignment == scrollAlignmentModule.End then maxValue elseif contentAlignment == scrollAlignmentModule.Center then maxValue / 2 else 0)
			local clampedValue = math.clamp(var14, 0, math.max(0, var15 - var6))
			
			if var5 ~= clampedValue then
				none = if var5 < clampedValue then scrollDirectionModule.Forward else scrollDirectionModule.Backward
				var5 = clampedValue
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
			-- upvalues: var5 (write)
			return var5
		end,
		getScrollDirection = function()
			-- upvalues: none (write)
			return none
		end,
		getScrollAxisLength = function()
			-- upvalues: var6 (write)
			return var6
		end,
		getCrossAxisLength = function()
			-- upvalues: var7 (write)
			return var7
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
		contentLength = var8,
		contentStartOffset = var10
	}
end