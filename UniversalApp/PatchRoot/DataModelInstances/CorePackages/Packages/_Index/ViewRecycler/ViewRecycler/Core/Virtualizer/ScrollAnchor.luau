local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact08
local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollPolicyModule = require(ViewRecycler.Core.Enums.AutoScrollPolicy)
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Virtualizer.ItemSequence)
local ReachedThresholdModule = require(ViewRecycler.Core.ViewportBehavior.ReachedThreshold)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)
local TypesModule = require(ViewRecycler.Core.Types)
local _ = require(ViewRecycler.Core.Virtualizer.Viewport)
local v1: number? = nil
local Callback: ((any) -> any)? = nil
local Callback1: ((any) -> ())? = nil

if FFlagViewRecyclerReact08 then
	v1 = 1
	
	Callback = function(AutoScrollOnChange)
		-- upvalues: AutoScrollPolicyModule (copy), ScrollAlignmentModule (copy)
		return if AutoScrollOnChange == AutoScrollPolicyModule.WhenAtStart then ScrollAlignmentModule.Start elseif AutoScrollOnChange == AutoScrollPolicyModule.WhenAtEnd then ScrollAlignmentModule.End else nil
	end
	
	Callback1 = function(p1)
		-- upvalues: ScrollAlignmentModule (copy), Callback (ref), ReachedThresholdModule (copy)
		local InitialScrollAlignment = p1.initialScrollAlignment
		assert(InitialScrollAlignment == nil or (InitialScrollAlignment == ScrollAlignmentModule.Start or InitialScrollAlignment == ScrollAlignmentModule.End), "Virtualizer: initialScrollAlignment must be ScrollAlignment.Start or ScrollAlignment.End")
		assert(p1.autoScrollOnChange == nil or Callback(p1.autoScrollOnChange) ~= nil, "Virtualizer: autoScrollOnChange must be AutoScrollPolicy.WhenAtStart or AutoScrollPolicy.WhenAtEnd")
		
		if p1.autoScrollThreshold ~= nil then
			ReachedThresholdModule.validate(p1.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
		end
	end
end
local function projectIndex(IndexHint: number, p1)
	-- upvalues: DataSourceChangeTypeModule (copy)
	if IndexHint == nil or p1.type == DataSourceChangeTypeModule.Reset or p1.type == DataSourceChangeTypeModule.Reorder then
		return nil
	elseif p1.type == DataSourceChangeTypeModule.Insert then
		return if p1.index <= IndexHint then IndexHint + #p1.keys else IndexHint
	elseif p1.type == DataSourceChangeTypeModule.Remove then
		return if IndexHint < p1.index then IndexHint elseif p1.index + #p1.keys <= IndexHint then IndexHint - #p1.keys else nil
	elseif p1.type == DataSourceChangeTypeModule.Move then
		if IndexHint == p1.fromIndex then
			return p1.toIndex
		elseif p1.fromIndex < IndexHint and IndexHint <= p1.toIndex then
			return IndexHint - 1
		elseif p1.toIndex <= IndexHint and IndexHint < p1.fromIndex then
			return IndexHint + 1
		end
	end
	return IndexHint
end

return function(p1)
	-- upvalues: FFlagViewRecyclerReact08 (copy), Callback1 (ref), ScrollAlignmentModule (copy), ReachedThresholdModule (copy), v1 (ref), Callback (ref), TypesModule (copy), projectIndex (copy), DiagnosticsModule (copy)
	local Viewport = p1.viewport
	local IsLaidOutFunction = nil
	local v2 = nil
	
	if FFlagViewRecyclerReact08 then
		IsLaidOutFunction = p1.isLaidOut
		v2 = p1.config
		Callback1(v2)
	end
	local Config = nil
	local v3 = nil
	local Flag: boolean? = nil
	local Flag1: boolean? = nil
	local Callback2: (() -> boolean)? = nil
	local Callback5: ((any) -> any)? = nil
	local Callback9: ((any) -> number)? = nil
	local Callback3: (() -> any)? = nil
	local Callback6: ((any) -> ())? = nil
	local Callback4: (() -> boolean)? = nil
	local Callback8: (() -> boolean)? = nil
	local Callback7: (() -> any)? = nil
	local Callback10: (() -> ())? = nil
	
	if FFlagViewRecyclerReact08 then
		v3 = nil
		Flag = false
		Flag1 = true
		
		Callback2 = function(): boolean
			-- upvalues: p1 (copy)
			return p1.getItemSequence().getItemCount() > 0
		end
		
		Callback5 = function(Start)
			-- upvalues: Viewport (copy), ScrollAlignmentModule (upval)
			local ScrollOffset = Viewport.getScrollOffset()
			
			return if Start == ScrollAlignmentModule.Start then ScrollOffset else math.max(0, Viewport.getContentLength() - Viewport.getLength() - ScrollOffset)
		end
		
		Callback9 = function(InitialScrollAlignment): number
			-- upvalues: ScrollAlignmentModule (upval), Viewport (copy)
			return if InitialScrollAlignment == ScrollAlignmentModule.Start then 0 else math.max(0, Viewport.getContentLength() - Viewport.getLength())
		end
		
		Callback3 = function()
			-- upvalues: ReachedThresholdModule (upval), v2 (ref), Viewport (copy), v1 (upval)
			return ReachedThresholdModule.resolve(v2.autoScrollThreshold, Viewport.getLength(), v1)
		end
		
		Callback6 = function(InitialScrollAlignment)
			-- upvalues: Flag (ref), v3 (ref)
			Flag = Flag and InitialScrollAlignment == v3
			v3 = InitialScrollAlignment
		end
		
		Callback4 = function(): boolean
			-- upvalues: Config (ref)
			return Config ~= nil and Config.kind == "itemTarget"
		end
		
		Callback8 = function(): boolean
			-- upvalues: v3 (ref), Callback4 (ref)
			return v3 ~= nil and not Callback4()
		end
		
		Callback7 = function()
			-- upvalues: Flag1 (ref), v2 (ref), Callback2 (ref), IsLaidOutFunction (ref)
			return Flag1 and (v2.initialScrollAlignment ~= nil and (Callback2() and IsLaidOutFunction()))
		end
		
		Callback10 = function()
			-- upvalues: Callback3 (ref), v3 (ref), Callback5 (ref), Callback (upval), v2 (ref), Callback6 (ref)
			local CallbackResult = Callback3()
			local v4 = v3
			
			if v4 == nil or Callback5(v4) > CallbackResult then
				local CallbackResult1 = Callback(v2.autoScrollOnChange)
				Callback6(if CallbackResult1 == nil or Callback5(CallbackResult1) > CallbackResult then nil else CallbackResult1)
				
				return
			end
		end
	end
	local function findKeyIndex(AnchorKey, AnchorIndex: number): number?
		-- upvalues: p1 (copy)
		local ItemSequence = p1.getItemSequence()
		local ItemCount = ItemSequence.getItemCount()
		
		if AnchorIndex ~= nil and AnchorIndex >= 1 and AnchorIndex <= ItemCount and ItemSequence.getItemKey(AnchorIndex) == AnchorKey then
			return AnchorIndex
		end
		for i = 1, ItemCount do
			if ItemSequence.getItemKey(i) == AnchorKey then
				return i
			end
		end
		return nil
	end
	
	local function captureViewport(ScrollOffset: number, FirstIndex)
		-- upvalues: p1 (copy), Viewport (copy), TypesModule (upval)
		local ItemSequence = p1.getItemSequence()
		local ItemCount: number = ItemSequence.getItemCount()
		local Length: number = Viewport.getLength()
		
		if ItemCount == 0 or Length <= 0 then
			return nil
		end
		local Value = FirstIndex
		
		if Value == nil then
			local VisibleRangeAtResult = Viewport.visibleRangeAt(ScrollOffset, ScrollOffset + Length)
			
			if TypesModule.isIndexRangeEmpty(VisibleRangeAtResult) then
				return nil
			end
			Value = VisibleRangeAtResult.firstIndex
			local IsItemMeasuredFunction = Viewport.getLayout().isItemMeasured
			
			if IsItemMeasuredFunction ~= nil then
				for i = VisibleRangeAtResult.firstIndex, math.min(VisibleRangeAtResult.lastIndex, ItemCount) do
					if not IsItemMeasuredFunction(i) then
						continue
					end
					Value = i
					break
				end
			end
		end
		local ClampedValue = math.clamp(Value, 1, ItemCount)
		local PlacedItemLayoutResult = Viewport.placedItemLayout(ClampedValue)
		
		return {
			kind = "viewport",
			key = ItemSequence.getItemKey(ClampedValue),
			indexHint = ClampedValue,
			viewportCoordinate = PlacedItemLayoutResult.startOffset - ScrollOffset,
			itemLength = PlacedItemLayoutResult.length,
			scrollOffset = ScrollOffset,
			viewportLength = Length
		}
	end
	
	local function captureEvidence()
		-- upvalues: Viewport (copy), TypesModule (upval), p1 (copy)
		local ScrollOffset = Viewport.getScrollOffset()
		local Length = Viewport.getLength()
		local VisibleRange = Viewport.getVisibleRange()
		
		if TypesModule.isIndexRangeEmpty(VisibleRange) then
			return nil
		end
		local ItemSequence = p1.getItemSequence()
		local Items = {}
		
		for i = VisibleRange.firstIndex, math.min(VisibleRange.lastIndex, (ItemSequence.getItemCount())) do
			local PlacedItemLayoutResult = Viewport.placedItemLayout(i)
			table.insert(Items, {
				key = ItemSequence.getItemKey(i),
				viewportCoordinate = PlacedItemLayoutResult.startOffset - ScrollOffset,
				itemLength = PlacedItemLayoutResult.length
			})
		end
		return {
			scrollOffset = ScrollOffset,
			viewportLength = Length,
			items = Items
		}
	end
	
	local function prepareDataChange(DataSourceChange, p2)
		-- upvalues: Config (ref), projectIndex (upval), findKeyIndex (copy), p1 (copy)
		local Config1 = Config
		
		if Config1 == nil then return end
		local IndexHint = Config1.indexHint
		
		for _, change in DataSourceChange.changes do
			IndexHint = projectIndex(IndexHint, change)
		end
		Config1.indexHint = IndexHint
		
		if Config1.kind == "itemTarget" or findKeyIndex(Config1.key, IndexHint) ~= nil then return end
		if p2 ~= nil and p2.viewportLength > 0 then
			local IndexHint1 = nil
			for _, item in p2.items do
				local Key = item.key
				local ItemSequence = p1.getItemSequence()
				IndexHint1 = nil
				
				for i = 1, ItemSequence.getItemCount() do
					if ItemSequence.getItemKey(i) ~= Key then
						continue
					end
					IndexHint1 = i
					break
				end
				if IndexHint1 ~= nil then
					Config = {
						kind = "viewport",
						key = item.key,
						indexHint = IndexHint1,
						viewportCoordinate = item.viewportCoordinate,
						itemLength = item.itemLength,
						scrollOffset = p2.scrollOffset,
						viewportLength = p2.viewportLength
					}
					
					return
				end
			end
		end
		Config = nil
	end
	
	local function resolve(p3)
		-- upvalues: Config (ref), captureViewport (copy), Viewport (copy), findKeyIndex (copy), DiagnosticsModule (upval), FFlagViewRecyclerReact08 (upval), v2 (ref), p1 (copy)
		local Config1 = Config
		
		if Config1 == nil then
			Config = captureViewport(Viewport.getScrollOffset(), nil)
			
			return nil
		end
		local KeyIndex = findKeyIndex(Config1.key, Config1.indexHint)
		
		if KeyIndex == nil then
			Config = captureViewport(Viewport.getScrollOffset(), nil)
			
			return nil
		end
		local Source = p3.source
		local ScrollOffset: number = Viewport.getScrollOffset()
		local OffsetForItemResultDelta = nil
		
		if Config1.kind == "itemTarget" then
			Config1.indexHint = KeyIndex
			Source = DiagnosticsModule.ScrollCorrectionSource.ProgrammaticScroll
			OffsetForItemResultDelta = Viewport.offsetForItem(KeyIndex, Config1.alignment) - ScrollOffset
		else
			if not (if FFlagViewRecyclerReact08 then v2.preserveScrollPositionOnChange else p1.shouldPreserveUserPosition()) then
				Config = captureViewport(ScrollOffset, nil)
				
				return nil
			end
			Config1.indexHint = KeyIndex
			local StartInsetDelta = p3.startInsetDelta or 0
			OffsetForItemResultDelta = Viewport.placedItemLayout(KeyIndex).startOffset - ScrollOffset - Config1.viewportCoordinate - StartInsetDelta
			
			if p3.preserveStartAnchor and ScrollOffset > 0 then
				OffsetForItemResultDelta += StartInsetDelta
			end
		end
		local ClampResultDelta = Viewport.clamp(ScrollOffset + OffsetForItemResultDelta) - ScrollOffset
		
		if Config1.kind == "viewport" then
			local NewScrollOffset = ScrollOffset + (if math.abs(ClampResultDelta) < 1 then 0 else ClampResultDelta)
			local PlacedItemLayoutResult = Viewport.placedItemLayout(KeyIndex)
			local StartOffsetDelta = PlacedItemLayoutResult.startOffset - NewScrollOffset
			local Length = Viewport.getLength()
			Config = if StartOffsetDelta < Length and StartOffsetDelta + PlacedItemLayoutResult.length > 0 then {
				kind = "viewport",
				key = Config1.key,
				indexHint = KeyIndex,
				viewportCoordinate = StartOffsetDelta,
				itemLength = PlacedItemLayoutResult.length,
				scrollOffset = NewScrollOffset,
				viewportLength = Length
			} else captureViewport(NewScrollOffset, nil)
		end
		return if math.abs(ClampResultDelta) < 1 then nil else { delta = ClampResultDelta, source = Source }
	end
	
	return {
		configure = if FFlagViewRecyclerReact08 then function(p3)
			-- upvalues: Callback1 (upval), v2 (ref)
			Callback1(p3)
			v2 = p3
		end else nil,
		setItemTarget = function(Value: number, p3)
			-- upvalues: p1 (copy), Config (ref), ScrollAlignmentModule (upval)
			local ItemSequence = p1.getItemSequence()
			local ItemCount: number = ItemSequence.getItemCount()
			
			if ItemCount == 0 then
				Config = nil
				
				return
			else
				local ClampedValue = math.clamp(Value, 1, ItemCount)
				Config = {
					kind = "itemTarget",
					key = ItemSequence.getItemKey(ClampedValue),
					indexHint = ClampedValue,
					alignment = p3 or ScrollAlignmentModule.Start
				}
			end
		end,
		setViewport = function(ScrollOffset)
			-- upvalues: Config (ref), captureViewport (copy)
			local Config1 = Config
			
			if Config1 ~= nil and Config1.kind == "viewport" then
				local ViewportCoordinateDelta = Config1.viewportCoordinate - (ScrollOffset - Config1.scrollOffset)
				
				if ViewportCoordinateDelta < Config1.viewportLength and ViewportCoordinateDelta + Config1.itemLength > 0 then
					Config1.viewportCoordinate = ViewportCoordinateDelta
					Config1.scrollOffset = ScrollOffset
					
					return
				end
			end
			Config = captureViewport(ScrollOffset, nil)
		end,
		observeHost = function(ScrollOffset)
			-- upvalues: FFlagViewRecyclerReact08 (upval), Callback4 (ref), Config (ref), captureViewport (copy)
			if if FFlagViewRecyclerReact08 then not Callback4() else Config == nil or Config.kind == "viewport" then
				local Config1 = Config
				
				if Config1 ~= nil and Config1.kind == "viewport" then
					local ViewportCoordinateDelta = Config1.viewportCoordinate - (ScrollOffset - Config1.scrollOffset)
					
					if ViewportCoordinateDelta < Config1.viewportLength and ViewportCoordinateDelta + Config1.itemLength > 0 then
						Config1.viewportCoordinate = ViewportCoordinateDelta
						Config1.scrollOffset = ScrollOffset
						
						return
					end
				end
				Config = captureViewport(ScrollOffset, nil)
			end
		end,
		scrolledProgrammatically = if FFlagViewRecyclerReact08 then function(p3)
			-- upvalues: Flag1 (ref), v3 (ref), Flag (ref)
			Flag1 = false
			
			if p3 ~= nil then
				v3 = p3
				Flag = true
			end
		end else nil,
		restore = function(p3, ScrollOffset)
			-- upvalues: findKeyIndex (copy), Config (ref), captureViewport (copy)
			Config = captureViewport(ScrollOffset, if p3.anchorKey == nil then nil else findKeyIndex(p3.anchorKey, p3.anchorIndex))
		end,
		snapshotOffset = function(p3)
			-- upvalues: findKeyIndex (copy), Viewport (copy)
			if p3.anchorKey ~= nil then
				local KeyIndex = findKeyIndex(p3.anchorKey, p3.anchorIndex)
				
				if KeyIndex ~= nil then
					return Viewport.placedItemLayout(KeyIndex).startOffset + p3.offsetWithinItem
				end
			end
			return p3.fallbackScrollOffset
		end,
		preserve = function(p3, Callback1: () -> ())
			-- upvalues: FFlagViewRecyclerReact08 (upval), Callback (upval), v2 (ref), Callback5 (ref), Callback3 (ref), prepareDataChange (copy), captureEvidence (copy), Callback4 (ref), Callback7 (ref), Callback6 (ref), Flag (ref), resolve (copy), Callback8 (ref), Viewport (copy), Config (ref), captureViewport (copy)
			local DataSourceChange = nil
			local v4 = nil
			local v5: boolean? = nil
			
			if FFlagViewRecyclerReact08 then
				DataSourceChange = p3.dataSourceChange
				v4 = Callback(v2.autoScrollOnChange)
				v5 = DataSourceChange ~= nil and (v4 ~= nil and Callback5(v4) <= Callback3())
			end
			if (if FFlagViewRecyclerReact08 then DataSourceChange else p3.dataSourceChange) ~= nil then
				prepareDataChange(if FFlagViewRecyclerReact08 then DataSourceChange else p3.dataSourceChange, (captureEvidence()))
			end
			Callback1()
			
			if not FFlagViewRecyclerReact08 then
				return (resolve(p3))
			end
			if DataSourceChange ~= nil and not Callback4() and not Callback7() then
				if v5 then
					Callback6(v4)
				elseif not Flag then
					Callback6(nil)
				end
			end
			local ResolveResult = resolve(p3)
			
			if ResolveResult == nil or not Callback8() and not Callback7() then
				return ResolveResult
			end
			local ScrollOffset = Viewport.getScrollOffset()
			local Config1 = Config
			repeat
				if Config1 ~= nil and Config1.kind == "viewport" then
					local ViewportCoordinateDelta = Config1.viewportCoordinate - (ScrollOffset - Config1.scrollOffset)
					
					if ViewportCoordinateDelta < Config1.viewportLength and ViewportCoordinateDelta + Config1.itemLength > 0 then
						Config1.viewportCoordinate = ViewportCoordinateDelta
						Config1.scrollOffset = ScrollOffset
						break
					end
				end
				Config = captureViewport(ScrollOffset, nil)
			until true
			return nil
		end,
		settle = if FFlagViewRecyclerReact08 then function(p3, Callback: (any) -> ())
			-- upvalues: Flag1 (ref), Callback2 (ref), IsLaidOutFunction (ref), v2 (ref), Callback6 (ref), Callback9 (ref), v3 (ref), Callback8 (ref), Callback4 (ref), Viewport (copy), Callback10 (ref)
			if Flag1 and Callback2() and IsLaidOutFunction() then
				Flag1 = false
				local InitialScrollAlignment = v2.initialScrollAlignment
				
				if InitialScrollAlignment ~= nil then
					Callback6(InitialScrollAlignment)
					Callback(Callback9(InitialScrollAlignment))
					
					return
				end
			end
			local v4 = v3
			
			if p3.dataChange == nil then
				local IsLaidOut = IsLaidOutFunction()
				local CallbackResult = if p3.replaced then 0 elseif p3.contentLengthChanged and v4 ~= nil and Callback8() then Callback9(v4) else nil
				
				if p3.viewportChanged then
					local KeptDistanceFromEnd = p3.keptDistanceFromEnd
					
					if IsLaidOut and v4 ~= nil and Callback8() then
						CallbackResult = Callback9(v4)
					elseif KeptDistanceFromEnd ~= nil and not Callback4() then
						CallbackResult = Viewport.getContentLength() - Viewport.getLength() - KeptDistanceFromEnd
					end
				end
				if CallbackResult ~= nil then
					Callback(CallbackResult)
				end
				if IsLaidOut and (p3.replaced or p3.viewportChanged or p3.scrollMoved) then
					Callback10()
				end
				return
			elseif v4 ~= nil and Callback8() then
				Callback(Callback9(v4))
			end
		end else nil,
		getAnchoredItem = function()
			-- upvalues: Config (ref), FFlagViewRecyclerReact08 (upval), p1 (copy), v3 (ref), Viewport (copy), ScrollAlignmentModule (upval), v2 (ref)
			local Config1 = Config
			
			if if FFlagViewRecyclerReact08 then Config1 ~= nil and Config1.kind == "itemTarget" else Config1 == nil or Config1.kind == "viewport" and not p1.shouldPreserveUserPosition() then
				local IndexHint = if FFlagViewRecyclerReact08 then Config1.indexHint else nil
				
				return if FFlagViewRecyclerReact08 then if IndexHint == nil then nil else table.freeze({ index = IndexHint, alignment = Config1.alignment }) else nil
			end
			if FFlagViewRecyclerReact08 then
				local Start = v3
				
				if Viewport.getContentLength() <= Viewport.getLength() then
					local ContentAlignment = Viewport.getContentAlignment()
					
					if ContentAlignment == ScrollAlignmentModule.Start then
						Start = ScrollAlignmentModule.Start
					elseif ContentAlignment == ScrollAlignmentModule.End then
						Start = ScrollAlignmentModule.End
					end
				end
				if Start ~= nil then
					local ItemCount = p1.getItemSequence().getItemCount()
					
					return if ItemCount == 0 then nil else table.freeze({
						index = if Start == ScrollAlignmentModule.Start then 1 else ItemCount,
						alignment = Start
					})
				elseif Config1 == nil or not v2.preserveScrollPositionOnChange then
					return nil
				end
			end
			local IndexHint = Config1.indexHint
			
			return if FFlagViewRecyclerReact08 then if IndexHint == nil then nil else table.freeze({
				index = IndexHint,
				alignment = ScrollAlignmentModule.Start
			}) elseif IndexHint == nil then nil else table.freeze({
				index = IndexHint,
				alignment = if Config1.kind == "itemTarget" then Config1.alignment else ScrollAlignmentModule.Start
			})
		end,
		dataSourceReplaced = if FFlagViewRecyclerReact08 then function()
			-- upvalues: Config (ref), v3 (ref), Flag (ref), Flag1 (ref)
			Config = nil
			v3 = nil
			Flag = false
			Flag1 = true
		end else nil,
		reset = function()
			-- upvalues: Config (ref)
			Config = nil
		end,
		allowsPolicyOffset = if FFlagViewRecyclerReact08 then nil else function(): boolean
			-- upvalues: Config (ref)
			return Config == nil or Config.kind == "viewport"
		end
	}
end