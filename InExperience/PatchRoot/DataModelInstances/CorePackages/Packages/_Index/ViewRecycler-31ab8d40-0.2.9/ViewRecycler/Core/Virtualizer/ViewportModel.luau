local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Layout)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)
local ScrollDirectionModule = require(ViewRecycler.Core.Enums.ScrollDirection)
local SignalsModule = require(ViewRecycler.Parent.Signals)
local _ = require(ViewRecycler.Core.Types)

local function _(Center)
	-- upvalues: ScrollAlignmentModule (copy)
	assert(Center == ScrollAlignmentModule.Start or (Center == ScrollAlignmentModule.Center or Center == ScrollAlignmentModule.End), "ViewportModel: invalid content alignment")
end

local _ = function(p1: number)
	assert(p1 >= 0 and p1 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
end

local _ = function(p1: number)
	assert(p1 >= 0 and p1 < 1e999, "ViewportModel: end threshold must be a finite non-negative number")
end

return function(p1)
	-- upvalues: ScrollAlignmentModule (copy), ScrollDirectionModule (copy), SignalsModule (copy)
	local ContentAlignment = p1.contentAlignment or ScrollAlignmentModule.Start
	local ContentInsetStart = p1.contentInsetStart or 0
	local ContentInsetEnd = p1.contentInsetEnd or 0
	local EndThreshold = p1.endThreshold or 1
	local Center = ContentAlignment
	local ViewportSize1: boolean = Center == ScrollAlignmentModule.Start or (Center == ScrollAlignmentModule.Center or Center == ScrollAlignmentModule.End)
	assert(ViewportSize1, "ViewportModel: invalid content alignment")
	local ContentInsetStart1: number = ContentInsetStart
	ViewportSize1 = ContentInsetStart1 >= 0 and ContentInsetStart1 < 1e999
	assert(ViewportSize1, "ViewportModel: content insets must be finite non-negative numbers")
	local ContentInsetEnd1: number = ContentInsetEnd
	ViewportSize1 = ContentInsetEnd1 >= 0 and ContentInsetEnd1 < 1e999
	assert(ViewportSize1, "ViewportModel: content insets must be finite non-negative numbers")
	local EndThreshold1: number = EndThreshold
	ViewportSize1 = EndThreshold1 >= 0 and EndThreshold1 < 1e999
	assert(ViewportSize1, "ViewportModel: end threshold must be a finite non-negative number")
	local ScrollOffset = 0
	local ViewportSize = 0
	ViewportSize1 = 0
	local None = ScrollDirectionModule.None
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	
	local function _()
		-- upvalues: p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ViewportSize (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
		local ContentLength = p1.getLayout().getContentLength()
		local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
		
		return ContentInsetStart + ContentLength + ContentInsetEnd, ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
	end
	
	local function refreshContentMetrics()
		-- upvalues: p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ViewportSize (ref), ContentAlignment (ref), ScrollAlignmentModule (upval), Signal2 (copy), Signal2_1 (copy)
		local ContentLength = p1.getLayout().getContentLength()
		local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
		local NewContentInsetStart = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
		Signal2(ContentInsetStart + ContentLength + ContentInsetEnd)
		Signal2_1(NewContentInsetStart)
	end
	
	local function setScrollOffset(Value): boolean
		-- upvalues: ScrollOffset (ref), None (ref), ScrollDirectionModule (upval)
		if ScrollOffset == Value then
			return false
		else
			None = if ScrollOffset < Value then ScrollDirectionModule.Forward else ScrollDirectionModule.Backward
			ScrollOffset = Value
			
			return true
		end
	end
	
	local function clampScrollOffset(Value: number): number
		-- upvalues: p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ViewportSize (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
		local ContentLength = p1.getLayout().getContentLength()
		local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
		local _ = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
		
		return (math.clamp(Value, 0, (math.max(0, ContentInsetStart + ContentLength + ContentInsetEnd - ViewportSize))))
	end
	
	local function scrollToOffset(Value: number): number
		-- upvalues: p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ViewportSize (ref), ContentAlignment (ref), ScrollAlignmentModule (upval), ScrollOffset (ref), None (ref), ScrollDirectionModule (upval)
		assert(math.abs(Value) < 1e999, "ViewportModel: scroll offset must be finite")
		local ContentLength = p1.getLayout().getContentLength()
		local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
		local _ = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
		local ClampedValue = math.clamp(Value, 0, (math.max(0, ContentInsetStart + ContentLength + ContentInsetEnd - ViewportSize)))
		
		if ScrollOffset == ClampedValue then
			return ClampedValue
		else
			None = if ScrollOffset < ClampedValue then ScrollDirectionModule.Forward else ScrollDirectionModule.Backward
			ScrollOffset = ClampedValue
			
			return ClampedValue
		end
	end
	
	local function setViewportSize(Value, Value1): boolean
		-- upvalues: ViewportSize (ref), ViewportSize1 (ref), p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ContentAlignment (ref), ScrollAlignmentModule (upval), Signal2 (copy), Signal2_1 (copy)
		if ViewportSize == Value and ViewportSize1 == Value1 then
			return false
		else
			ViewportSize = Value
			ViewportSize1 = Value1
			local ContentLength = p1.getLayout().getContentLength()
			local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
			local NewContentInsetStart = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			Signal2(ContentInsetStart + ContentLength + ContentInsetEnd)
			Signal2_1(NewContentInsetStart)
			
			return true
		end
	end
	
	local function setContentAlignment(p2): boolean
		-- upvalues: ScrollAlignmentModule (upval), ContentAlignment (ref), p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ViewportSize (ref), Signal2 (copy), Signal2_1 (copy)
		local P7 = p2 or ScrollAlignmentModule.Start
		assert(P7 == ScrollAlignmentModule.Start or (P7 == ScrollAlignmentModule.Center or P7 == ScrollAlignmentModule.End), "ViewportModel: invalid content alignment")
		
		if ContentAlignment == P7 then
			return false
		else
			ContentAlignment = P7
			local ContentLength = p1.getLayout().getContentLength()
			local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
			local NewContentInsetStart = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			Signal2(ContentInsetStart + ContentLength + ContentInsetEnd)
			Signal2_1(NewContentInsetStart)
			
			return true
		end
	end
	
	local function setContentInsets(Value: number, Value1: number): boolean
		-- upvalues: ContentInsetStart (ref), ContentInsetEnd (ref), p1 (copy), ViewportSize (ref), ContentAlignment (ref), ScrollAlignmentModule (upval), Signal2 (copy), Signal2_1 (copy)
		assert(Value >= 0 and Value < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
		assert(Value1 >= 0 and Value1 < 1e999, "ViewportModel: content insets must be finite non-negative numbers")
		
		if ContentInsetStart == Value and ContentInsetEnd == Value1 then
			return false
		else
			ContentInsetStart = Value
			ContentInsetEnd = Value1
			local ContentLength: number = p1.getLayout().getContentLength()
			local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
			local NewContentInsetStart = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			Signal2(ContentInsetStart + ContentLength + ContentInsetEnd)
			Signal2_1(NewContentInsetStart)
			
			return true
		end
	end
	
	local function getLayoutViewport(p2, p3)
		-- upvalues: ScrollOffset (ref), ViewportSize (ref), Signal1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref)
		local P10 = p2 or ScrollOffset
		local P11 = p3 or P10 + ViewportSize
		local SignalResult = Signal1(false)
		local PDelta = P10 + ContentInsetStart - SignalResult
		
		return PDelta, (math.max(PDelta, P11 - ContentInsetEnd - SignalResult))
	end
	
	local function getVisibleRange(p2, p3)
		-- upvalues: ScrollOffset (ref), ViewportSize (ref), Signal1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), p1 (copy)
		local P12 = p2 or ScrollOffset
		local P13 = p3 or P12 + ViewportSize
		local SignalResult = Signal1(false)
		local PDelta = P12 + ContentInsetStart - SignalResult
		
		return p1.getLayout().getIntersectingIndexRange(PDelta, (math.max(PDelta, P13 - ContentInsetEnd - SignalResult)))
	end
	
	local function getPlacedItemLayout(p2)
		-- upvalues: p1 (copy), Signal1 (copy)
		local ItemLayout = p1.getLayout().getItemLayout(p2)
		
		return {
			startOffset = ItemLayout.startOffset + Signal1(false),
			length = ItemLayout.length,
			crossAxisIndex = ItemLayout.crossAxisIndex,
			crossAxisCount = ItemLayout.crossAxisCount
		}
	end
	
	local function getScrollState()
		-- upvalues: Signal (copy), ViewportSize (ref), ScrollOffset (ref), EndThreshold (ref)
		local SignalResult = Signal(false)
		local Largest = math.max(0, SignalResult - ViewportSize - ScrollOffset)
		
		return {
			scrollOffset = ScrollOffset,
			viewportLength = ViewportSize,
			contentLength = SignalResult,
			distanceFromEnd = Largest,
			atStart = ScrollOffset <= 0,
			atEnd = Largest <= EndThreshold
		}
	end
	
	local function getScrollOffsetForItem(Value: number, Center): number
		-- upvalues: p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ViewportSize (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
		local Layout = p1.getLayout()
		local ItemCount: number = Layout.getItemCount()
		
		if ItemCount == 0 then
			return 0
		else
			local ItemLayout = Layout.getItemLayout((math.clamp(Value, 1, ItemCount)))
			local ContentLength = p1.getLayout().getContentLength()
			local NewContentInsetStart = ContentInsetStart + ContentLength + ContentInsetEnd
			local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
			local NewContentInsetStart1 = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			local Largest1 = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd)
			
			return (math.clamp(if Center == ScrollAlignmentModule.Center then NewContentInsetStart1 + ItemLayout.startOffset + ItemLayout.length / 2 - ContentInsetStart - Largest1 / 2 elseif Center == ScrollAlignmentModule.End then NewContentInsetStart1 + ItemLayout.startOffset + ItemLayout.length - ViewportSize + ContentInsetEnd else NewContentInsetStart1 + ItemLayout.startOffset - ContentInsetStart, 0, (math.max(0, NewContentInsetStart - ViewportSize))))
		end
	end
	
	local ContentLength: number = p1.getLayout().getContentLength()
	local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
	local NewContentInsetStart = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
	Signal2(ContentInsetStart + ContentLength + ContentInsetEnd)
	Signal2_1(NewContentInsetStart)
	
	return {
		setScrollOffset = setScrollOffset,
		clampScrollOffset = clampScrollOffset,
		scrollToOffset = scrollToOffset,
		scrollBy = function(Value: number): number
			-- upvalues: ScrollOffset (ref), p1 (copy), ContentInsetStart (ref), ContentInsetEnd (ref), ViewportSize (ref), ContentAlignment (ref), ScrollAlignmentModule (upval), None (ref), ScrollDirectionModule (upval)
			assert(math.abs(Value) < 1e999, "ViewportModel: scroll delta must be finite")
			local NewScrollOffset = ScrollOffset + Value
			assert(math.abs(NewScrollOffset) < 1e999, "ViewportModel: scroll offset must be finite")
			local ContentLength = p1.getLayout().getContentLength()
			local Largest = math.max(0, ViewportSize - ContentInsetStart - ContentInsetEnd - ContentLength)
			local _ = ContentInsetStart + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			local ClampedValue = math.clamp(NewScrollOffset, 0, (math.max(0, ContentInsetStart + ContentLength + ContentInsetEnd - ViewportSize)))
			
			if ScrollOffset ~= ClampedValue then
				None = if ScrollOffset < ClampedValue then ScrollDirectionModule.Forward else ScrollDirectionModule.Backward
				ScrollOffset = ClampedValue
			end
			return ClampedValue
		end,
		setViewportSize = setViewportSize,
		setContentAlignment = setContentAlignment,
		setContentInsets = setContentInsets,
		setEndThreshold = function(p2)
			-- upvalues: EndThreshold (ref)
			local P16 = p2 or 1
			assert(P16 >= 0 and P16 < 1e999, "ViewportModel: end threshold must be a finite non-negative number")
			EndThreshold = P16
		end,
		refreshContentMetrics = refreshContentMetrics,
		getScrollOffset = function()
			-- upvalues: ScrollOffset (ref)
			return ScrollOffset
		end,
		getScrollDirection = function()
			-- upvalues: None (ref)
			return None
		end,
		getScrollAxisLength = function()
			-- upvalues: ViewportSize (ref)
			return ViewportSize
		end,
		getCrossAxisLength = function()
			-- upvalues: ViewportSize1 (ref)
			return ViewportSize1
		end,
		getContentInsets = function()
			-- upvalues: ContentInsetStart (ref), ContentInsetEnd (ref)
			return { start = ContentInsetStart, finish = ContentInsetEnd }
		end,
		getLayoutViewport = getLayoutViewport,
		getVisibleRange = getVisibleRange,
		getPlacedItemLayout = getPlacedItemLayout,
		getScrollState = getScrollState,
		getScrollOffsetForItem = getScrollOffsetForItem,
		contentLength = Signal,
		contentStartOffset = Signal1
	}
end