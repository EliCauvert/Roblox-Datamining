local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SignalsModule = require(Parent.Signals)
local CollectionViewsModule = require(Parent.CollectionViews)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local SduiPoolStoreLayoutModule = require(SduiCoreSystem.ClientBinding.SduiPoolStoreLayout)
local GetMainCollectionLayoutStoreFunction = CollectionViewsModule.getMainCollectionLayoutStore
local ProcessOneGridFunction = CollectionViewsModule.processOneGrid
local MakePoolGetSpanConfigFunction = SduiPoolStoreLayoutModule.makePoolGetSpanConfig
local LayoutToCellsFunction = SduiPoolStoreLayoutModule.layoutToCells
local CellsEqual = SduiPoolStoreLayoutModule.cellsEqual
local EMPTYCELLS = SduiPoolStoreLayoutModule.EMPTY_CELLS
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local FFlagSduiCollectionGridRevealRows = require(Parent.SharedFlags).FFlagSduiCollectionGridRevealRows
local FFlagSduiSkipFeedAnalyticsPosition = require(Parent.SharedFlags).FFlagSduiSkipFeedAnalyticsPosition
local FFlagSduiPerSectionPoolSizing = require(Parent.SharedFlags).FFlagSduiPerSectionPoolSizing
local FFlagSduiVerticalFeedProgressiveFillOnScroll = require(Parent.SharedFlags).FFlagSduiVerticalFeedProgressiveFillOnScroll
local FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui = require(Parent.SharedFlags).FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui
local Frozen = table.freeze({})

local function logSkipped(Item, p1, p2) --[[ Line: 87 ]]
	-- upvalues: SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy)
	local OnSkipped = p1 and p1.onSkipped
	local OneByTwoTileFlowId = Item and Item.oneByTwoTileFlowId
	
	if OnSkipped and Item and typeof(OneByTwoTileFlowId) == "string" then
		local Success, Result = pcall(function() --[[ Line: 91 ]]
			-- upvalues: OnSkipped (copy), OneByTwoTileFlowId (copy), Item (copy)
			OnSkipped({
				componentType = "OneByTwoTile",
				isSdui = true,
				oneByTwoTileFlowId = OneByTwoTileFlowId,
				contentType = Item.contentType,
				adId = Item.adId
			})
			
			return nil
		end)
		
		if not Success then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.CodeError, {
				name = "OneByTwoTileSkipped",
				message = SduiParseHelpersModule.stringifyValue(Result)
			}, p2)
		end
	end
end

local function sectionConfigsEqual(p1, p2): boolean --[[ Line: 110 ]]
	-- upvalues: FFlagSduiSkipFeedAnalyticsPosition (copy), FFlagSduiPerSectionPoolSizing (copy)
	return p1 == p2 or p1 ~= nil and p2 ~= nil and (p1.poolId == p2.poolId and p1.numberOfRows == p2.numberOfRows and (if FFlagSduiSkipFeedAnalyticsPosition then p1.doesNotAdvanceStartRow == p2.doesNotAdvanceStartRow and (if FFlagSduiPerSectionPoolSizing then p1.entryCollectionItemSize == p2.entryCollectionItemSize and (if FFlagSduiPerSectionPoolSizing then p1.templateCollectionItemSize == p2.templateCollectionItemSize and (p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId) else p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId) elseif FFlagSduiPerSectionPoolSizing then p1.templateCollectionItemSize == p2.templateCollectionItemSize and (p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId) else p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId) elseif FFlagSduiPerSectionPoolSizing then p1.entryCollectionItemSize == p2.entryCollectionItemSize and (if FFlagSduiPerSectionPoolSizing then p1.templateCollectionItemSize == p2.templateCollectionItemSize and (p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId) else p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId) elseif FFlagSduiPerSectionPoolSizing then p1.templateCollectionItemSize == p2.templateCollectionItemSize and (p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId) else p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId))
end

