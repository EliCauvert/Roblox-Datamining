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
local fFlagSduiVerticalFeedProgressiveFillOnScroll = require(parent.SharedFlags).FFlagSduiVerticalFeedProgressiveFillOnScroll

local function resolvePoolDataGetter(p1, p2, p3, p4)
	-- upvalues: sduiPropUtilsModule (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local var1 = sduiPropUtilsModule.generateDynamicBindingPropValue(p1, p2, p3, p4)
	
	return function(p5)
		-- upvalues: var1 (ref)
		return var1(p5).data
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

local function normalizePoolData(p2)
	if p2 == nil or next(p2) == nil then
		return nil
	end
	local t = {}
	
	for i, v in p2 do
		local t_1 = {}
		local t_2 = {}
		local var3 = false
		
		if typeof(v.items) == "table" then
			for i_1, v_1 in v.items do
				if typeof(v_1) == "table" then
					local kind = v_1.kind
					local var4 = if typeof(kind) == "table" then kind.value else nil
					
					if typeof(var4) == "table" then
						t_1[i_1] = var4
					end
					local layout = v_1.layout
					
					if typeof(layout) == "table" then
						local var5
						local colSpan = layout.colSpan or layout.col_span
						local rowSpan = layout.rowSpan or layout.row_span
						local alignmentType = layout.alignmentType or layout.alignment_type
						local var6 = tonumber(layout.minRowPadding or layout.min_row_padding)
						
						if colSpan ~= nil then
							var5 = true
							
							if colSpan == 1 then
								if rowSpan ~= nil then
									var5 = true
									
									if rowSpan == 1 then
										if alignmentType ~= nil then
											var5 = true
											
											if alignmentType == "" then
												var5 = var6 ~= nil and var6 > 0
											end
										end
									end
								end
							end
							if var5 then
								t_2[i_1] = {
									colSpan = colSpan,
									rowSpan = rowSpan,
									alignmentType = alignmentType,
									minRowPadding = var6
								}
								var3 = true
							end
						end
					end
				end
			end
		end
		local collectionItemSize = v.collection_item_size
		t[i] = {
			items = t_1,
			layouts = if var3 then t_2 else nil,
			collectionItemSize = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
		}
	end
	return t
end

local function poolSectionFromEntry(p3)
	local identifier = p3.identifier
	
	if typeof(identifier) ~= "string" then
		return nil
	end
	local poolId = nil
	local maxVisibleRows = nil
	local item = p3.item
	
	if typeof(item) == "table" then
		local var7 = item
		local inputData = var7.input_data
		
		if inputData and inputData.kind and inputData.kind.value then
			var7 = inputData.kind.value
		end
		poolId = var7.pool_id
		maxVisibleRows = var7.max_visible_rows
	end
	return {
		sectionId = identifier,
		poolId = poolId,
		numberOfRows = if maxVisibleRows == -1 and poolId ~= nil then -1 elseif typeof(maxVisibleRows) == "number" and maxVisibleRows > 0 then maxVisibleRows else 1
	}
end

local function computePoolSections(p3)
	-- upvalues: poolSectionFromEntry (ref)
	local t = {}
	
	for i, v in p3 do
		local var7 = poolSectionFromEntry(v)
		
		if var7 ~= nil then
			table.insert(t, var7)
		end
	end
	return t
end

local function sectionsHaveMultiRow(p4)
	for i, v in p4 do
		if v.numberOfRows ~= 1 then
			return true
		end
	end
	return false
end

local function applyPoolEntryConfigs(p5, p6)
	if p6 == nil then return end
	for i, v in p6 do
		local var8 = p5[i]
		
		if var8 ~= nil and var8.collectionItemSize == nil and v.collectionItemSize ~= nil then
			var8.collectionItemSize = v.collectionItemSize
		end
	end
end

local function ingestPoolSections(p7, p8, p9, p10)
	-- upvalues: sduiPoolStoreModule (ref), normalizePoolData (ref), applyPoolEntryConfigs (ref)
	local configKey = p9.configKey
	
	if configKey == nil or #p7 == 0 then
		return nil
	end
	local sduiPoolStore = sduiPoolStoreModule.getSduiPoolStore(configKey)
	sduiPoolStore.setSections(p7)
	local var9 = if p8 ~= nil then nil else normalizePoolData(p8)
	
	if var9 ~= nil then
		applyPoolEntryConfigs(var9, p10)
		sduiPoolStore.setPools(var9)
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
	createPoolEntryFns = function(p7, p8, p9, p10, p11, p12, p13)
		-- upvalues: ingestPoolSections (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref), fFlagSduiCollectionGridRevealRows (ref), sduiListEntryRendererModule (ref)
		local var9 = ingestPoolSections(p7, p12, p10, p13)
		local var10 = nil
		local var11 = nil
		
		if var9 ~= nil then
			local t = {}
			
			for i, v in p7 do
				if v.poolId ~= nil then
					t[v.sectionId] = true
				end
			end
			var10 = function(p14)
				-- upvalues: t (ref), var9 (ref)
				local identifier = p14.identifier
				
				return if typeof(identifier) == "string" and t[identifier] then { _section = { cells = var9.getSectionCells(identifier) } } else nil
			end
			
			var11 = function(p14, _)
				-- upvalues: var9 (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (copy), fFlagSduiCollectionGridRevealRows (copy)
				local identifier = p14.identifier
				
				return if typeof(identifier) == "string" then {
					_requiresDataBinding = true,
					startRowGetter = var9.getSectionStartRow(identifier),
					numberOfRowsGetter = if fFlagSduiVerticalFeedProgressiveFillOnScroll then var9.getSectionRowCount(identifier) else nil,
					setDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p15)
						-- upvalues: var9 (copy), identifier (ref)
						var9.setSectionDisplayedRowCount(identifier, p15)
					end else nil
				} else nil
			end
		end
		return {
			inputSlicer = sduiListEntryRendererModule.createInputSlicer(p8, p9, p10, p11, var10),
			entryConfigExtrasFn = var11
		}
	end
}