local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Virtualizer.ItemSequence)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)
local TypesModule = require(ViewRecycler.Core.Types)
local _ = require(ViewRecycler.Core.Virtualizer.Viewport)

local function projectIndex(IndexHint: number, p1) --[[ Line: 81 ]]
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

return function(p1) --[[ Line: 108 | Named "createScrollAnchor" ]]
	-- upvalues: TypesModule (copy), projectIndex (copy), DiagnosticsModule (copy), ScrollAlignmentModule (copy)
	local Viewport = p1.viewport
	local Config = nil
	
	local function findKeyIndex(AnchorKey, AnchorIndex: number): number? --[[ Line: 112 ]]
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
	
	local function captureViewport(ScrollOffset: number, FirstIndex) --[[ Line: 126 ]]
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
	
	local function captureEvidence() --[[ Line: 167 ]]
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
	
	local function prepareDataChange(DataSourceChange, p2) --[[ Line: 188 ]]
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
	
	local function resolve(p3) --[[ Line: 223 ]]
		-- upvalues: Config (ref), captureViewport (copy), Viewport (copy), findKeyIndex (copy), DiagnosticsModule (upval), p1 (copy)
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
			if not p1.shouldPreserveUserPosition() then
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
		setItemTarget = function(Value: number, p3) --[[ Line: 290 ]]
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
		setViewport = function(ScrollOffset) --[[ Line: 276 ]]
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
		observeHost = function(ScrollOffset) --[[ Line: 306 ]]
			-- upvalues: Config (ref), captureViewport (copy)
			if Config == nil or Config.kind == "viewport" then
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
		restore = function(p3, ScrollOffset) --[[ Line: 311 ]]
			-- upvalues: findKeyIndex (copy), Config (ref), captureViewport (copy)
			Config = captureViewport(ScrollOffset, if p3.anchorKey == nil then nil else findKeyIndex(p3.anchorKey, p3.anchorIndex))
		end,
		snapshotOffset = function(p3) --[[ Line: 317 ]]
			-- upvalues: findKeyIndex (copy), Viewport (copy)
			if p3.anchorKey ~= nil then
				local KeyIndex = findKeyIndex(p3.anchorKey, p3.anchorIndex)
				
				if KeyIndex ~= nil then
					return Viewport.placedItemLayout(KeyIndex).startOffset + p3.offsetWithinItem
				end
			end
			return p3.fallbackScrollOffset
		end,
		preserve = function(p3, Callback: () -> ()) --[[ Line: 326 ]]
			-- upvalues: prepareDataChange (copy), captureEvidence (copy), resolve (copy)
			if p3.dataSourceChange ~= nil then
				prepareDataChange(p3.dataSourceChange, (captureEvidence()))
			end
			Callback()
			
			return (resolve(p3))
		end,
		allowsPolicyOffset = function(): boolean --[[ Line: 333 ]]
			-- upvalues: Config (ref)
			return Config == nil or Config.kind == "viewport"
		end,
		getAnchoredItem = function() --[[ Line: 336 ]]
			-- upvalues: Config (ref), p1 (copy), ScrollAlignmentModule (upval)
			local Config1 = Config
			
			if Config1 == nil or Config1.kind == "viewport" and not p1.shouldPreserveUserPosition() then
				return nil
			else
				local IndexHint = Config1.indexHint
				
				return if IndexHint == nil then nil else table.freeze({
					index = IndexHint,
					alignment = if Config1.kind == "itemTarget" then Config1.alignment else ScrollAlignmentModule.Start
				})
			end
		end,
		reset = function() --[[ Line: 352 ]]
			-- upvalues: Config (ref)
			Config = nil
		end
	}
end