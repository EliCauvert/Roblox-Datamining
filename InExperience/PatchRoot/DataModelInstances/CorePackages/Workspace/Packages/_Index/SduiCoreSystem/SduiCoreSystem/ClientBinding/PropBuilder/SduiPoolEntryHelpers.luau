local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.Signals)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiPoolStoreModule = require(sduiCoreSystem.ClientBinding.SduiPoolStore)
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local _ = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local sduiListEntryRendererModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryRenderer)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local fFlagSduiCollectionGridRevealRows = require(parent.SharedFlags).FFlagSduiCollectionGridRevealRows

local function resolvePoolDataGetter(p1, p2, p3, p4)
	-- upvalues: sduiPropUtilsModule (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local var1 = sduiPropUtilsModule.generateDynamicBindingPropValue(p1, p2, p3, p4)
	
	return function(p1)
		-- upvalues: var1 (ref)
		return var1(p1).data
	end
end

local function buildPoolEntryConfigs(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local entries = p1.entries
	
	if typeof(entries) ~= "table" then
		return nil
	end
	local t = {}
	local var1 = false
	
	for i, v in entries do
		if typeof(i) == "string" and typeof(v) == "table" then
			local collectionItemSize = v.collection_item_size
			local var2 = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
			
			if var2 ~= nil then
				t[i] = { collectionItemSize = var2 }
				var1 = true
			end
		end
	end
	return if var1 then t else nil
end

local function normalizePoolData(p1)
	if p1 == nil or next(p1) == nil then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		local t_1 = {}
		local t_2 = {}
		local var1 = false
		
		if typeof(v.items) == "table" then
			for i_1, v_1 in v.items do
				if typeof(v_1) == "table" then
					local kind = v_1.kind
					local var2 = if typeof(kind) == "table" then kind.value else nil
					
					if typeof(var2) == "table" then
						t_1[i_1] = var2
					end
					local layout = v_1.layout
					
					if typeof(layout) == "table" then
						local var3
						local colSpan = layout.colSpan or layout.col_span
						local rowSpan = layout.rowSpan or layout.row_span
						local alignmentType = layout.alignmentType or layout.alignment_type
						local var4 = tonumber(layout.minRowPadding or layout.min_row_padding)
						
						if colSpan ~= nil then
							var3 = true
							
							if colSpan == 1 then
								if rowSpan ~= nil then
									var3 = true
									
									if rowSpan == 1 then
										if alignmentType ~= nil then
											var3 = true
											
											if alignmentType == "" then
												var3 = var4 ~= nil and var4 > 0
											end
										end
									end
								end
							end
							if var3 then
								t_2[i_1] = {
									colSpan = colSpan,
									rowSpan = rowSpan,
									alignmentType = alignmentType,
									minRowPadding = var4
								}
								var1 = true
							end
						end
					end
				end
			end
		end
		local collectionItemSize = v.collection_item_size
		t[i] = {
			items = t_1,
			layouts = if var1 then t_2 else nil,
			collectionItemSize = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
		}
	end
	return t
end

local function poolSectionFromEntry(p1)
	local identifier = p1.identifier
	
	if typeof(identifier) ~= "string" then
		return nil
	end
	local poolId = nil
	local maxVisibleRows = nil
	local item = p1.item
	
	if typeof(item) == "table" then
		local var1 = item
		local inputData = var1.input_data
		
		if inputData and inputData.kind and inputData.kind.value then
			var1 = inputData.kind.value
		end
		poolId = var1.pool_id
		maxVisibleRows = var1.max_visible_rows
	end
	return {
		sectionId = identifier,
		poolId = poolId,
		numberOfRows = if maxVisibleRows == -1 and poolId ~= nil then -1 elseif typeof(maxVisibleRows) == "number" and maxVisibleRows > 0 then maxVisibleRows else 1
	}
end

local function computePoolSections(p1)
	-- upvalues: poolSectionFromEntry (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = poolSectionFromEntry(v)
		
		if var1 ~= nil then
			table.insert(t, var1)
		end
	end
	return t
end

local function sectionsHaveMultiRow(p1)
	for i, v in p1 do
		if v.numberOfRows ~= 1 then
			return true
		end
	end
	return false
end

local function applyPoolEntryConfigs(p1, p2)
	if p2 == nil then return end
	for i, v in p2 do
		local var1 = p1[i]
		
		if var1 ~= nil and var1.collectionItemSize == nil and v.collectionItemSize ~= nil then
			var1.collectionItemSize = v.collectionItemSize
		end
	end
end

local function ingestPoolSections(p1, p2, p3, p4)
	-- upvalues: sduiPoolStoreModule (ref), normalizePoolData (ref), applyPoolEntryConfigs (ref)
	local configKey = p3.configKey
	
	if configKey == nil or #p1 == 0 then
		return nil
	end
	local sduiPoolStore = sduiPoolStoreModule.getSduiPoolStore(configKey)
	sduiPoolStore.setSections(p1)
	local var1 = if p2 ~= nil then nil else normalizePoolData(p2)
	
	if var1 ~= nil then
		applyPoolEntryConfigs(var1, p4)
		sduiPoolStore.setPools(var1)
	end
	return sduiPoolStore
end

return {
	resolvePoolDataGetter = resolvePoolDataGetter,
	buildPoolEntryConfigs = buildPoolEntryConfigs,
	applyPoolEntryConfigs = applyPoolEntryConfigs,
	normalizePoolData = normalizePoolData,
	poolSectionFromEntry = poolSectionFromEntry,
	computePoolSections = computePoolSections,
	sectionsHaveMultiRow = sectionsHaveMultiRow,
	ingestPoolSections = ingestPoolSections,
	createPoolEntryFns = function(p1, p2, p3, p4, p5, p6, p7)
		-- upvalues: ingestPoolSections (ref), fFlagSduiCollectionGridRevealRows (ref), sduiListEntryRendererModule (ref)
		local var1 = ingestPoolSections(p1, p6, p4, p7)
		local var2 = nil
		local var3 = nil
		
		if var1 ~= nil then
			local t = {}
			
			for i, v in p1 do
				if v.poolId ~= nil then
					t[v.sectionId] = true
				end
			end
			var2 = function(p1)
				-- upvalues: t (ref), var1 (ref)
				local identifier = p1.identifier
				
				return if typeof(identifier) == "string" and t[identifier] then { _section = { cells = var1.getSectionCells(identifier) } } else nil
			end
			
			var3 = function(p1, _)
				-- upvalues: var1 (ref), fFlagSduiCollectionGridRevealRows (copy)
				local identifier = p1.identifier
				
				return if typeof(identifier) == "string" then {
					_requiresDataBinding = true,
					startRowGetter = var1.getSectionStartRow(identifier),
					setDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p1)
						-- upvalues: var1 (copy), identifier (ref)
						var1.setSectionDisplayedRowCount(identifier, p1)
					end else nil
				} else nil
			end
		end
		return {
			inputSlicer = sduiListEntryRendererModule.createInputSlicer(p2, p3, p4, p5, var2),
			entryConfigExtrasFn = var3
		}
	end
}