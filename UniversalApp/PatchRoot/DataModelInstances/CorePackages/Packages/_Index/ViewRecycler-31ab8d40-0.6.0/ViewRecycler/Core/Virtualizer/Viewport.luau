local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Layout)
local ReachedThresholdModule = require(ViewRecycler.Core.ViewportBehavior.ReachedThreshold)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)
local TypesModule = require(ViewRecycler.Core.Types)
local Frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })

local function _(p1) --[[ Line: 48 | Named "resolveOverscan" ]]
	local P0 = p1 or 1
	assert(P0 >= 0 and P0 % 1 == 0, "Virtualizer: overscan must be a non-negative integer")
	
	return P0
end

local _ = function(Center) --[[ Line: 54 | Named "validateAlignment" ]]
	-- upvalues: ScrollAlignmentModule (copy)
	assert(Center == ScrollAlignmentModule.Start or (Center == ScrollAlignmentModule.Center or Center == ScrollAlignmentModule.End), "Virtualizer: invalid content alignment")
end

local _ = function(p1: number) --[[ Line: 61 | Named "validateInset" ]]
	assert(p1 >= 0 and p1 < 1e999, "Virtualizer: content insets must be finite non-negative numbers")
end

local _ = function(p1, p2): boolean --[[ Line: 65 | Named "sameRange" ]]
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

