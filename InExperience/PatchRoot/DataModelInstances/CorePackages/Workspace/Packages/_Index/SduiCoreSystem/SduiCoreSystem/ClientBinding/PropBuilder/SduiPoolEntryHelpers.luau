local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.Signals)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiPoolStoreModule = require(sduiCoreSystem.ClientBinding.SduiPoolStore)
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local _ = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local sduiListEntryRendererModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryRenderer)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local analyticsConstantsModule = require(sduiCoreSystem.Analytics.analyticsConstants)
local fFlagSduiCollectionGridRevealRows = require(parent.SharedFlags).FFlagSduiCollectionGridRevealRows
local fFlagSduiSkipFeedAnalyticsPosition = require(parent.SharedFlags).FFlagSduiSkipFeedAnalyticsPosition
local fFlagSduiPerSectionPoolSizing = require(parent.SharedFlags).FFlagSduiPerSectionPoolSizing
local fFlagSduiVerticalFeedProgressiveFillOnScroll = require(parent.SharedFlags).FFlagSduiVerticalFeedProgressiveFillOnScroll
local var1 = if fFlagSduiSkipFeedAnalyticsPosition then function(p1)
	-- upvalues: analyticsConstantsModule (ref)
	if typeof(p1) ~= "table" then
		return false
	end
	local value = p1.kind and p1.kind.value
	local shared = value and value.shared
	local analyticsData = shared and shared.analytics_data
	local doesNotAdvanceStartRow = analyticsData and analyticsData[analyticsConstantsModule.DoesNotAdvanceStartRow]
	local kind = doesNotAdvanceStartRow and doesNotAdvanceStartRow.kind
	
	return kind == nil or kind.type ~= "literal" or kind.value ~= "true"
end else nil

