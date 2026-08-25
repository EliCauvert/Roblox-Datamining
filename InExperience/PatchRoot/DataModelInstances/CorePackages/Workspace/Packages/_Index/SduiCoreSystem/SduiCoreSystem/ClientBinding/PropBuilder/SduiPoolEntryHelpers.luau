local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(sduiCoreSystem.Parent.Signals)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiPoolStoreModule = require(sduiCoreSystem.ClientBinding.SduiPoolStore)
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local _ = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local sduiListEntryRendererModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryRenderer)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

local function resolvePoolDataGetter(p0, p1, p2, p3)
	-- upvalues: sduiPropUtilsModule (ref)
	if p0 == nil or p0 == "" then
		return nil
	end
	local var12 = sduiPropUtilsModule.generateDynamicBindingPropValue(p0, p1, p2, p3)
	
	return function(p4)
		-- upvalues: var12 (ref)
		return var12(p4).data
	end
end

local function buildPoolEntryConfigs(p5)
	if typeof(p5) ~= "table" then
		return nil
	end
	local entries = p5.entries
	
	if typeof(entries) ~= "table" then
		return nil
	end
	local t = {}
	local var14 = false
	
	for i, v in entries do
		if typeof(i) == "string" and typeof(v) == "table" then
			local collectionItemSize = v.collection_item_size
			local var15 = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
			
			if var15 ~= nil then
				t[i] = { collectionItemSize = var15 }
				var14 = true
			end
		end
	end
	return if var14 then t else nil
end

local function normalizePoolData(p6)
	if p6 == nil or next(p6) == nil then
		return nil
	end
	local t = {}
	
	for i, v in p6 do
		local t_1 = {}
		local t_2 = {}
		local var19 = false
		
		if typeof(v.items) == "table" then
			for i_1, v_1 in v.items do
				if typeof(v_1) == "table" then
					local kind = v_1.kind
					local var20 = if typeof(kind) == "table" then kind.value else nil
					
					if typeof(var20) == "table" then
						t_1[i_1] = var20
					end
					local layout = v_1.layout
					
					if typeof(layout) == "table" then
						local var25
						local colSpan = layout.colSpan or layout.col_span
						local rowSpan = layout.rowSpan or layout.row_span
						local alignmentType = layout.alignmentType or layout.alignment_type
						local var24 = tonumber(layout.minRowPadding or layout.min_row_padding)
						
						if colSpan ~= nil then
							var25 = true
							
							if colSpan == 1 then
								if rowSpan ~= nil then
									var25 = true
									
									if rowSpan == 1 then
										if alignmentType ~= nil then
											var25 = true
											
											if alignmentType == "" then
												var25 = var24 ~= nil and var24 > 0
											end
										end
									end
								end
							end
							if var25 then
								t_2[i_1] = {
									colSpan = colSpan,
									rowSpan = rowSpan,
									alignmentType = alignmentType,
									minRowPadding = var24
								}
								var19 = true
							end
						end
					end
				end
			end
		end
		local collectionItemSize = v.collection_item_size
		t[i] = {
			items = t_1,
			layouts = if var19 then t_2 else nil,
			collectionItemSize = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
		}
	end
	return t
end

local function poolSectionFromEntry(p7)
	local identifier = p7.identifier
	
	if typeof(identifier) ~= "string" then
		return nil
	end
	local poolId = nil
	local maxVisibleRows = nil
	local item = p7.item
	
	if typeof(item) == "table" then
		local var26 = item
		local inputData = var26.input_data
		
		if inputData and inputData.kind and inputData.kind.value then
			var26 = inputData.kind.value
		end
		poolId = var26.pool_id
		maxVisibleRows = var26.max_visible_rows
	end
	return {
		sectionId = identifier,
		poolId = poolId,
		numberOfRows = if maxVisibleRows == -1 and poolId ~= nil then -1 elseif typeof(maxVisibleRows) == "number" and maxVisibleRows > 0 then maxVisibleRows else 1
	}
end

local function computePoolSections(p8)
	-- upvalues: poolSectionFromEntry (ref)
	local t = {}
	
	for i, v in p8 do
		local var28 = poolSectionFromEntry(v)
		
		if var28 ~= nil then
			table.insert(t, var28)
		end
	end
	return t
end

local function sectionsHaveMultiRow(p9)
	for i, v in p9 do
		if v.numberOfRows ~= 1 then
			return true
		end
	end
	return false
end

local function applyPoolEntryConfigs(p10, p11)
	if p11 == nil then return end
	for i, v in p11 do
		local var29 = p10[i]
		
		if var29 ~= nil and var29.collectionItemSize == nil and v.collectionItemSize ~= nil then
			var29.collectionItemSize = v.collectionItemSize
		end
	end
end

local function ingestPoolSections(p12, p13, p14, p15)
	-- upvalues: sduiPoolStoreModule (ref), normalizePoolData (ref), applyPoolEntryConfigs (ref)
	local configKey = p14.configKey
	
	if configKey == nil or #p12 == 0 then
		return nil
	end
	local sduiPoolStore = sduiPoolStoreModule.getSduiPoolStore(configKey)
	sduiPoolStore.setSections(p12)
	local var31 = if p13 ~= nil then nil else normalizePoolData(p13)
	
	if var31 ~= nil then
		applyPoolEntryConfigs(var31, p15)
		sduiPoolStore.setPools(var31)
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
	createPoolEntryFns = function(p16, p17, p18, p19, p20, p21, p22)
		-- upvalues: ingestPoolSections (ref), sduiListEntryRendererModule (ref)
		local var32 = ingestPoolSections(p16, p21, p19, p22)
		local var33 = nil
		local var34 = nil
		
		if var32 ~= nil then
			local t = {}
			
			for i, v in p16 do
				if v.poolId ~= nil then
					t[v.sectionId] = true
				end
			end
			var33 = function(p23)
				-- upvalues: t (ref), var32 (ref)
				local identifier = p23.identifier
				
				return if typeof(identifier) == "string" and t[identifier] then { _section = { cells = var32.getSectionCells(identifier) } } else nil
			end
			
			var34 = function(p24, _)
				-- upvalues: var32 (ref)
				local identifier = p24.identifier
				
				return if typeof(identifier) == "string" then {
					_requiresDataBinding = true,
					startRowGetter = var32.getSectionStartRow(identifier)
				} else nil
			end
		end
		return {
			inputSlicer = sduiListEntryRendererModule.createInputSlicer(p17, p18, p19, p20, var33),
			entryConfigExtrasFn = var34
		}
	end
}