return function(p1) --[[ Line: 69 | Named "createViewport" ]]
	-- upvalues: ScrollAlignmentModule (copy), ReachedThresholdModule (copy), Frozen (copy), TypesModule (copy)
	local Layout = p1.layout
	local Overscan = p1.overscan or 1
	local Insets1: boolean = Overscan >= 0 and Overscan % 1 == 0
	assert(Insets1, "Virtualizer: overscan must be a non-negative integer")
	local Overscan1: number = Overscan
	local ContentAlignment = p1.contentAlignment or ScrollAlignmentModule.Start
	local EndThreshold = p1.endThreshold
	local Center = ContentAlignment
	local ClampedValue: boolean = Center == ScrollAlignmentModule.Start or (Center == ScrollAlignmentModule.Center or Center == ScrollAlignmentModule.End)
	assert(ClampedValue, "Virtualizer: invalid content alignment")
	
	if EndThreshold ~= nil then
		ReachedThresholdModule.validate(EndThreshold, "Virtualizer: end threshold")
	end
	local Insets = 0
	Insets1 = 0
	ClampedValue = 0
	local Size = 0
	local Size1 = 0
	local ContentLength = 0
	local v1 = 0
	local Frozen1 = Frozen
	local Frozen2 = Frozen
	
	local function _() --[[ Line: 88 | Named "metrics" ]]
		-- upvalues: Layout (ref), Size (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
		local ContentLength = Layout.getContentLength()
		local Largest = math.max(0, Size - Insets - Insets1 - ContentLength)
		
		return Insets + ContentLength + Insets1, Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
	end
	
	local function refresh() --[[ Line: 98 ]]
		-- upvalues: ContentLength (ref), v1 (ref), Layout (ref), Size (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
		local ContentLength1 = Layout.getContentLength()
		local Largest = math.max(0, Size - Insets - Insets1 - ContentLength1)
		ContentLength = Insets + ContentLength1 + Insets1
		v1 = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
	end
	
	local function visibleRangeAt(p2, p3) --[[ Line: 113 ]]
		-- upvalues: Insets (ref), v1 (ref), Insets1 (ref), Layout (ref)
		local InsetsDelta = p2 + Insets - v1
		
		return Layout.getIntersectingIndexRange(InsetsDelta, (math.max(InsetsDelta, p3 - Insets1 - v1)))
	end
	
	local ContentLength1: number = Layout.getContentLength()
	local Largest = math.max(0, Size - Insets - Insets1 - ContentLength1)
	ContentLength = Insets + ContentLength1 + Insets1
	v1 = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
	
	return {
		setLayout = function(Value) --[[ Line: 122 ]]
			-- upvalues: Layout (ref), ContentLength (ref), v1 (ref), Size (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
			Layout = Value
			local ContentLength1 = Layout.getContentLength()
			local Largest = math.max(0, Size - Insets - Insets1 - ContentLength1)
			ContentLength = Insets + ContentLength1 + Insets1
			v1 = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
		end,
		getLayout = function() --[[ Line: 126 ]]
			-- upvalues: Layout (ref)
			return Layout
		end,
		setScrollOffset = function(Value): boolean --[[ Line: 129 ]]
			-- upvalues: ClampedValue (ref)
			if ClampedValue == Value then
				return false
			else
				ClampedValue = Value
				
				return true
			end
		end,
		scrollTo = function(Value: number): number --[[ Line: 107 ]]
			-- upvalues: ClampedValue (ref), Layout (ref), Size (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
			assert(math.abs(Value) < 1e999, "Virtualizer: scroll offset must be finite")
			local ContentLength = Layout.getContentLength()
			local Largest = math.max(0, Size - Insets - Insets1 - ContentLength)
			local _ = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			ClampedValue = math.clamp(Value, 0, (math.max(0, Insets + ContentLength + Insets1 - Size)))
			
			return ClampedValue
		end,
		scrollBy = function(Value: number): number --[[ Line: 137 ]]
			-- upvalues: ClampedValue (ref), Layout (ref), Size (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
			assert(math.abs(Value) < 1e999, "Virtualizer: scroll delta must be finite")
			local NewClampedValue = ClampedValue + Value
			assert(math.abs(NewClampedValue) < 1e999, "Virtualizer: scroll offset must be finite")
			local ContentLength = Layout.getContentLength()
			local Largest = math.max(0, Size - Insets - Insets1 - ContentLength)
			local _ = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			ClampedValue = math.clamp(NewClampedValue, 0, (math.max(0, Insets + ContentLength + Insets1 - Size)))
			
			return ClampedValue
		end,
		clamp = function(Value: number): number --[[ Line: 102 ]]
			-- upvalues: Layout (ref), Size (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
			local ContentLength = Layout.getContentLength()
			local Largest = math.max(0, Size - Insets - Insets1 - ContentLength)
			local _ = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
			
			return (math.clamp(Value, 0, (math.max(0, Insets + ContentLength + Insets1 - Size))))
		end,
		setSize = function(Value, Value1): boolean --[[ Line: 142 ]]
			-- upvalues: Size (ref), Size1 (ref), ContentLength (ref), v1 (ref), Layout (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
			if Size == Value and Size1 == Value1 then
				return false
			else
				Size = Value
				Size1 = Value1
				local ContentLength1 = Layout.getContentLength()
				local Largest = math.max(0, Size - Insets - Insets1 - ContentLength1)
				ContentLength = Insets + ContentLength1 + Insets1
				v1 = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
				
				return true
			end
		end,
		setOverscan = function(p2) --[[ Line: 151 ]]
			-- upvalues: Overscan1 (ref)
			local P12 = p2 or 1
			assert(P12 >= 0 and P12 % 1 == 0, "Virtualizer: overscan must be a non-negative integer")
			Overscan1 = P12
		end,
		setContentAlignment = function(p2): boolean --[[ Line: 154 ]]
			-- upvalues: ScrollAlignmentModule (upval), ContentAlignment (ref), ContentLength (ref), v1 (ref), Layout (ref), Size (ref), Insets (ref), Insets1 (ref)
			local P13 = p2 or ScrollAlignmentModule.Start
			assert(P13 == ScrollAlignmentModule.Start or (P13 == ScrollAlignmentModule.Center or P13 == ScrollAlignmentModule.End), "Virtualizer: invalid content alignment")
			
			if ContentAlignment == P13 then
				return false
			else
				ContentAlignment = P13
				local ContentLength1 = Layout.getContentLength()
				local Largest = math.max(0, Size - Insets - Insets1 - ContentLength1)
				ContentLength = Insets + ContentLength1 + Insets1
				v1 = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
				
				return true
			end
		end,
		getContentAlignment = function() --[[ Line: 164 ]]
			-- upvalues: ContentAlignment (ref)
			return ContentAlignment
		end,
		setInsets = function(Value: number, Value1: number): boolean --[[ Line: 167 ]]
			-- upvalues: Insets (ref), Insets1 (ref), ContentLength (ref), v1 (ref), Layout (ref), Size (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
			assert(Value >= 0 and Value < 1e999, "Virtualizer: content insets must be finite non-negative numbers")
			assert(Value1 >= 0 and Value1 < 1e999, "Virtualizer: content insets must be finite non-negative numbers")
			
			if Insets == Value and Insets1 == Value1 then
				return false
			else
				Insets = Value
				Insets1 = Value1
				local ContentLength1: number = Layout.getContentLength()
				local Largest = math.max(0, Size - Insets - Insets1 - ContentLength1)
				ContentLength = Insets + ContentLength1 + Insets1
				v1 = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
				
				return true
			end
		end,
		setEndThreshold = function(Value) --[[ Line: 178 ]]
			-- upvalues: ReachedThresholdModule (upval), EndThreshold (ref)
			if Value ~= nil then
				ReachedThresholdModule.validate(Value, "Virtualizer: end threshold")
			end
			EndThreshold = Value
		end,
		refresh = refresh,
		updateRanges = function() --[[ Line: 186 ]]
			-- upvalues: ClampedValue (ref), Size (ref), Insets (ref), v1 (ref), Insets1 (ref), Layout (ref), TypesModule (upval), Frozen (upval), Overscan1 (ref), Frozen1 (ref), Frozen2 (ref)
			local ClampedValueDelta = ClampedValue + Insets - v1
			local IntersectingIndexRange = Layout.getIntersectingIndexRange(ClampedValueDelta, (math.max(ClampedValueDelta, ClampedValue + Size - Insets1 - v1)))
			local Frozen3 = if TypesModule.isIndexRangeEmpty(IntersectingIndexRange) then Frozen else Layout.expandIndexRange(IntersectingIndexRange, Overscan1, Overscan1)
			local Frozen4 = Frozen1
			local Inverted = not (Frozen4.firstIndex == IntersectingIndexRange.firstIndex and Frozen4.lastIndex == IntersectingIndexRange.lastIndex)
			local Frozen5 = Frozen2
			local Inverted1 = not (Frozen5.firstIndex == Frozen3.firstIndex and Frozen5.lastIndex == Frozen3.lastIndex)
			
			if Inverted then
				Frozen1 = table.freeze({
					firstIndex = IntersectingIndexRange.firstIndex,
					lastIndex = IntersectingIndexRange.lastIndex
				})
			end
			if Inverted1 then
				Frozen2 = table.freeze({
					firstIndex = Frozen3.firstIndex,
					lastIndex = Frozen3.lastIndex
				})
			end
			return Inverted, Inverted1
		end,
		getScrollOffset = function() --[[ Line: 201 ]]
			-- upvalues: ClampedValue (ref)
			return ClampedValue
		end,
		getLength = function() --[[ Line: 204 ]]
			-- upvalues: Size (ref)
			return Size
		end,
		getCrossAxisLength = function() --[[ Line: 207 ]]
			-- upvalues: Size1 (ref)
			return Size1
		end,
		getContentLength = function() --[[ Line: 210 ]]
			-- upvalues: ContentLength (ref)
			return ContentLength
		end,
		getContentStartOffset = function() --[[ Line: 213 ]]
			-- upvalues: v1 (ref)
			return v1
		end,
		getVisibleRange = function() --[[ Line: 216 ]]
			-- upvalues: Frozen1 (ref)
			return Frozen1
		end,
		getMountedRange = function() --[[ Line: 219 ]]
			-- upvalues: Frozen2 (ref)
			return Frozen2
		end,
		visibleRangeAt = visibleRangeAt,
		placedItemLayout = function(p2) --[[ Line: 223 ]]
			-- upvalues: Layout (ref), v1 (ref)
			local ItemLayout = Layout.getItemLayout(p2)
			
			return {
				startOffset = ItemLayout.startOffset + v1,
				length = ItemLayout.length,
				crossAxisIndex = ItemLayout.crossAxisIndex,
				crossAxisCount = ItemLayout.crossAxisCount
			}
		end,
		offsetForItem = function(Value: number, Center): number --[[ Line: 232 ]]
			-- upvalues: Layout (ref), Size (ref), Insets (ref), Insets1 (ref), ContentAlignment (ref), ScrollAlignmentModule (upval)
			local ItemCount: number = Layout.getItemCount()
			
			if ItemCount == 0 then
				return 0
			else
				local ItemLayout = Layout.getItemLayout((math.clamp(Value, 1, ItemCount)))
				local ContentLength = Layout.getContentLength()
				local Largest = math.max(0, Size - Insets - Insets1 - ContentLength)
				local NewInsets = Insets + ContentLength + Insets1
				local NewInsets1 = Insets + (if ContentAlignment == ScrollAlignmentModule.End then Largest elseif ContentAlignment == ScrollAlignmentModule.Center then Largest / 2 else 0)
				local Largest1 = math.max(0, Size - Insets - Insets1)
				
				return (math.clamp(if Center == ScrollAlignmentModule.Center then NewInsets1 + ItemLayout.startOffset + ItemLayout.length / 2 - Insets - Largest1 / 2 elseif Center == ScrollAlignmentModule.End then NewInsets1 + ItemLayout.startOffset + ItemLayout.length - Size + Insets1 else NewInsets1 + ItemLayout.startOffset - Insets, 0, (math.max(0, NewInsets - Size))))
			end
		end,
		scrollState = function(p2) --[[ Line: 252 ]]
			-- upvalues: ContentLength (ref), Size (ref), ClampedValue (ref), ReachedThresholdModule (upval), EndThreshold (ref)
			local Largest = math.max(0, ContentLength - Size - ClampedValue)
			local IsClampedValueBelow = ClampedValue <= 0
			local IsLargestBelow = Largest <= ReachedThresholdModule.resolve(EndThreshold, Size, 1)
			
			return if p2 == nil or p2.scrollOffset ~= ClampedValue or p2.viewportLength ~= Size or p2.contentLength ~= ContentLength or p2.distanceFromEnd ~= Largest or p2.atStart ~= IsClampedValueBelow or p2.atEnd ~= IsLargestBelow then table.freeze({
				scrollOffset = ClampedValue,
				viewportLength = Size,
				contentLength = ContentLength,
				distanceFromEnd = Largest,
				atStart = IsClampedValueBelow,
				atEnd = IsLargestBelow
			}) else p2
		end
	}
end