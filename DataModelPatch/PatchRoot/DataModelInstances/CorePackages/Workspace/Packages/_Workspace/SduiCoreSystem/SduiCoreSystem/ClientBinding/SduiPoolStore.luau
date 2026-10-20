local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SignalsModule = require(Parent.Signals)
local CollectionViewsModule = require(Parent.CollectionViews)
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local _ = require(SduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local SduiPoolStoreLayoutModule = require(SduiCoreSystem.ClientBinding.SduiPoolStoreLayout)
local GetMainCollectionLayoutStoreFunction = CollectionViewsModule.getMainCollectionLayoutStore
local ProcessOneGridFunction = CollectionViewsModule.processOneGrid
local MakePoolGetSpanConfigFunction = SduiPoolStoreLayoutModule.makePoolGetSpanConfig
local LayoutToCellsFunction = SduiPoolStoreLayoutModule.layoutToCells
local CellsEqual = SduiPoolStoreLayoutModule.cellsEqual
local EMPTYCELLS = SduiPoolStoreLayoutModule.EMPTY_CELLS
local Frozen = table.freeze({})

local function sectionConfigsEqual(p1, p2): boolean
	return p1 == p2 or p1 ~= nil and p2 ~= nil and (p1.poolId == p2.poolId and (p1.numberOfRows == p2.numberOfRows and p1.prevSectionInPoolId == p2.prevSectionInPoolId) and p1.prevSectionId == p2.prevSectionId)
end

local function createSduiPoolStore()
	-- upvalues: SignalsModule (copy), sectionConfigsEqual (copy), GetMainCollectionLayoutStoreFunction (copy), Frozen (copy), EMPTYCELLS (copy), MakePoolGetSpanConfigFunction (copy), ProcessOneGridFunction (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), LayoutToCellsFunction (copy), CellsEqual (copy)
	local t = {}
	local t1 = {}
	local t2 = {}
	local t3 = {}
	local t4 = {}
	local t5 = {}
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	local function _(Key)
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { get = Signal, set = Signal2 }
			t[Key] = Entry
		end
		return Entry
	end
	
	local _ = function(Key)
		-- upvalues: t1 (copy), SignalsModule (upval), sectionConfigsEqual (upval)
		local Entry = t1[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
			Entry = { get = Signal, set = Signal2 }
			t1[Key] = Entry
		end
		return Entry
	end
	
	local _ = nil
	
	local function v24(PrevSectionInPoolId)
		-- upvalues: t2 (copy), SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), t (copy), Signal (copy), GetMainCollectionLayoutStoreFunction (upval), Frozen (upval), v24 (ref), EMPTYCELLS (upval), MakePoolGetSpanConfigFunction (upval), ProcessOneGridFunction (upval), FFlagLuaAppEnableNxMRoduxApportioning (upval), LayoutToCellsFunction (upval)
		local Entry = t2[PrevSectionInPoolId]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p1)
				-- upvalues: PrevSectionInPoolId (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), t (upval), Signal (upval), GetMainCollectionLayoutStoreFunction (upval), Frozen (upval), v24 (upval), EMPTYCELLS (upval), MakePoolGetSpanConfigFunction (upval), ProcessOneGridFunction (upval), FFlagLuaAppEnableNxMRoduxApportioning (upval), LayoutToCellsFunction (upval)
				local Entry = t1[PrevSectionInPoolId]
				
				if Entry == nil then
					local Signal1, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					Entry = { get = Signal1, set = Signal2 }
					t1[PrevSectionInPoolId] = Entry
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
				local v1: number = SignalResult.getItemsPerRow[if typeof(GetResult1.collectionItemSize) == "string" and SignalResult.getItemsPerRow[GetResult1.collectionItemSize] ~= nil then GetResult1.collectionItemSize else "Medium"](p1)
				
				if v1 <= 0 then
					return nil
				end
				local NextStartIndex = 1
				local PendingSpanTiles = Frozen
				
				if GetResult.prevSectionInPoolId ~= nil then
					local v2 = v24(GetResult.prevSectionInPoolId)(p1)
					
					if v2 == nil then
						return nil
					end
					NextStartIndex = v2.nextStartIndex
					PendingSpanTiles = v2.pendingSpanTiles
				end
				local NumberOfRows = GetResult.numberOfRows
				
				if NumberOfRows <= 0 then
					NumberOfRows = 1e999
				end
				if GetResult1.layouts ~= nil or #PendingSpanTiles ~= 0 then
					local ProcessOneGridResult = ProcessOneGridFunction(GetResult1.items, NextStartIndex, PendingSpanTiles, v1, NumberOfRows, if GetResult1.layouts == nil then nil else MakePoolGetSpanConfigFunction(GetResult1.layouts), not FFlagLuaAppEnableNxMRoduxApportioning)
					local LayoutToCellsResult, LayoutToCellsResult2 = LayoutToCellsFunction(ProcessOneGridResult.layout, v1, GetResult1.items, GetResult1.layouts)
					
					return {
						cells = LayoutToCellsResult,
						actualRowCount = LayoutToCellsResult2,
						nextStartIndex = ProcessOneGridResult.nextStartIndex,
						pendingSpanTiles = ProcessOneGridResult.pendingSpanTiles
					}
				end
				local Largest = math.max(0, #GetResult1.items - NextStartIndex + 1)
				local Smallest = math.min(if NumberOfRows == 1e999 then Largest else NumberOfRows * v1, Largest)
				
				if Smallest == 0 then
					return {
						actualRowCount = 0,
						cells = EMPTYCELLS,
						nextStartIndex = NextStartIndex,
						pendingSpanTiles = Frozen
					}
				end
				local Ceiled = math.ceil(Smallest / v1)
				local Cells = {}
				
				for i = 0, Smallest - 1 do
					local NewNextStartIndex = NextStartIndex + i
					Cells[i + 1] = {
						item = GetResult1.items[NewNextStartIndex],
						realIndex = NewNextStartIndex
					}
				end
				for i1 = Smallest + 1, Ceiled * v1 do
					Cells[i1] = {}
				end
				return {
					cells = Cells,
					actualRowCount = Ceiled,
					nextStartIndex = NextStartIndex + Smallest,
					pendingSpanTiles = Frozen
				}
			end)
			t2[PrevSectionInPoolId] = Computed
			
			return Computed
		else
			return Entry
		end
	end
	
	local _ = function(Key)
		-- upvalues: t3 (copy), SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), v24 (ref)
		local Entry = t3[Key]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2)
				-- upvalues: Key (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v24 (upval)
				local v3 = t1[Key]
				
				if v3 == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					v3 = { get = Signal, set = Signal2 }
					t1[Key] = v3
				end
				local GetResult = v3.get(p2)
				
				if GetResult == nil then
					return 0
				elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
					return GetResult.numberOfRows
				else
					local v4 = v24(Key)(p2)
					
					return if v4 == nil then 0 else v4.actualRowCount
				end
			end)
			t3[Key] = Computed
			
			return Computed
		else
			return Entry
		end
	end
	
	local _ = nil
	
	local function GetSectionStartRow(PrevSectionId)
		-- upvalues: t4 (copy), SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), GetSectionStartRow (ref), t3 (copy), v24 (ref)
		local Entry = t4[PrevSectionId]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2)
				-- upvalues: PrevSectionId (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), GetSectionStartRow (upval), t3 (upval), v24 (upval)
				local Entry = t1[PrevSectionId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					Entry = { get = Signal, set = Signal2 }
					t1[PrevSectionId] = Entry
				end
				local GetResult = Entry.get(p2)
				
				if GetResult == nil or GetResult.prevSectionId == nil then
					return 1
				end
				local v3 = GetSectionStartRow(GetResult.prevSectionId)(p2)
				local PrevSectionId1 = GetResult.prevSectionId
				local Entry1 = t3[PrevSectionId1]
				local Callback = nil
				
				if Entry1 == nil then
					local Computed = SignalsModule.createComputed(function(p3)
						-- upvalues: PrevSectionId1 (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v24 (upval)
						local v4 = t1[PrevSectionId1]
						
						if v4 == nil then
							local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
							v4 = { get = Signal, set = Signal2 }
							t1[PrevSectionId1] = v4
						end
						local GetResult = v4.get(p3)
						
						if GetResult == nil then
							return 0
						elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
							return GetResult.numberOfRows
						else
							local v5 = v24(PrevSectionId1)(p3)
							
							return if v5 == nil then 0 else v5.actualRowCount
						end
					end)
					t3[PrevSectionId1] = Computed
					Callback = Computed
				else
					Callback = Entry1
				end
				return v3 + Callback(p2)
			end)
			t4[PrevSectionId] = Computed
			
			return Computed
		else
			return Entry
		end
	end
	
	return {
		getSectionInfo = function(p2)
			-- upvalues: SignalsModule (upval), t1 (copy), sectionConfigsEqual (upval), t5 (copy), v24 (ref), EMPTYCELLS (upval), CellsEqual (upval), GetSectionStartRow (ref), t3 (copy)
			return SignalsModule.createComputed(function(p3)
				-- upvalues: p2 (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), t5 (upval), v24 (upval), EMPTYCELLS (upval), CellsEqual (upval), GetSectionStartRow (upval), t3 (upval)
				local Entry = t1[p2]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
					Entry = { get = Signal, set = Signal2 }
					t1[p2] = Entry
				end
				if Entry.get(p3) == nil then
					return nil
				end
				local t = {}
				local Entry1 = t5[p2]
				local Callback = nil
				
				if Entry1 == nil then
					local Computed = SignalsModule.createComputed(function(p4)
						-- upvalues: v24 (upval), p2 (copy), EMPTYCELLS (upval)
						local v3 = v24(p2)(p4)
						
						return if v3 == nil then EMPTYCELLS else v3.cells
					end, CellsEqual)
					t5[p2] = Computed
					Callback = Computed
				else
					Callback = Entry1
				end
				t.cells = Callback(p3)
				t.startRow = GetSectionStartRow(p2)(p3)
				local Entry2 = t3[p2]
				local Callback1 = nil
				
				if Entry2 == nil then
					local Computed = SignalsModule.createComputed(function(p4)
						-- upvalues: p2 (copy), t1 (upval), SignalsModule (upval), sectionConfigsEqual (upval), v24 (upval)
						local v3 = t1[p2]
						
						if v3 == nil then
							local Signal, Signal2 = SignalsModule.createSignal(nil, sectionConfigsEqual)
							v3 = { get = Signal, set = Signal2 }
							t1[p2] = v3
						end
						local GetResult = v3.get(p4)
						
						if GetResult == nil then
							return 0
						elseif GetResult.poolId == nil or GetResult.numberOfRows > 0 then
							return GetResult.numberOfRows
						else
							local v4 = v24(p2)(p4)
							
							return if v4 == nil then 0 else v4.actualRowCount
						end
					end)
					t3[p2] = Computed
					Callback1 = Computed
				else
					Callback1 = Entry2
				end
				t.actualRowCount = Callback1(p3)
				
				return t
			end)
		end,
		getSectionStartRow = GetSectionStartRow,
		getSectionCells = function(Key)
			-- upvalues: t5 (copy), SignalsModule (upval), v24 (ref), EMPTYCELLS (upval), CellsEqual (upval)
			local Entry = t5[Key]
			
			if Entry == nil then
				local Computed = SignalsModule.createComputed(function(p2)
					-- upvalues: v24 (upval), Key (copy), EMPTYCELLS (upval)
					local v3 = v24(Key)(p2)
					
					return if v3 == nil then EMPTYCELLS else v3.cells
				end, CellsEqual)
				t5[Key] = Computed
				
				return Computed
			else
				return Entry
			end
		end,
		setPools = function(List)
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
		setSections = function(List)
			-- upvalues: t1 (copy), SignalsModule (upval), sectionConfigsEqual (upval)
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
				Entry.set({
					poolId = PoolId,
					numberOfRows = value.numberOfRows,
					prevSectionInPoolId = PrevSectionInPoolId,
					prevSectionId = PrevSectionId
				})
				PrevSectionId = SectionId
			end
		end,
		setLayoutStore = function(p2)
			-- upvalues: Signal2 (copy)
			Signal2(p2)
		end
	}
end

local self = setmetatable({}, { __mode = "v" })

return {
	getSduiPoolStore = function(Key)
		-- upvalues: self (copy), createSduiPoolStore (copy)
		local SelfEntry = self[Key]
		
		if SelfEntry == nil then
			local SduiPoolStore = createSduiPoolStore()
			self[Key] = SduiPoolStore
			
			return SduiPoolStore
		else
			return SelfEntry
		end
	end
}