local function resolvePoolDataGetter(p1, p2, p3, p4)
	-- upvalues: sduiPropUtilsModule (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local var2 = sduiPropUtilsModule.generateDynamicBindingPropValue(p1, p2, p3, p4)
	
	return function(p5)
		-- upvalues: var2 (ref)
		return var2(p5).data
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
	local var2 = false
	
	for i, v in entries do
		if typeof(i) == "string" and typeof(v) == "table" then
			local collectionItemSize = v.collection_item_size
			local var3 = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
			
			if var3 ~= nil then
				t[i] = { collectionItemSize = var3 }
				var2 = true
			end
		end
	end
	return if var2 then t else nil
end

local function normalizePoolData(p2)
	if p2 == nil or next(p2) == nil then
		return nil
	end
	local t = {}
	
	for i, v in p2 do
		local t_1 = {}
		local t_2 = {}
		local var4 = false
		
		if typeof(v.items) == "table" then
			for i_1, v_1 in v.items do
				if typeof(v_1) == "table" then
					local kind = v_1.kind
					local var5 = if typeof(kind) == "table" then kind.value else nil
					
					if typeof(var5) == "table" then
						t_1[i_1] = var5
					end
					local layout = v_1.layout
					
					if typeof(layout) == "table" then
						local var6
						local colSpan = layout.colSpan or layout.col_span
						local rowSpan = layout.rowSpan or layout.row_span
						local alignmentType = layout.alignmentType or layout.alignment_type
						local var7 = tonumber(layout.minRowPadding or layout.min_row_padding)
						
						if colSpan ~= nil then
							var6 = true
							
							if colSpan == 1 then
								if rowSpan ~= nil then
									var6 = true
									
									if rowSpan == 1 then
										if alignmentType ~= nil then
											var6 = true
											
											if alignmentType == "" then
												var6 = var7 ~= nil and var7 > 0
											end
										end
									end
								end
							end
							if var6 then
								t_2[i_1] = {
									colSpan = colSpan,
									rowSpan = rowSpan,
									alignmentType = alignmentType,
									minRowPadding = var7
								}
								var4 = true
							end
						end
					end
				end
			end
		end
		local collectionItemSize = v.collection_item_size
		t[i] = {
			items = t_1,
			layouts = if var4 then t_2 else nil,
			collectionItemSize = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
		}
	end
	return t
end

local function poolSectionFromEntry(p3, p4)
	-- upvalues: fFlagSduiPerSectionPoolSizing (ref), fFlagSduiSkipFeedAnalyticsPosition (ref), var1 (ref)
	local identifier = p3.identifier
	
	if typeof(identifier) ~= "string" then
		return nil
	end
	local var8
	local poolId = nil
	local maxVisibleRows = nil
	local var9 = nil
	local item = p3.item
	
	if typeof(item) == "table" then
		var8 = item
		local inputData = var8.input_data
		
		if inputData and inputData.kind and inputData.kind.value then
			var8 = inputData.kind.value
		end
		poolId = var8.pool_id
		maxVisibleRows = var8.max_visible_rows
		
		if fFlagSduiPerSectionPoolSizing then
			var9 = if typeof(var8.collection_item_size) == "string" and var8.collection_item_size ~= "" then var8.collection_item_size else nil
		end
	end
	var8 = nil
	
	if fFlagSduiPerSectionPoolSizing and poolId ~= nil and p4 ~= nil then
		local var10 = p4[poolId]
		
		if var10 ~= nil then
			var8 = var10.collectionItemSize
		end
	end
	return {
		sectionId = identifier,
		poolId = poolId,
		numberOfRows = if maxVisibleRows == -1 and poolId ~= nil then -1 elseif typeof(maxVisibleRows) == "number" and maxVisibleRows > 0 then maxVisibleRows else 1,
		doesNotAdvanceStartRow = if fFlagSduiSkipFeedAnalyticsPosition then if fFlagSduiSkipFeedAnalyticsPosition then var1(p3.template) else nil else nil,
		entryCollectionItemSize = if fFlagSduiPerSectionPoolSizing then var9 else nil,
		templateCollectionItemSize = if fFlagSduiPerSectionPoolSizing then var8 else nil
	}
end

local function computePoolSections(p3, p4)
	-- upvalues: poolSectionFromEntry (ref), fFlagSduiPerSectionPoolSizing (ref)
	local t = {}
	
	for i, v in p3 do
		local var8 = poolSectionFromEntry(v, if fFlagSduiPerSectionPoolSizing then p4 else nil)
		
		if var8 ~= nil then
			table.insert(t, var8)
		end
	end
	return t
end

local function sectionsHaveMultiRow(p5)
	for i, v in p5 do
		if v.numberOfRows ~= 1 then
			return true
		end
	end
	return false
end

local function applyPoolEntryConfigs(p6, p7)
	-- upvalues: fFlagSduiPerSectionPoolSizing (ref)
	if fFlagSduiPerSectionPoolSizing or p7 == nil then return end
	for i, v in p7 do
		local var9 = p6[i]
		
		if var9 ~= nil and var9.collectionItemSize == nil and v.collectionItemSize ~= nil then
			var9.collectionItemSize = v.collectionItemSize
		end
	end
end

local function ingestPoolSections(p8, p9, p10, p11)
	-- upvalues: sduiPoolStoreModule (ref), normalizePoolData (ref), applyPoolEntryConfigs (ref)
	local configKey = p10.configKey
	
	if configKey == nil or #p8 == 0 then
		return nil
	end
	local sduiPoolStore = sduiPoolStoreModule.getSduiPoolStore(configKey)
	sduiPoolStore.setSections(p8)
	local var10 = if p9 ~= nil then nil else normalizePoolData(p9)
	
	if var10 ~= nil then
		applyPoolEntryConfigs(var10, p11)
		sduiPoolStore.setPools(var10)
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
	createPoolEntryFns = function(p8, p9, p10, p11, p12, p13, p14)
		-- upvalues: ingestPoolSections (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref), fFlagSduiCollectionGridRevealRows (ref), sduiListEntryRendererModule (ref)
		local var10 = ingestPoolSections(p8, p13, p11, p14)
		local var11 = nil
		local var12 = nil
		
		if var10 ~= nil then
			local t = {}
			
			for i, v in p8 do
				if v.poolId ~= nil then
					t[v.sectionId] = true
				end
			end
			var11 = function(p15)
				-- upvalues: t (ref), var10 (ref)
				local identifier = p15.identifier
				
				return if typeof(identifier) == "string" and t[identifier] then { _section = { cells = var10.getSectionCells(identifier) } } else nil
			end
			
			var12 = function(p15, _)
				-- upvalues: var10 (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (copy), fFlagSduiCollectionGridRevealRows (copy)
				local identifier = p15.identifier
				
				return if typeof(identifier) == "string" then {
					_requiresDataBinding = true,
					startRowGetter = var10.getSectionStartRow(identifier),
					numberOfRowsGetter = if fFlagSduiVerticalFeedProgressiveFillOnScroll then var10.getSectionRowCount(identifier) else nil,
					setDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p16)
						-- upvalues: var10 (copy), identifier (ref)
						var10.setSectionDisplayedRowCount(identifier, p16)
					end else nil
				} else nil
			end
		end
		return {
			inputSlicer = sduiListEntryRendererModule.createInputSlicer(p9, p10, p11, p12, var11),
			entryConfigExtrasFn = var12
		}
	end
}