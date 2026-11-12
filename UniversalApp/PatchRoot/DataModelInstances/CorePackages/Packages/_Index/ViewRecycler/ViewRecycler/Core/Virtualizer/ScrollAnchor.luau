local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
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
local v1 = nil
local followedEdge = nil
local validate = nil

if FFlagViewRecyclerReact084 then
	v1 = 1
	
	followedEdge = function(AutoScrollOnChange)
		-- upvalues: AutoScrollPolicyModule (copy), ScrollAlignmentModule (copy)
		return if AutoScrollOnChange == AutoScrollPolicyModule.WhenAtStart then ScrollAlignmentModule.Start elseif AutoScrollOnChange == AutoScrollPolicyModule.WhenAtEnd then ScrollAlignmentModule.End else nil
	end
	
	validate = function(p1)
		-- upvalues: ScrollAlignmentModule (copy), followedEdge (ref), ReachedThresholdModule (copy)
		local InitialScrollAlignment = p1.initialScrollAlignment
		assert(InitialScrollAlignment == nil or (InitialScrollAlignment == ScrollAlignmentModule.Start or InitialScrollAlignment == ScrollAlignmentModule.End), "Virtualizer: initialScrollAlignment must be ScrollAlignment.Start or ScrollAlignment.End")
		assert(p1.autoScrollOnChange == nil or followedEdge(p1.autoScrollOnChange) ~= nil, "Virtualizer: autoScrollOnChange must be AutoScrollPolicy.WhenAtStart or AutoScrollPolicy.WhenAtEnd")
		
		if p1.autoScrollThreshold ~= nil then
			ReachedThresholdModule.validate(p1.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
		end
	end
else
	v1 = nil
	followedEdge = nil
	validate = nil
	
	if FFlagViewRecyclerReact08 then
		v1 = 1
		
		followedEdge = function(WhenAtEnd)
			-- upvalues: AutoScrollPolicyModule (copy), ScrollAlignmentModule (copy)
			return if WhenAtEnd == AutoScrollPolicyModule.WhenAtStart then ScrollAlignmentModule.Start elseif WhenAtEnd == AutoScrollPolicyModule.WhenAtEnd then ScrollAlignmentModule.End else nil
		end
		
		validate = function(p1)
			-- upvalues: ScrollAlignmentModule (copy), followedEdge (ref), ReachedThresholdModule (copy)
			local InitialScrollAlignment = p1.initialScrollAlignment
			assert(InitialScrollAlignment == nil or (InitialScrollAlignment == ScrollAlignmentModule.Start or InitialScrollAlignment == ScrollAlignmentModule.End), "Virtualizer: initialScrollAlignment must be ScrollAlignment.Start or ScrollAlignment.End")
			assert(p1.autoScrollOnChange == nil or followedEdge(p1.autoScrollOnChange) ~= nil, "Virtualizer: autoScrollOnChange must be AutoScrollPolicy.WhenAtStart or AutoScrollPolicy.WhenAtEnd")
			
			if p1.autoScrollThreshold ~= nil then
				ReachedThresholdModule.validate(p1.autoScrollThreshold, "Virtualizer: autoScrollThreshold")
			end
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
	-- upvalues: FFlagViewRecyclerReact084 (copy), validate (ref), FFlagViewRecyclerReact08 (copy), ScrollAlignmentModule (copy), ReachedThresholdModule (copy), v1 (ref), followedEdge (ref), TypesModule (copy), projectIndex (copy), DiagnosticsModule (copy)
	local Viewport = p1.viewport
	local IsLaidOutFunction = nil
	local Config = nil
	
	if FFlagViewRecyclerReact084 then
		IsLaidOutFunction = p1.isLaidOut
		Config = p1.config
		validate(Config)
	else
		IsLaidOutFunction = nil
		Config = nil
		
		if FFlagViewRecyclerReact08 then
			IsLaidOutFunction = p1.isLaidOut
			Config = p1.config
			validate(Config)
		end
	end
	local Config1 = nil
	local v2 = nil
	local Flag1 = nil
	local Flag2 = nil
	local Flag: boolean? = nil
	local hasItems = nil
	local distanceFrom = nil
	local edgeOffset = nil
	local followThreshold = nil
	local hold = nil
	local holdsItemTarget = nil
	local edgeHolds = nil
	local opensAtInitialEdge = nil
	local observe = nil
	
	if FFlagViewRecyclerReact084 then
		v2 = nil
		Flag1 = false
		Flag2 = true
		Flag = false
		
		hasItems = function(): boolean
			-- upvalues: p1 (copy)
			return p1.getItemSequence().getItemCount() > 0
		end
		
		distanceFrom = function(Start)
			-- upvalues: Viewport (copy), ScrollAlignmentModule (upval)
			local ScrollOffset = Viewport.getScrollOffset()
			
			return if Start == ScrollAlignmentModule.Start then ScrollOffset else math.max(0, Viewport.getContentLength() - Viewport.getLength() - ScrollOffset)
		end
		
		edgeOffset = function(InitialScrollAlignment): number
			-- upvalues: ScrollAlignmentModule (upval), Viewport (copy)
			return if InitialScrollAlignment == ScrollAlignmentModule.Start then 0 else math.max(0, Viewport.getContentLength() - Viewport.getLength())
		end
		
		followThreshold = function()
			-- upvalues: ReachedThresholdModule (upval), Config (ref), Viewport (copy), v1 (upval)
			return ReachedThresholdModule.resolve(Config.autoScrollThreshold, Viewport.getLength(), v1)
		end
		
		hold = function(InitialScrollAlignment)
			-- upvalues: Flag1 (ref), v2 (ref)
			Flag1 = Flag1 and InitialScrollAlignment == v2
			v2 = InitialScrollAlignment
		end
		
		holdsItemTarget = function(): boolean
			-- upvalues: Config1 (ref)
			return Config1 ~= nil and Config1.kind == "itemTarget"
		end
		
		edgeHolds = function(): boolean
			-- upvalues: v2 (ref), holdsItemTarget (ref)
			return v2 ~= nil and not holdsItemTarget()
		end
		
		opensAtInitialEdge = function()
			-- upvalues: Flag2 (ref), Config (ref), hasItems (ref), IsLaidOutFunction (ref)
			return Flag2 and (Config.initialScrollAlignment ~= nil and (hasItems() and IsLaidOutFunction()))
		end
		
		observe = function()
			-- upvalues: followThreshold (ref), v2 (ref), distanceFrom (ref), followedEdge (upval), Config (ref), hold (ref)
			local FollowThresholdResult = followThreshold()
			local v3 = v2
			
			if v3 == nil or distanceFrom(v3) > FollowThresholdResult then
				local FollowedEdgeResult = followedEdge(Config.autoScrollOnChange)
				hold(if FollowedEdgeResult == nil or distanceFrom(FollowedEdgeResult) > FollowThresholdResult then nil else FollowedEdgeResult)
				
				return
			end
		end
	else
		v2 = nil
		Flag1 = nil
		Flag2 = nil
		hasItems = nil
		distanceFrom = nil
		edgeOffset = nil
		followThreshold = nil
		hold = nil
		holdsItemTarget = nil
		edgeHolds = nil
		opensAtInitialEdge = nil
		observe = nil
		
		if FFlagViewRecyclerReact08 then
			v2 = nil
			Flag1 = false
			Flag2 = true
			
			hasItems = function(): boolean
				-- upvalues: p1 (copy)
				return p1.getItemSequence().getItemCount() > 0
			end
			
			distanceFrom = function(Start)
				-- upvalues: Viewport (copy), ScrollAlignmentModule (upval)
				local ScrollOffset = Viewport.getScrollOffset()
				
				return if Start == ScrollAlignmentModule.Start then ScrollOffset else math.max(0, Viewport.getContentLength() - Viewport.getLength() - ScrollOffset)
			end
			
			edgeOffset = function(Start): number
				-- upvalues: ScrollAlignmentModule (upval), Viewport (copy)
				return if Start == ScrollAlignmentModule.Start then 0 else math.max(0, Viewport.getContentLength() - Viewport.getLength())
			end
			
			followThreshold = function()
				-- upvalues: ReachedThresholdModule (upval), Config (ref), Viewport (copy), v1 (upval)
				return ReachedThresholdModule.resolve(Config.autoScrollThreshold, Viewport.getLength(), v1)
			end
			
			hold = function(p2)
				-- upvalues: Flag1 (ref), v2 (ref)
				Flag1 = Flag1 and p2 == v2
				v2 = p2
			end
			
			holdsItemTarget = function(): boolean
				-- upvalues: Config1 (ref)
				return Config1 ~= nil and Config1.kind == "itemTarget"
			end
			
			edgeHolds = function(): boolean
				-- upvalues: v2 (ref), holdsItemTarget (ref)
				return v2 ~= nil and not holdsItemTarget()
			end
			
			opensAtInitialEdge = function()
				-- upvalues: Flag2 (ref), Config (ref), hasItems (ref), IsLaidOutFunction (ref)
				return Flag2 and (Config.initialScrollAlignment ~= nil and (hasItems() and IsLaidOutFunction()))
			end
			
			observe = function()
				-- upvalues: followThreshold (ref), v2 (ref), distanceFrom (ref), followedEdge (upval), Config (ref), hold (ref)
				local FollowThresholdResult = followThreshold()
				local v3 = v2
				
				if v3 == nil or distanceFrom(v3) > FollowThresholdResult then
					local FollowedEdgeResult = followedEdge(Config.autoScrollOnChange)
					hold(if FollowedEdgeResult == nil or distanceFrom(FollowedEdgeResult) > FollowThresholdResult then nil else FollowedEdgeResult)
					
					return
				end
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
		-- upvalues: Config1 (ref), projectIndex (upval), findKeyIndex (copy), p1 (copy)
		local Config = Config1
		
		if Config == nil then return end
		local IndexHint = Config.indexHint
		
		for _, change in DataSourceChange.changes do
			IndexHint = projectIndex(IndexHint, change)
		end
		Config.indexHint = IndexHint
		
		if Config.kind == "itemTarget" or findKeyIndex(Config.key, IndexHint) ~= nil then return end
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
					Config1 = {
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
		Config1 = nil
	end
	
	local function resolve(p3)
		-- upvalues: Config1 (ref), captureViewport (copy), Viewport (copy), findKeyIndex (copy), DiagnosticsModule (upval), FFlagViewRecyclerReact084 (upval), Config (ref), FFlagViewRecyclerReact08 (upval), p1 (copy)
		local Config2 = Config1
		
		if Config2 == nil then
			Config1 = captureViewport(Viewport.getScrollOffset(), nil)
			
			return nil
		end
		local KeyIndex = findKeyIndex(Config2.key, Config2.indexHint)
		
		if KeyIndex == nil then
			Config1 = captureViewport(Viewport.getScrollOffset(), nil)
			
			return nil
		end
		local Source = p3.source
		local ScrollOffset: number = Viewport.getScrollOffset()
		local OffsetForItemResultDelta = nil
		
		if Config2.kind == "itemTarget" then
			Config2.indexHint = KeyIndex
			Source = DiagnosticsModule.ScrollCorrectionSource.ProgrammaticScroll
			OffsetForItemResultDelta = Viewport.offsetForItem(KeyIndex, Config2.alignment) - ScrollOffset
		else
			if not (if FFlagViewRecyclerReact084 then Config.preserveScrollPositionOnChange elseif FFlagViewRecyclerReact08 then Config.preserveScrollPositionOnChange else p1.shouldPreserveUserPosition()) then
				Config1 = captureViewport(ScrollOffset, nil)
				
				return nil
			end
			Config2.indexHint = KeyIndex
			local StartInsetDelta = p3.startInsetDelta or 0
			OffsetForItemResultDelta = Viewport.placedItemLayout(KeyIndex).startOffset - ScrollOffset - Config2.viewportCoordinate - StartInsetDelta
			
			if p3.preserveStartAnchor and ScrollOffset > 0 then
				OffsetForItemResultDelta += StartInsetDelta
			end
		end
		local ClampResultDelta = Viewport.clamp(ScrollOffset + OffsetForItemResultDelta) - ScrollOffset
		
		if Config2.kind == "viewport" then
			local NewScrollOffset = ScrollOffset + (if math.abs(ClampResultDelta) < 1 then 0 else ClampResultDelta)
			local PlacedItemLayoutResult = Viewport.placedItemLayout(KeyIndex)
			local StartOffsetDelta = PlacedItemLayoutResult.startOffset - NewScrollOffset
			local Length = Viewport.getLength()
			Config1 = if StartOffsetDelta < Length and StartOffsetDelta + PlacedItemLayoutResult.length > 0 then {
				kind = "viewport",
				key = Config2.key,
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
		configure = if FFlagViewRecyclerReact084 then function(p3)
			-- upvalues: validate (upval), Config (ref)
			validate(p3)
			Config = p3
		end elseif FFlagViewRecyclerReact08 then function(p3)
			-- upvalues: validate (upval), Config (ref)
			validate(p3)
			Config = p3
		end else nil,
		setItemTarget = function(Value: number, p3)
			-- upvalues: p1 (copy), Config1 (ref), ScrollAlignmentModule (upval)
			local ItemSequence = p1.getItemSequence()
			local ItemCount: number = ItemSequence.getItemCount()
			
			if ItemCount == 0 then
				Config1 = nil
				
				return
			else
				local ClampedValue = math.clamp(Value, 1, ItemCount)
				Config1 = {
					kind = "itemTarget",
					key = ItemSequence.getItemKey(ClampedValue),
					indexHint = ClampedValue,
					alignment = p3 or ScrollAlignmentModule.Start
				}
			end
		end,
		setViewport = function(ScrollOffset)
			-- upvalues: Config1 (ref), captureViewport (copy)
			local Config = Config1
			
			if Config ~= nil and Config.kind == "viewport" then
				local ViewportCoordinateDelta = Config.viewportCoordinate - (ScrollOffset - Config.scrollOffset)
				
				if ViewportCoordinateDelta < Config.viewportLength and ViewportCoordinateDelta + Config.itemLength > 0 then
					Config.viewportCoordinate = ViewportCoordinateDelta
					Config.scrollOffset = ScrollOffset
					
					return
				end
			end
			Config1 = captureViewport(ScrollOffset, nil)
		end,
		observeHost = function(ScrollOffset)
			-- upvalues: FFlagViewRecyclerReact084 (upval), holdsItemTarget (ref), FFlagViewRecyclerReact08 (upval), Config1 (ref), captureViewport (copy)
			if if FFlagViewRecyclerReact084 then not holdsItemTarget() elseif FFlagViewRecyclerReact08 then not holdsItemTarget() else Config1 == nil or Config1.kind == "viewport" then
				local Config = Config1
				
				if Config ~= nil and Config.kind == "viewport" then
					local ViewportCoordinateDelta = Config.viewportCoordinate - (ScrollOffset - Config.scrollOffset)
					
					if ViewportCoordinateDelta < Config.viewportLength and ViewportCoordinateDelta + Config.itemLength > 0 then
						Config.viewportCoordinate = ViewportCoordinateDelta
						Config.scrollOffset = ScrollOffset
						
						return
					end
				end
				Config1 = captureViewport(ScrollOffset, nil)
			end
		end,
		scrolledProgrammatically = if FFlagViewRecyclerReact084 then function(p3)
			-- upvalues: Flag2 (ref), v2 (ref), Flag1 (ref)
			Flag2 = false
			
			if p3 ~= nil then
				v2 = p3
				Flag1 = true
			end
		end elseif FFlagViewRecyclerReact08 then function(p3)
			-- upvalues: Flag2 (ref), v2 (ref), Flag1 (ref)
			Flag2 = false
			
			if p3 ~= nil then
				v2 = p3
				Flag1 = true
			end
		end else nil,
		beginMotion = if FFlagViewRecyclerReact084 then function()
			-- upvalues: Flag2 (ref), v2 (ref), Flag1 (ref), Flag (ref), holdsItemTarget (ref), Config1 (ref), captureViewport (copy), Viewport (copy)
			Flag2 = false
			v2 = nil
			Flag1 = false
			Flag = true
			
			if holdsItemTarget() then
				Config1 = captureViewport(Viewport.getScrollOffset(), nil)
			end
		end else nil,
		endMotion = if FFlagViewRecyclerReact084 then function()
			-- upvalues: Flag (ref)
			Flag = false
		end else nil,
		restore = function(p3, ScrollOffset)
			-- upvalues: findKeyIndex (copy), Config1 (ref), captureViewport (copy)
			Config1 = captureViewport(ScrollOffset, if p3.anchorKey == nil then nil else findKeyIndex(p3.anchorKey, p3.anchorIndex))
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
		preserve = function(p3, Callback: () -> ())
			-- upvalues: FFlagViewRecyclerReact084 (upval), followedEdge (upval), Config (ref), Flag (ref), distanceFrom (ref), followThreshold (ref), FFlagViewRecyclerReact08 (upval), prepareDataChange (copy), captureEvidence (copy), holdsItemTarget (ref), opensAtInitialEdge (ref), hold (ref), Flag1 (ref), resolve (copy), edgeHolds (ref), Viewport (copy), Config1 (ref), captureViewport (copy)
			local DataSourceChange = nil
			local FollowedEdgeResult = nil
			local IsDistanceFromResultBelow = nil
			if FFlagViewRecyclerReact084 then
				DataSourceChange = p3.dataSourceChange
				FollowedEdgeResult = followedEdge(Config.autoScrollOnChange)
				IsDistanceFromResultBelow = DataSourceChange ~= nil and (not Flag and (FollowedEdgeResult ~= nil and distanceFrom(FollowedEdgeResult) <= followThreshold()))
			else
				DataSourceChange = nil
				FollowedEdgeResult = nil
				IsDistanceFromResultBelow = nil
				
				if FFlagViewRecyclerReact08 then
					DataSourceChange = p3.dataSourceChange
					FollowedEdgeResult = followedEdge(Config.autoScrollOnChange)
					IsDistanceFromResultBelow = DataSourceChange ~= nil and (FollowedEdgeResult ~= nil and distanceFrom(FollowedEdgeResult) <= followThreshold())
				end
			end
			if (if FFlagViewRecyclerReact084 then DataSourceChange elseif FFlagViewRecyclerReact08 then DataSourceChange else p3.dataSourceChange) ~= nil then
				prepareDataChange(if FFlagViewRecyclerReact084 then DataSourceChange elseif FFlagViewRecyclerReact08 then DataSourceChange else p3.dataSourceChange, (captureEvidence()))
			end
			Callback()
			
			if FFlagViewRecyclerReact084 then
				if DataSourceChange ~= nil and not holdsItemTarget() and not opensAtInitialEdge() then
					if IsDistanceFromResultBelow then
						hold(FollowedEdgeResult)
					elseif not Flag1 then
						hold(nil)
					end
				end
				local ResolveResult = resolve(p3)
				
				if ResolveResult == nil or not edgeHolds() and not opensAtInitialEdge() then
					return ResolveResult
				end
				local ScrollOffset = Viewport.getScrollOffset()
				local Config2 = Config1
				repeat
					if Config2 ~= nil and Config2.kind == "viewport" then
						local ViewportCoordinateDelta = Config2.viewportCoordinate - (ScrollOffset - Config2.scrollOffset)
						
						if ViewportCoordinateDelta < Config2.viewportLength and ViewportCoordinateDelta + Config2.itemLength > 0 then
							Config2.viewportCoordinate = ViewportCoordinateDelta
							Config2.scrollOffset = ScrollOffset
							break
						end
					end
					Config1 = captureViewport(ScrollOffset, nil)
				until true
				return nil
			else
				if not FFlagViewRecyclerReact08 then
					return (resolve(p3))
				end
				if DataSourceChange ~= nil and not holdsItemTarget() and not opensAtInitialEdge() then
					if IsDistanceFromResultBelow then
						hold(FollowedEdgeResult)
					elseif not Flag1 then
						hold(nil)
					end
				end
				local ResolveResult = resolve(p3)
				
				if ResolveResult == nil or not edgeHolds() and not opensAtInitialEdge() then
					return ResolveResult
				end
				local ScrollOffset = Viewport.getScrollOffset()
				local Config3 = Config1
				repeat
					if Config3 ~= nil and Config3.kind == "viewport" then
						local ViewportCoordinateDelta = Config3.viewportCoordinate - (ScrollOffset - Config3.scrollOffset)
						
						if ViewportCoordinateDelta < Config3.viewportLength and ViewportCoordinateDelta + Config3.itemLength > 0 then
							Config3.viewportCoordinate = ViewportCoordinateDelta
							Config3.scrollOffset = ScrollOffset
							break
						end
					end
					Config1 = captureViewport(ScrollOffset, nil)
				until true
				return nil
			end
		end,
		settle = if FFlagViewRecyclerReact084 then function(p3, Callback: (any) -> ())
			-- upvalues: Flag2 (ref), hasItems (ref), IsLaidOutFunction (ref), Config (ref), hold (ref), edgeOffset (ref), v2 (ref), edgeHolds (ref), holdsItemTarget (ref), Viewport (copy), Flag (ref), observe (ref)
			if Flag2 and hasItems() and IsLaidOutFunction() then
				Flag2 = false
				local InitialScrollAlignment = Config.initialScrollAlignment
				
				if InitialScrollAlignment ~= nil then
					hold(InitialScrollAlignment)
					Callback(edgeOffset(InitialScrollAlignment))
					
					return
				end
			end
			local v3 = v2
			
			if p3.dataChange == nil then
				local IsLaidOut = IsLaidOutFunction()
				local EdgeOffsetResult = if p3.replaced then 0 elseif p3.contentLengthChanged and v3 ~= nil and edgeHolds() then edgeOffset(v3) else nil
				
				if p3.viewportChanged then
					local KeptDistanceFromEnd = p3.keptDistanceFromEnd
					
					if IsLaidOut and v3 ~= nil and edgeHolds() then
						EdgeOffsetResult = edgeOffset(v3)
					elseif KeptDistanceFromEnd ~= nil and not holdsItemTarget() then
						EdgeOffsetResult = Viewport.getContentLength() - Viewport.getLength() - KeptDistanceFromEnd
					end
				end
				if EdgeOffsetResult ~= nil then
					Callback(EdgeOffsetResult)
				end
				if IsLaidOut and not Flag and (p3.replaced or p3.viewportChanged or p3.scrollMoved) then
					observe()
				end
				return
			elseif v3 ~= nil and edgeHolds() then
				Callback(edgeOffset(v3))
			end
		end elseif FFlagViewRecyclerReact08 then function(p3, Callback: (any) -> ())
			-- upvalues: Flag2 (ref), hasItems (ref), IsLaidOutFunction (ref), Config (ref), hold (ref), edgeOffset (ref), v2 (ref), edgeHolds (ref), holdsItemTarget (ref), Viewport (copy), observe (ref)
			if Flag2 and hasItems() and IsLaidOutFunction() then
				Flag2 = false
				local InitialScrollAlignment = Config.initialScrollAlignment
				
				if InitialScrollAlignment ~= nil then
					hold(InitialScrollAlignment)
					Callback(edgeOffset(InitialScrollAlignment))
					
					return
				end
			end
			local v3 = v2
			
			if p3.dataChange == nil then
				local IsLaidOut = IsLaidOutFunction()
				local EdgeOffsetResult = if p3.replaced then 0 elseif p3.contentLengthChanged and v3 ~= nil and edgeHolds() then edgeOffset(v3) else nil
				
				if p3.viewportChanged then
					local KeptDistanceFromEnd = p3.keptDistanceFromEnd
					
					if IsLaidOut and v3 ~= nil and edgeHolds() then
						EdgeOffsetResult = edgeOffset(v3)
					elseif KeptDistanceFromEnd ~= nil and not holdsItemTarget() then
						EdgeOffsetResult = Viewport.getContentLength() - Viewport.getLength() - KeptDistanceFromEnd
					end
				end
				if EdgeOffsetResult ~= nil then
					Callback(EdgeOffsetResult)
				end
				if IsLaidOut and (p3.replaced or p3.viewportChanged or p3.scrollMoved) then
					observe()
				end
				return
			elseif v3 ~= nil and edgeHolds() then
				Callback(edgeOffset(v3))
			end
		end else nil,
		getAnchoredItem = function()
			-- upvalues: Config1 (ref), FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), p1 (copy), v2 (ref), Viewport (copy), ScrollAlignmentModule (upval), Config (ref)
			local Config2 = Config1
			
			if if FFlagViewRecyclerReact084 then Config2 ~= nil and Config2.kind == "itemTarget" elseif FFlagViewRecyclerReact08 then Config2 ~= nil and Config2.kind == "itemTarget" else Config2 == nil or Config2.kind == "viewport" and not p1.shouldPreserveUserPosition() then
				local IndexHint = if FFlagViewRecyclerReact084 then Config2.indexHint elseif FFlagViewRecyclerReact08 then Config2.indexHint else nil
				
				return if FFlagViewRecyclerReact084 then if IndexHint == nil then nil else table.freeze({ index = IndexHint, alignment = Config2.alignment }) elseif FFlagViewRecyclerReact08 then if IndexHint == nil then nil else table.freeze({ index = IndexHint, alignment = Config2.alignment }) else nil
			end
			local Start = if FFlagViewRecyclerReact084 then v2 else nil
			
			if if FFlagViewRecyclerReact084 then Viewport.getContentLength() <= Viewport.getLength() else FFlagViewRecyclerReact08 then
				if FFlagViewRecyclerReact084 then
					local ContentAlignment = Viewport.getContentAlignment()
					
					if ContentAlignment == ScrollAlignmentModule.Start then
						Start = ScrollAlignmentModule.Start
					elseif ContentAlignment == ScrollAlignmentModule.End then
						Start = ScrollAlignmentModule.End
					end
				else
					Start = v2
					
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
					elseif Config2 == nil or not Config.preserveScrollPositionOnChange then
						return nil
					end
				end
			end
			if FFlagViewRecyclerReact084 then
				if Start ~= nil then
					local ItemCount = p1.getItemSequence().getItemCount()
					
					return if ItemCount == 0 then nil else table.freeze({
						index = if Start == ScrollAlignmentModule.Start then 1 else ItemCount,
						alignment = Start
					})
				elseif Config2 == nil or not Config.preserveScrollPositionOnChange then
					return nil
				end
			end
			local IndexHint = Config2.indexHint
			
			return if FFlagViewRecyclerReact084 then if IndexHint == nil then nil else table.freeze({
				index = IndexHint,
				alignment = ScrollAlignmentModule.Start
			}) elseif FFlagViewRecyclerReact08 then if IndexHint == nil then nil else table.freeze({
				index = IndexHint,
				alignment = ScrollAlignmentModule.Start
			}) elseif IndexHint == nil then nil else table.freeze({
				index = IndexHint,
				alignment = if Config2.kind == "itemTarget" then Config2.alignment else ScrollAlignmentModule.Start
			})
		end,
		dataSourceReplaced = if FFlagViewRecyclerReact084 then function()
			-- upvalues: Config1 (ref), v2 (ref), Flag1 (ref), Flag2 (ref)
			Config1 = nil
			v2 = nil
			Flag1 = false
			Flag2 = true
		end elseif FFlagViewRecyclerReact08 then function()
			-- upvalues: Config1 (ref), v2 (ref), Flag1 (ref), Flag2 (ref)
			Config1 = nil
			v2 = nil
			Flag1 = false
			Flag2 = true
		end else nil,
		reset = function()
			-- upvalues: Config1 (ref)
			Config1 = nil
		end,
		allowsPolicyOffset = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else function(): boolean
			-- upvalues: Config1 (ref)
			return Config1 == nil or Config1.kind == "viewport"
		end
	}
end