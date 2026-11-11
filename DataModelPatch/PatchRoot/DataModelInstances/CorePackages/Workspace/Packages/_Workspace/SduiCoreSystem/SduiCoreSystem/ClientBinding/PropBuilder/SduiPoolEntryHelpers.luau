local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.Signals)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiPoolStoreModule = require(SduiCoreSystem.ClientBinding.SduiPoolStore)
local _ = require(SduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local _ = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local SduiListEntryRendererModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryRenderer)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function normalizePoolData(List)
	if List == nil or next(List) == nil then
		return nil
	end
	local t = {}
	
	for i, value in List do
		local Items = {}
		local t1 = {}
		local Flag = false
		
		if typeof(value.items) == "table" then
			for i1, item in value.items do
				if typeof(item) == "table" then
					local Kind = item.kind
					local Value = if typeof(Kind) == "table" then Kind.value else nil
					
					if typeof(Value) == "table" then
						Items[i1] = Value
					end
					local Layout = item.layout
					
					if typeof(Layout) == "table" then
						local ColSpan = Layout.colSpan or Layout.col_span
						local RowSpan = Layout.rowSpan or Layout.row_span
						local AlignmentType = Layout.alignmentType or Layout.alignment_type
						local Number: number? = tonumber(Layout.minRowPadding or Layout.min_row_padding)
						
						if if ColSpan == nil then if RowSpan == nil then if AlignmentType == nil then Number ~= nil and Number > 0 else AlignmentType ~= "" or Number ~= nil and Number > 0 else RowSpan ~= 1 or (if AlignmentType == nil then Number ~= nil and Number > 0 else AlignmentType ~= "" or Number ~= nil and Number > 0) else ColSpan ~= 1 or (if RowSpan == nil then if AlignmentType == nil then Number ~= nil and Number > 0 else AlignmentType ~= "" or Number ~= nil and Number > 0 else RowSpan ~= 1 or (if AlignmentType == nil then Number ~= nil and Number > 0 else AlignmentType ~= "" or Number ~= nil and Number > 0)) then
							t1[i1] = {
								colSpan = ColSpan,
								rowSpan = RowSpan,
								alignmentType = AlignmentType,
								minRowPadding = Number
							}
							Flag = true
						end
					end
				end
			end
		end
		local CollectionItemSize = value.collection_item_size
		t[i] = {
			items = Items,
			layouts = if Flag then t1 else nil,
			collectionItemSize = if typeof(CollectionItemSize) == "string" and CollectionItemSize ~= "" then CollectionItemSize else nil
		}
	end
	return t
end

local function poolSectionFromEntry(p1)
	local Identifier = p1.identifier
	
	if typeof(Identifier) ~= "string" then
		return nil
	end
	local PoolId = nil
	local MaxVisibleRows = nil
	local Item = p1.item
	
	if typeof(Item) == "table" then
		local Item1 = Item
		local InputData = Item1.input_data
		
		if InputData and InputData.kind and InputData.kind.value then
			Item1 = InputData.kind.value
		end
		PoolId = Item1.pool_id
		MaxVisibleRows = Item1.max_visible_rows
	end
	return {
		sectionId = Identifier,
		poolId = PoolId,
		numberOfRows = if MaxVisibleRows == -1 and PoolId ~= nil then -1 elseif typeof(MaxVisibleRows) == "number" and MaxVisibleRows > 0 then MaxVisibleRows else 1
	}
end

local function applyPoolEntryConfigs(p1, List)
	if List == nil then return end
	for i, value in List do
		local v1 = p1[i]
		
		if v1 ~= nil and v1.collectionItemSize == nil and value.collectionItemSize ~= nil then
			v1.collectionItemSize = value.collectionItemSize
		end
	end
end