local function _(p1, p2, p3) --[[ Line: 130 | Named "getSectionCollectionItemSize" ]]
	local CollectionItemSize = p2.collectionItemSize
	
	if typeof(CollectionItemSize) == "string" and p1.getItemsPerRow[CollectionItemSize] ~= nil then
		return CollectionItemSize
	end
	local EntryCollectionItemSize = p3.entryCollectionItemSize
	
	if typeof(EntryCollectionItemSize) == "string" and p1.getItemsPerRow[EntryCollectionItemSize] ~= nil then
		return EntryCollectionItemSize
	else
		local TemplateCollectionItemSize = p3.templateCollectionItemSize
		
		return if typeof(TemplateCollectionItemSize) == "string" and p1.getItemsPerRow[TemplateCollectionItemSize] ~= nil then TemplateCollectionItemSize else "Medium"
	end
end

local function createSduiPoolStore(Key) --[[ Line: 162 ]]
	-- upvalues: FFlagSduiCollectionGridRevealRows (copy), SignalsModule (copy), sectionConfigsEqual (copy), GetMainCollectionLayoutStoreFunction (copy), FFlagSduiPerSectionPoolSizing (copy), Frozen (copy), EMPTYCELLS (copy), MakePoolGetSpanConfigFunction (copy), ProcessOneGridFunction (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), LayoutToCellsFunction (copy), FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), logSkipped (copy), FFlagSduiSkipFeedAnalyticsPosition (copy), CellsEqual (copy), FFlagSduiVerticalFeedProgressiveFillOnScroll (copy)
	local t = {}
	local t1 = {}
	local T = if FFlagSduiCollectionGridRevealRows then {} else nil
	local t2 = {}
	local t3 = {}
	local T1 = if FFlagSduiCollectionGridRevealRows then {} else nil
	local t4 = {}
	local t5 = {}
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local v1 = nil
	
	local function _(Key) --[[ Line: 183 | Named "getOrCreatePoolSignal" ]]
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { get = Signal, set = Signal2 }
			t[Key] = Entry
		end
		return Entry
	end
	
	local _ = function(Key) --[[ Line: 193 | Named "getOrCreateSectionConfigSignal" ]]
		-- upvalues: t1 (copy), SignalsModule (upval), sectionConfigsEqual (upval)
		local Entry = t1[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
			Entry = { get = Signal, set = Signal2 }
			t1[Key] = Entry
		end
		return Entry
	end
	
	local Callback = if FFlagSduiCollectionGridRevealRows then function(Key) --[[ Line: 205 ]]
		-- upvalues: T (copy), SignalsModule (upval)
		local Entry = T[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { get = Signal, set = Signal2 }
			T[Key] = Entry
		end
		return Entry
	end else nil
	local _ = nil
	
	local function v44(Key1) --[[ Line: 219 ]]
		-- upvalues: t2 (copy), SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), t (copy), Signal (copy), GetMainCollectionLayoutStoreFunction (upval), FFlagSduiPerSectionPoolSizing (upval), Frozen (upval), v44 (ref), EMPTYCELLS (upval), MakePoolGetSpanConfigFunction (upval), ProcessOneGridFunction (upval), FFlagLuaAppEnableNxMRoduxApportioning (upval), LayoutToCellsFunction (upval), FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (upval), v1 (ref), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), Key (copy), logSkipped (upval)
		local Entry = t2[Key1]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p1) --[[ Line: 224 ]]
				-- upvalues: Key1 (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), t (upval), Signal (upval), GetMainCollectionLayoutStoreFunction (upval), FFlagSduiPerSectionPoolSizing (upval), Frozen (upval), v44 (upval), EMPTYCELLS (upval), MakePoolGetSpanConfigFunction (upval), ProcessOneGridFunction (upval), FFlagLuaAppEnableNxMRoduxApportioning (upval), LayoutToCellsFunction (upval), FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (upval), v1 (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), Key (upval), logSkipped (upval)
				local Entry = t1[Key1]
				
				if Entry == nil then
					local Signal1, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					Entry = { get = Signal1, set = Signal2 }
					t1[Key1] = Entry
				end
				local GetResult = Entry.get(p1)
				
				if GetResult == nil or GetResult.poolId == nil then
					return nil
				end
				local PoolId = GetResult.poolId
				local Entry1 = t[PoolId]
				
				if Entry1 == nil then
					local Signal3, Signal2_1 = SignalsModule.createSignal(nil)
					Entry1 = { get = Signal3, set = Signal2_1 }
					t[PoolId] = Entry1
				end
				local GetResult1 = Entry1.get(p1)
				
				if GetResult1 == nil or #GetResult1.items == 0 then
					return nil
				end
				local SignalResult = Signal(p1) or GetMainCollectionLayoutStoreFunction(p1)
				local CollectionItemSize1 = nil
				
				if FFlagSduiPerSectionPoolSizing then
					local CollectionItemSize = GetResult1.collectionItemSize
					
					if typeof(CollectionItemSize) == "string" and SignalResult.getItemsPerRow[CollectionItemSize] ~= nil then
						CollectionItemSize1 = CollectionItemSize
					else
						local EntryCollectionItemSize = GetResult.entryCollectionItemSize
						
						if typeof(EntryCollectionItemSize) == "string" and SignalResult.getItemsPerRow[EntryCollectionItemSize] ~= nil then
							CollectionItemSize1 = EntryCollectionItemSize
						else
							local TemplateCollectionItemSize = GetResult.templateCollectionItemSize
							CollectionItemSize1 = if typeof(TemplateCollectionItemSize) == "string" and SignalResult.getItemsPerRow[TemplateCollectionItemSize] ~= nil then TemplateCollectionItemSize else "Medium"
						end
					end
				else
					CollectionItemSize1 = if typeof(GetResult1.collectionItemSize) == "string" and SignalResult.getItemsPerRow[GetResult1.collectionItemSize] ~= nil then GetResult1.collectionItemSize else "Medium"
				end
				local v2: number = SignalResult.getItemsPerRow[CollectionItemSize1](p1)
				
				if v2 <= 0 then
					return nil
				end
				local NextStartIndex = 1
				local PendingSpanTiles = Frozen
				
				if GetResult.prevSectionInPoolId ~= nil then
					local v3 = v44(GetResult.prevSectionInPoolId)(p1)
					
					if v3 == nil then
						return nil
					end
					NextStartIndex = v3.nextStartIndex
					PendingSpanTiles = v3.pendingSpanTiles
				end
				local NumberOfRows = GetResult.numberOfRows
				
				if NumberOfRows <= 0 then
					NumberOfRows = 1e999
				end
				if GetResult1.layouts == nil and #PendingSpanTiles == 0 then
					local Largest = math.max(0, #GetResult1.items - NextStartIndex + 1)
					local Smallest = math.min(if NumberOfRows == 1e999 then Largest else NumberOfRows * v2, Largest)
					
					if Smallest == 0 then
						return {
							actualRowCount = 0,
							cells = EMPTYCELLS,
							nextStartIndex = NextStartIndex,
							pendingSpanTiles = Frozen
						}
					end
					local Ceiled = math.ceil(Smallest / v2)
					local Cells = {}
					
					for i2 = 0, Smallest - 1 do
						local NewNextStartIndex = NextStartIndex + i2
						Cells[i2 + 1] = {
							item = GetResult1.items[NewNextStartIndex],
							realIndex = NewNextStartIndex
						}
					end
					for i3 = Smallest + 1, Ceiled * v2 do
						Cells[i3] = {}
					end
					return {
						cells = Cells,
						actualRowCount = Ceiled,
						nextStartIndex = NextStartIndex + Smallest,
						pendingSpanTiles = Frozen
					}
				else
					local ProcessOneGridResult = ProcessOneGridFunction(GetResult1.items, NextStartIndex, PendingSpanTiles, v2, NumberOfRows, if GetResult1.layouts == nil then nil else MakePoolGetSpanConfigFunction(GetResult1.layouts), not FFlagLuaAppEnableNxMRoduxApportioning)
					local LayoutToCellsResult, LayoutToCellsResult2 = LayoutToCellsFunction(ProcessOneGridResult.layout, v2, GetResult1.items, GetResult1.layouts)
					
					if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then
						local OnPlaced = v1 and v1.onPlaced
						for i1, value1 in LayoutToCellsResult do
							local Item = value1.item
							local OneByTwoTileFlowId = Item and Item.oneByTwoTileFlowId
							
							if OnPlaced and (Item and typeof(OneByTwoTileFlowId) == "string") then
								local Success, Result = pcall(function() --[[ Line: 316 ]]
									-- upvalues: OnPlaced (copy), OneByTwoTileFlowId (copy), Item (copy), i1 (copy), v2 (copy)
									OnPlaced({
										componentType = "OneByTwoTile",
										isSdui = true,
										oneByTwoTileFlowId = OneByTwoTileFlowId,
										contentType = Item.contentType,
										adId = Item.adId,
										gridRow = math.ceil(i1 / v2),
										gridCol = (i1 - 1) % v2 + 1
									})
									
									return nil
								end)
								
								if not Success then
									SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.CodeError, {
										name = "OneByTwoTilePlaced",
										message = SduiParseHelpersModule.stringifyValue(Result)
									}, Key)
								end
							end
						end
						local Flag = false
						
						for i4, value2 in t1 do
							if i4 ~= Key1 then
								local GetResult2 = value2.get(false)
								
								if GetResult2 and GetResult2.prevSectionInPoolId == Key1 then
									Flag = true
									break
								end
							end
						end
						if not Flag then
							for _, pendingSpanTile in ProcessOneGridResult.pendingSpanTiles do
								logSkipped(GetResult1.items[pendingSpanTile.index], v1, Key)
							end
							local t6 = {}
							
							for _, value in LayoutToCellsResult do
								local Item = value.item
								local OneByTwoTileFlowId = Item and Item.oneByTwoTileFlowId
								
								if typeof(OneByTwoTileFlowId) == "string" then
									t6[OneByTwoTileFlowId] = true
								end
							end
							for i = ProcessOneGridResult.nextStartIndex, #GetResult1.items do
								local Item = GetResult1.items[i]
								local OneByTwoTileFlowId = Item and Item.oneByTwoTileFlowId
								
								if typeof(OneByTwoTileFlowId) == "string" and not t6[OneByTwoTileFlowId] then
									logSkipped(Item, v1, Key)
								end
							end
						end
					end
					return {
						cells = LayoutToCellsResult,
						actualRowCount = LayoutToCellsResult2,
						nextStartIndex = ProcessOneGridResult.nextStartIndex,
						pendingSpanTiles = ProcessOneGridResult.pendingSpanTiles
					}
				end
			end)
			t6[Key1] = Computed
			
			return Computed
		else
			return Entry
		end
	end
	
	local function getRowCountComputed(Key) --[[ Line: 382 ]]
		-- upvalues: t3 (copy), SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), v44 (ref)
		local Entry = t3[Key]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2) --[[ Line: 387 ]]
				-- upvalues: Key (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v44 (upval)
				local v4 = t1[Key]
				
				if v4 == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					v4 = { get = Signal, set = Signal2 }
					t1[Key] = v4
				end
				local GetResult = v4.get(p2)
				
				if GetResult == nil then
					return 0
				elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
					return GetResult.numberOfRows
				else
					local v5 = v44(Key)(p2)
					
					return if v5 == nil then 0 else v5.actualRowCount
				end
			end)
			t3[Key] = Computed
			
			return Computed
		else
			return Entry
		end
	end
	
	local _ = function(Key) --[[ Line: 402 | Named "getDisplayedRowCountComputed" ]]
		-- upvalues: T1 (copy), SignalsModule (upval), t3 (copy), t1 (copy), sectionConfigsEqual (upval), v44 (ref), Callback (ref)
		local Entry = T1[Key]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2): number --[[ Line: 407 ]]
				-- upvalues: Key (copy), t3 (upval), SignalsModule (upval), t1 (upval), sectionConfigsEqual (upval), v44 (upval), Callback (upval)
				local v4 = t3[Key]
				local Callback = nil
				
				if v4 == nil then
					local Computed = SignalsModule.createComputed(function(p3) --[[ Line: 387 ]]
						-- upvalues: Key (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v44 (upval)
						local v5 = t1[Key]
						
						if v5 == nil then
							local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
							v5 = { get = Signal, set = Signal2 }
							t1[Key] = v5
						end
						local GetResult = v5.get(p3)
						
						if GetResult == nil then
							return 0
						elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
							return GetResult.numberOfRows
						else
							local v6 = v44(Key)(p3)
							
							return if v6 == nil then 0 else v6.actualRowCount
						end
					end)
					t3[Key] = Computed
					Callback = Computed
				else
					Callback = v4
				end
				local CallbackResult: number = Callback(p2)
				local GetResult: number = Callback(Key).get(p2)
				
				return if GetResult == nil then CallbackResult else math.min(math.max(math.floor(GetResult), 0), CallbackResult)
			end)
			T1[Key] = Computed
			
			return Computed
		else
			return Entry
		end
	end
	
	local _ = nil
	
	local function GetSectionStartRow(Key) --[[ Line: 423 ]]
		-- upvalues: t4 (copy), SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), GetSectionStartRow (ref), FFlagSduiSkipFeedAnalyticsPosition (upval), FFlagSduiCollectionGridRevealRows (upval), T1 (copy), t3 (copy), v44 (ref), Callback (ref)
		local Entry = t4[Key]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2): number --[[ Line: 428 ]]
				-- upvalues: Key (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), GetSectionStartRow (upval), FFlagSduiSkipFeedAnalyticsPosition (upval), FFlagSduiCollectionGridRevealRows (upval), T1 (upval), t3 (upval), v44 (upval), Callback (upval)
				local Entry = t1[Key]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					Entry = { get = Signal, set = Signal2 }
					t1[Key] = Entry
				end
				local GetResult = Entry.get(p2)
				
				if GetResult == nil or GetResult.prevSectionId == nil then
					return 1
				end
				local v4: number = GetSectionStartRow(GetResult.prevSectionId)(p2)
				local GetResult1 = nil
				
				if FFlagSduiSkipFeedAnalyticsPosition then
					local PrevSectionId = GetResult.prevSectionId
					local Entry1 = t1[PrevSectionId]
					
					if Entry1 == nil then
						local Signal1, Signal2_1 = SignalsModule.createSignal(nil, sectionConfigsEqual)
						Entry1 = { get = Signal1, set = Signal2_1 }
						t1[PrevSectionId] = Entry1
					end
					GetResult1 = Entry1.get(p2)
				else
					GetResult1 = nil
				end
				local v5 = nil
				if FFlagSduiSkipFeedAnalyticsPosition and GetResult1 ~= nil and GetResult1.doesNotAdvanceStartRow then
					v5 = 0
				elseif FFlagSduiCollectionGridRevealRows then
					local PrevSectionId = GetResult.prevSectionId
					local Entry2 = T1[PrevSectionId]
					local Callback1 = nil
					
					if Entry2 == nil then
						local Computed = SignalsModule.createComputed(function(p3): number --[[ Line: 407 ]]
							-- upvalues: PrevSectionId (copy), t3 (upval), SignalsModule (upval), t1 (upval), sectionConfigsEqual (upval), v44 (upval), Callback (upval)
							local v6 = t3[PrevSectionId]
							local Callback = nil
							
							if v6 == nil then
								local Computed = SignalsModule.createComputed(function(p4) --[[ Line: 387 ]]
									-- upvalues: PrevSectionId (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v44 (upval)
									local v7 = t1[PrevSectionId]
									
									if v7 == nil then
										local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
										v7 = { get = Signal, set = Signal2 }
										t1[PrevSectionId] = v7
									end
									local GetResult = v7.get(p4)
									
									if GetResult == nil then
										return 0
									elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
										return GetResult.numberOfRows
									else
										local v8 = v44(PrevSectionId)(p4)
										
										return if v8 == nil then 0 else v8.actualRowCount
									end
								end)
								t3[PrevSectionId] = Computed
								Callback = Computed
							else
								Callback = v6
							end
							local CallbackResult: number = Callback(p3)
							local GetResult: number = Callback(PrevSectionId).get(p3)
							
							return if GetResult == nil then CallbackResult else math.min(math.max(math.floor(GetResult), 0), CallbackResult)
						end)
						T1[PrevSectionId] = Computed
						Callback1 = Computed
					else
						Callback1 = Entry2
					end
					v5 = Callback1(p2)
				else
					local PrevSectionId1 = GetResult.prevSectionId
					local Entry1 = t3[PrevSectionId1]
					local Callback2 = nil
					
					if Entry1 == nil then
						local Computed = SignalsModule.createComputed(function(p3) --[[ Line: 387 ]]
							-- upvalues: PrevSectionId1 (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v44 (upval)
							local v6 = t1[PrevSectionId1]
							
							if v6 == nil then
								local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
								v6 = { get = Signal, set = Signal2 }
								t1[PrevSectionId1] = v6
							end
							local GetResult = v6.get(p3)
							
							if GetResult == nil then
								return 0
							elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
								return GetResult.numberOfRows
							else
								local v7 = v44(PrevSectionId1)(p3)
								
								return if v7 == nil then 0 else v7.actualRowCount
							end
						end)
						t3[PrevSectionId1] = Computed
						Callback2 = Computed
					else
						Callback2 = Entry1
					end
					v5 = Callback2(p2)
				end
				return v4 + v5
			end)
			t4[Key] = Computed
			
			return Computed
		else
			return Entry
		end
	end
	
	return {
		getSectionInfo = function(Key) --[[ Line: 471 ]]
			-- upvalues: SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), t5 (copy), v44 (ref), EMPTYCELLS (upval), CellsEqual (upval), GetSectionStartRow (ref), t3 (copy)
			return SignalsModule.createComputed(function(p2) --[[ Line: 472 ]]
				-- upvalues: Key (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), t5 (upval), v44 (upval), EMPTYCELLS (upval), CellsEqual (upval), GetSectionStartRow (upval), t3 (upval)
				local Entry = t1[Key]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					Entry = { get = Signal, set = Signal2 }
					t1[Key] = Entry
				end
				if Entry.get(p2) == nil then
					return nil
				end
				local t = {}
				local Entry1 = t5[Key]
				local Callback = nil
				
				if Entry1 == nil then
					local Computed = SignalsModule.createComputed(function(p3) --[[ Line: 459 ]]
						-- upvalues: v44 (upval), Key (copy), EMPTYCELLS (upval)
						local v4 = v44(Key)(p3)
						
						return if v4 == nil then EMPTYCELLS else v4.cells
					end, CellsEqual)
					t5[Key] = Computed
					Callback = Computed
				else
					Callback = Entry1
				end
				t.cells = Callback(p2)
				t.startRow = GetSectionStartRow(Key)(p2)
				local Entry2 = t3[Key]
				local Callback1 = nil
				
				if Entry2 == nil then
					local Computed = SignalsModule.createComputed(function(p3) --[[ Line: 387 ]]
						-- upvalues: Key (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v44 (upval)
						local v4 = t1[Key]
						
						if v4 == nil then
							local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
							v4 = { get = Signal, set = Signal2 }
							t1[Key] = v4
						end
						local GetResult = v4.get(p3)
						
						if GetResult == nil then
							return 0
						elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
							return GetResult.numberOfRows
						else
							local v5 = v44(Key)(p3)
							
							return if v5 == nil then 0 else v5.actualRowCount
						end
					end)
					t3[Key] = Computed
					Callback1 = Computed
				else
					Callback1 = Entry2
				end
				t.actualRowCount = Callback1(p2)
				
				return t
			end)
		end,
		getSectionStartRow = GetSectionStartRow,
		getSectionRowCount = if FFlagSduiVerticalFeedProgressiveFillOnScroll then getRowCountComputed else nil,
		getSectionCells = function(Key) --[[ Line: 454 ]]
			-- upvalues: t5 (copy), SignalsModule (upval), v44 (ref), EMPTYCELLS (upval), CellsEqual (upval)
			local Entry = t5[Key]
			
			if Entry == nil then
				local Computed = SignalsModule.createComputed(function(p2) --[[ Line: 459 ]]
					-- upvalues: v44 (upval), Key (copy), EMPTYCELLS (upval)
					local v4 = v44(Key)(p2)
					
					return if v4 == nil then EMPTYCELLS else v4.cells
				end, CellsEqual)
				t5[Key] = Computed
				
				return Computed
			else
				return Entry
			end
		end,
		setSectionDisplayedRowCount = if FFlagSduiCollectionGridRevealRows then function(p2, p3) --[[ Line: 529 ]]
			-- upvalues: Callback (ref)
			Callback(p2).set(p3)
		end else nil,
		setPools = function(List) --[[ Line: 489 ]]
			-- upvalues: t (copy), SignalsModule (upval)
			for i, value in List do
				local Entry = t[i]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil)
					Entry = { get = Signal, set = Signal2 }
					t[i] = Entry
				end
				Entry.set(value)
			end
		end,
		setSections = function(List) --[[ Line: 496 ]]
			-- upvalues: t1 (copy), SignalsModule (upval), sectionConfigsEqual (upval), FFlagSduiSkipFeedAnalyticsPosition (upval)
			local SectionIds = {}
			local PrevSectionId = nil
			
			for _, value in List do
				local SectionId = value.sectionId
				local PoolId = value.poolId
				local PrevSectionInPoolId = nil
				
				if PoolId ~= nil then
					PrevSectionInPoolId = SectionIds[PoolId]
					SectionIds[PoolId] = SectionId
				end
				local Entry = t1[SectionId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					Entry = { get = Signal, set = Signal2 }
					t1[SectionId] = Entry
				end
				local SetFunction: (any) -> () = Entry.set
				local config = {
					poolId = PoolId,
					numberOfRows = value.numberOfRows,
					doesNotAdvanceStartRow = if FFlagSduiSkipFeedAnalyticsPosition then value.doesNotAdvanceStartRow else nil,
					entryCollectionItemSize = value.entryCollectionItemSize,
					templateCollectionItemSize = value.templateCollectionItemSize,
					prevSectionInPoolId = PrevSectionInPoolId
				}
				config.prevSectionId = PrevSectionId
				SetFunction(config)
				PrevSectionId = SectionId
			end
		end,
		setLayoutStore = function(p2) --[[ Line: 535 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p2)
		end,
		setOneByTwoTileFunnelListener = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then function(p2) --[[ Line: 539 ]]
			-- upvalues: v1 (ref)
			v1 = p2
		end else nil
	}
end

local self = setmetatable({}, { __mode = "v" })

return {
	getSduiPoolStore = function(Key) --[[ Line: 549 ]]
		-- upvalues: self (copy), FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (copy), createSduiPoolStore (copy)
		local SelfEntry = self[Key]
		
		if SelfEntry == nil then
			local SduiPoolStore = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then createSduiPoolStore(Key) else createSduiPoolStore()
			self[Key] = SduiPoolStore
			
			return SduiPoolStore
		else
			return SelfEntry
		end
	end
}