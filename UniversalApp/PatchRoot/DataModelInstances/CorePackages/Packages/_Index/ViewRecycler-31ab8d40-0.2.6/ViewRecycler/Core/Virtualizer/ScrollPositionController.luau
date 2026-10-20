local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)
local TypesModule = require(ViewRecycler.Core.Types)

return function(p1)
	-- upvalues: DataSourceChangeTypeModule (copy), TypesModule (copy), DiagnosticsModule (copy), ScrollAlignmentModule (copy)
	local Config = nil
	
	local function findKeyIndex(AnchorKey, AnchorIndex: number): number?
		-- upvalues: p1 (copy)
		local ItemCount = p1.getItemCount()
		
		if AnchorIndex ~= nil and AnchorIndex >= 1 and AnchorIndex <= ItemCount and p1.getItemKey(AnchorIndex) == AnchorKey then
			return AnchorIndex
		end
		for i = 1, ItemCount do
			if p1.getItemKey(i) == AnchorKey then
				return i
			end
		end
		return nil
	end
	
	local function projectIndex(IndexHint: number, p2)
		-- upvalues: DataSourceChangeTypeModule (upval)
		if IndexHint == nil or p2.type == DataSourceChangeTypeModule.Reset or p2.type == DataSourceChangeTypeModule.Reorder then
			return nil
		elseif p2.type == DataSourceChangeTypeModule.Insert then
			return if p2.index <= IndexHint then IndexHint + #p2.keys else IndexHint
		elseif p2.type == DataSourceChangeTypeModule.Remove then
			return if IndexHint < p2.index then IndexHint elseif p2.index + #p2.keys <= IndexHint then IndexHint - #p2.keys else nil
		elseif p2.type == DataSourceChangeTypeModule.Move then
			if IndexHint == p2.fromIndex then
				return p2.toIndex
			elseif p2.fromIndex < IndexHint and IndexHint <= p2.toIndex then
				return IndexHint - 1
			elseif p2.toIndex <= IndexHint and IndexHint < p2.fromIndex then
				return IndexHint + 1
			end
		end
		return IndexHint
	end
	
	local function captureViewportAnchor(ScrollOffset: number, FirstIndex)
		-- upvalues: p1 (copy), TypesModule (upval)
		local ItemCount: number = p1.getItemCount()
		local ViewportLength: number = p1.getViewportLength()
		
		if ItemCount == 0 or ViewportLength <= 0 then
			return nil
		end
		local Value = nil
		if FirstIndex == nil then
			local VisibleRange = p1.getVisibleRange(ScrollOffset, ScrollOffset + ViewportLength)
			
			if TypesModule.isIndexRangeEmpty(VisibleRange) then
				return nil
			end
			Value = VisibleRange.firstIndex
		else
			Value = FirstIndex
		end
		local ClampedValue = math.clamp(Value, 1, ItemCount)
		local ItemLayout = p1.getItemLayout(ClampedValue)
		
		return {
			kind = "viewportPosition",
			key = p1.getItemKey(ClampedValue),
			indexHint = ClampedValue,
			viewportCoordinate = ItemLayout.startOffset - ScrollOffset,
			itemLength = ItemLayout.length,
			scrollOffset = ScrollOffset,
			viewportLength = ViewportLength
		}
	end
	
	local function prepareDataChange(DataSourceChange, AnchorEvidence)
		-- upvalues: Config (ref), projectIndex (copy), findKeyIndex (copy), p1 (copy)
		local Config1 = Config
		
		if Config1 == nil then return end
		local IndexHint = Config1.indexHint
		
		for _, change in DataSourceChange.changes do
			IndexHint = projectIndex(IndexHint, change)
		end
		Config = if Config1.kind == "itemAlignment" then {
			kind = "itemAlignment",
			key = Config1.key,
			indexHint = IndexHint,
			alignment = Config1.alignment
		} else {
			kind = "viewportPosition",
			key = Config1.key,
			indexHint = IndexHint,
			viewportCoordinate = Config1.viewportCoordinate,
			itemLength = Config1.itemLength,
			scrollOffset = Config1.scrollOffset,
			viewportLength = Config1.viewportLength
		}
		local Config2 = Config
		
		if findKeyIndex(Config2.key, Config2.indexHint) ~= nil or Config2.kind == "itemAlignment" then return end
		if AnchorEvidence == nil or AnchorEvidence.viewportLength <= 0 then
			Config = nil
			
			return
		end
		local IndexHint1 = nil
		for _, visibleItem in AnchorEvidence.visibleItems do
			local Key = visibleItem.key
			IndexHint1 = nil
			
			for i = 1, p1.getItemCount() do
				if p1.getItemKey(i) ~= Key then
					continue
				end
				IndexHint1 = i
				break
			end
			if IndexHint1 ~= nil then
				Config = {
					kind = "viewportPosition",
					key = visibleItem.key,
					indexHint = IndexHint1,
					viewportCoordinate = visibleItem.viewportCoordinate,
					itemLength = visibleItem.itemLength,
					scrollOffset = AnchorEvidence.scrollOffset,
					viewportLength = AnchorEvidence.viewportLength
				}
				
				return
			end
		end
		Config = nil
	end
	
	local function resolve(p2)
		-- upvalues: Config (ref), captureViewportAnchor (copy), p1 (copy), findKeyIndex (copy), DiagnosticsModule (upval)
		local Config1 = Config
		
		if Config1 == nil then
			Config = captureViewportAnchor(p1.getScrollOffset(), nil)
			
			return nil
		end
		local KeyIndex = findKeyIndex(Config1.key, Config1.indexHint)
		
		if KeyIndex == nil then
			Config = captureViewportAnchor(p1.getScrollOffset(), nil)
			
			return nil
		end
		local Source = p2.source
		local ScrollOffsetForItemDelta = nil
		
		if Config1.kind == "itemAlignment" then
			Config1.indexHint = KeyIndex
			Source = DiagnosticsModule.ScrollCorrectionSource.ProgrammaticScroll
			ScrollOffsetForItemDelta = p1.getScrollOffsetForItem(KeyIndex, Config1.alignment) - p1.getScrollOffset()
		else
			if not p1.shouldPreserveUserPosition() then
				Config = captureViewportAnchor(p1.getScrollOffset(), nil)
				
				return nil
			end
			Config1.indexHint = KeyIndex
			local StartInsetDelta = p2.startInsetDelta or 0
			ScrollOffsetForItemDelta = p1.getItemLayout(KeyIndex).startOffset - p1.getScrollOffset() - Config1.viewportCoordinate - StartInsetDelta
			
			if p2.preserveStartAnchor and p1.getScrollOffset() > 0 then
				ScrollOffsetForItemDelta += StartInsetDelta
			end
		end
		local ScrollOffset = p1.getScrollOffset()
		local ClampScrollOffsetResultDelta = p1.clampScrollOffset(ScrollOffset + ScrollOffsetForItemDelta) - ScrollOffset
		
		if Config1.kind == "viewportPosition" then
			local ItemLayout = p1.getItemLayout(KeyIndex)
			local NewScrollOffset = ScrollOffset + (if math.abs(ClampScrollOffsetResultDelta) < 1 then 0 else ClampScrollOffsetResultDelta)
			local StartOffsetDelta = ItemLayout.startOffset - NewScrollOffset
			local ViewportLength = p1.getViewportLength()
			Config = if StartOffsetDelta < ViewportLength and StartOffsetDelta + ItemLayout.length > 0 then {
				kind = "viewportPosition",
				key = Config1.key,
				indexHint = KeyIndex,
				viewportCoordinate = StartOffsetDelta,
				itemLength = ItemLayout.length,
				scrollOffset = NewScrollOffset,
				viewportLength = ViewportLength
			} else captureViewportAnchor(NewScrollOffset, nil)
		end
		return if math.abs(ClampScrollOffsetResultDelta) < 1 then nil else { delta = ClampScrollOffsetResultDelta, source = Source }
	end
	
	return {
		setItemAnchor = function(Value: number, p2)
			-- upvalues: p1 (copy), Config (ref), ScrollAlignmentModule (upval)
			local ItemCount: number = p1.getItemCount()
			
			if ItemCount == 0 then
				Config = nil
				
				return
			else
				local ClampedValue = math.clamp(Value, 1, ItemCount)
				Config = {
					kind = "itemAlignment",
					key = p1.getItemKey(ClampedValue),
					indexHint = ClampedValue,
					alignment = p2 or ScrollAlignmentModule.Start
				}
			end
		end,
		setViewportAnchor = function(ScrollOffset, Callback)
			-- upvalues: Config (ref), captureViewportAnchor (copy)
			local Config1 = Config
			
			if Config1 ~= nil and Config1.kind == "viewportPosition" then
				local ViewportCoordinateDelta = Config1.viewportCoordinate - (ScrollOffset - Config1.scrollOffset)
				
				if ViewportCoordinateDelta < Config1.viewportLength and ViewportCoordinateDelta + Config1.itemLength > 0 then
					Config1.viewportCoordinate = ViewportCoordinateDelta
					Config1.scrollOffset = ScrollOffset
					
					return
				end
			end
			Config = captureViewportAnchor(ScrollOffset, if Callback == nil then nil else Callback())
		end,
		restoreSnapshotAnchor = function(p2, ScrollOffset)
			-- upvalues: findKeyIndex (copy), Config (ref), captureViewportAnchor (copy)
			Config = captureViewportAnchor(ScrollOffset, if p2.anchorKey == nil then nil else findKeyIndex(p2.anchorKey, p2.anchorIndex))
		end,
		reconcileHostOffset = function(ScrollOffset)
			-- upvalues: Config (ref), captureViewportAnchor (copy)
			if Config == nil or Config.kind == "viewportPosition" then
				local Config1 = Config
				
				if Config1 ~= nil and Config1.kind == "viewportPosition" then
					local ViewportCoordinateDelta = Config1.viewportCoordinate - (ScrollOffset - Config1.scrollOffset)
					
					if ViewportCoordinateDelta < Config1.viewportLength and ViewportCoordinateDelta + Config1.itemLength > 0 then
						Config1.viewportCoordinate = ViewportCoordinateDelta
						Config1.scrollOffset = ScrollOffset
						
						return
					end
				end
				Config = captureViewportAnchor(ScrollOffset, nil)
			end
		end,
		applyGeometryChange = function(p2, Callback: () -> ())
			-- upvalues: prepareDataChange (copy), resolve (copy)
			if p2.dataSourceChange ~= nil then
				prepareDataChange(p2.dataSourceChange, p2.anchorEvidence)
			end
			Callback()
			
			return (resolve(p2))
		end,
		allowsExternalPositionApplication = function(): boolean
			-- upvalues: Config (ref)
			return Config == nil or Config.kind == "viewportPosition"
		end,
		reset = function()
			-- upvalues: Config (ref)
			Config = nil
		end,
		captureSnapshot = function()
			-- upvalues: p1 (copy), Config (ref), TypesModule (upval)
			local ScrollOffset: number = p1.getScrollOffset()
			local Config1 = Config
			
			if Config1 ~= nil and Config1.kind == "viewportPosition" and math.abs(Config1.scrollOffset - ScrollOffset) < 0.5 then
				return {
					anchorKey = Config1.key,
					anchorIndex = Config1.indexHint,
					offsetWithinItem = -Config1.viewportCoordinate,
					fallbackScrollOffset = ScrollOffset
				}
			end
			local ViewportLength: number = p1.getViewportLength()
			
			if ViewportLength > 0 then
				local VisibleRange = p1.getVisibleRange(ScrollOffset, ScrollOffset + ViewportLength)
				
				if not TypesModule.isIndexRangeEmpty(VisibleRange) then
					local FirstIndex = VisibleRange.firstIndex
					
					return {
						anchorKey = p1.getItemKey(FirstIndex),
						anchorIndex = FirstIndex,
						offsetWithinItem = ScrollOffset - p1.getItemLayout(FirstIndex).startOffset,
						fallbackScrollOffset = ScrollOffset
					}
				end
			end
			return {
				anchorKey = nil,
				anchorIndex = nil,
				offsetWithinItem = 0,
				fallbackScrollOffset = ScrollOffset
			}
		end,
		getSnapshotOffset = function(p2)
			-- upvalues: findKeyIndex (copy), p1 (copy)
			if p2.anchorKey ~= nil then
				local KeyIndex = findKeyIndex(p2.anchorKey, p2.anchorIndex)
				
				if KeyIndex ~= nil then
					return p1.getItemLayout(KeyIndex).startOffset + p2.offsetWithinItem
				end
			end
			return p2.fallbackScrollOffset
		end,
		destroy = function()
			-- upvalues: Config (ref)
			Config = nil
		end
	}
end