local function ingestPoolSections(p2, p3, p4, p5)
	-- upvalues: SduiPoolStoreModule (copy), normalizePoolData (copy), applyPoolEntryConfigs (copy)
	local ConfigKey = p4.configKey
	
	if ConfigKey == nil or #p2 == 0 then
		return nil
	end
	local SduiPoolStore = SduiPoolStoreModule.getSduiPoolStore(ConfigKey)
	SduiPoolStore.setSections(p2)
	local NormalizePoolDataResult = if p3 == nil then nil else normalizePoolData(p3)
	
	if NormalizePoolDataResult ~= nil then
		applyPoolEntryConfigs(NormalizePoolDataResult, p5)
		SduiPoolStore.setPools(NormalizePoolDataResult)
	end
	return SduiPoolStore
end

return {
	resolvePoolDataGetter = function(p2, p3, p4, p5)
		-- upvalues: SduiPropUtilsModule (copy)
		if p2 == nil or p2 == "" then
			return nil
		else
			local DynamicBindingPropValue = SduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p4, p5)
			
			return function(p6)
				-- upvalues: DynamicBindingPropValue (copy)
				return DynamicBindingPropValue(p6).data
			end
		end
	end,
	buildPoolEntryConfigs = function(p2)
		if typeof(p2) ~= "table" then
			return nil
		end
		local Entries = p2.entries
		
		if typeof(Entries) ~= "table" then
			return nil
		end
		local t = {}
		local Flag = false
		
		for i, entry in Entries do
			if typeof(i) == "string" and typeof(entry) == "table" then
				local CollectionItemSize = entry.collection_item_size
				local CollectionItemSize1 = if typeof(CollectionItemSize) == "string" and CollectionItemSize ~= "" then CollectionItemSize else nil
				
				if CollectionItemSize1 ~= nil then
					t[i] = { collectionItemSize = CollectionItemSize1 }
					Flag = true
				end
			end
		end
		return if Flag then t else nil
	end,
	applyPoolEntryConfigs = applyPoolEntryConfigs,
	normalizePoolData = normalizePoolData,
	poolSectionFromEntry = poolSectionFromEntry,
	computePoolSections = function(List)
		-- upvalues: poolSectionFromEntry (copy)
		local List1 = {}
		
		for _, value in List do
			local PoolSectionFromEntryResult = poolSectionFromEntry(value)
			
			if PoolSectionFromEntryResult ~= nil then
				table.insert(List1, PoolSectionFromEntryResult)
			end
		end
		return List1
	end,
	sectionsHaveMultiRow = function(List): boolean
		for _, value in List do
			if value.numberOfRows ~= 1 then
				return true
			end
		end
		return false
	end,
	ingestPoolSections = ingestPoolSections,
	createPoolEntryFns = function(List, p3, p4, p5, p6, p7, p8)
		-- upvalues: ingestPoolSections (copy), SduiListEntryRendererModule (copy)
		local IngestPoolSectionsResult = ingestPoolSections(List, p7, p5, p8)
		local v2: ((any) -> any)? = nil
		local EntryConfigExtrasFn: ((any, any) -> any)? = nil
		
		if IngestPoolSectionsResult ~= nil then
			local t = {}
			
			for _, value in List do
				if value.poolId ~= nil then
					t[value.sectionId] = true
				end
			end
			v2 = function(p9)
				-- upvalues: t (copy), IngestPoolSectionsResult (copy)
				local Identifier = p9.identifier
				
				return if typeof(Identifier) == "string" and t[Identifier] then {
					_section = {
						cells = IngestPoolSectionsResult.getSectionCells(Identifier)
					}
				} else nil
			end
			
			EntryConfigExtrasFn = function(p9, _)
				-- upvalues: IngestPoolSectionsResult (copy)
				local Identifier = p9.identifier
				
				return if typeof(Identifier) == "string" then {
					_requiresDataBinding = true,
					startRowGetter = IngestPoolSectionsResult.getSectionStartRow(Identifier)
				} else nil
			end
		end
		return {
			inputSlicer = SduiListEntryRendererModule.createInputSlicer(p3, p4, p5, p6, v2),
			entryConfigExtrasFn = EntryConfigExtrasFn
		}
	end
}