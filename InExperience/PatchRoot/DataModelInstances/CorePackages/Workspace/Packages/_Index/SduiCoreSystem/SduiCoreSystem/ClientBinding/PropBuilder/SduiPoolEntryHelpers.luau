local httpService = game:GetService("HttpService")
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
local fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui = require(parent.SharedFlags).FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui
local fFlagSduiSamePoolFeedItemSpacing = require(parent.SharedFlags).FFlagSduiSamePoolFeedItemSpacing
local var1 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then {} else nil

local function getOneByTwoTileFlowId(p1, p2, p3, p4)
	-- upvalues: var1 (ref), httpService (ref)
	local nativeAdData = p3.native_ad_data
	local formattedText = string.format("%s:%s:%s:%s", tostring(p1), tostring(p2), tostring(p3.universe_id or ""), if typeof(nativeAdData) == "string" then nativeAdData else "")
	local var2 = var1[formattedText]
	
	if var2 == nil then
		var2 = httpService:GenerateGUID(false):lower()
		var1[formattedText] = var2
	end
	local type = p4 and p4.type
	
	return var2, if typeof(nativeAdData) == "string" and nativeAdData ~= "" then nativeAdData else nil, if type == "universe" then "Game" elseif type == "ad_link" then "AdLink" else nil
end

local function getOneByTwoTileFlowIdsFromPools(p1)
	-- upvalues: getOneByTwoTileFlowId (ref)
	local t = {}
	
	if p1 == nil then
		return t
	end
	for i, v in p1 do
		if typeof(v) == "table" then
			for i_1, v_1 in v.items or {} do
				if typeof(v_1) == "table" then
					local kind = v_1.kind
					local value = kind and kind.value
					local layout = v_1.layout
					
					if typeof(value) == "table" and typeof(layout) == "table" and ((layout.col_span or (layout.colSpan or 1)) == 1 and (layout.row_span or (layout.rowSpan or 1)) == 2) then
						local var2, var3, var4 = getOneByTwoTileFlowId(i, i_1, value, kind)
						table.insert(t, {
							oneByTwoTileFlowId = var2,
							contentType = var4,
							adId = var3,
							alignmentType = layout.alignment_type or layout.alignmentType
						})
					end
				end
			end
		end
	end
	return t
end

local var5 = if fFlagSduiSkipFeedAnalyticsPosition then function(p2)
	-- upvalues: analyticsConstantsModule (ref)
	if typeof(p2) ~= "table" then
		return false
	end
	local value = p2.kind and p2.kind.value
	local shared = value and value.shared
	local analyticsData = shared and shared.analytics_data
	local doesNotAdvanceStartRow = analyticsData and analyticsData[analyticsConstantsModule.DoesNotAdvanceStartRow]
	local kind = doesNotAdvanceStartRow and doesNotAdvanceStartRow.kind
	
	return kind == nil or kind.type ~= "literal" or kind.value ~= "true"
end else nil

local function resolvePoolDataGetter(p2, p3, p4, p5)
	-- upvalues: sduiPropUtilsModule (ref)
	if p2 == nil or p2 == "" then
		return nil
	end
	local var6 = sduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p4, p5)
	
	return function(p6)
		-- upvalues: var6 (ref)
		return var6(p6).data
	end
end

local function buildPoolEntryConfigs(p2)
	if typeof(p2) ~= "table" then
		return nil
	end
	local entries = p2.entries
	
	if typeof(entries) ~= "table" then
		return nil
	end
	local t = {}
	local var6 = false
	
	for i, v in entries do
		if typeof(i) == "string" and typeof(v) == "table" then
			local collectionItemSize = v.collection_item_size
			local var7 = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
			
			if var7 ~= nil then
				t[i] = { collectionItemSize = var7 }
				var6 = true
			end
		end
	end
	return if var6 then t else nil
end

local function normalizePoolData(p3)
	-- upvalues: fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (ref), getOneByTwoTileFlowId (ref)
	if p3 == nil or next(p3) == nil then
		return nil
	end
	local t = {}
	
	for i, v in p3 do
		local t_1 = {}
		local t_2 = {}
		local var8 = false
		
		if typeof(v.items) == "table" then
			for i_1, v_1 in v.items do
				if typeof(v_1) == "table" then
					local kind = v_1.kind
					local var9 = if typeof(kind) == "table" then kind.value else nil
					
					if typeof(var9) == "table" then
						t_1[i_1] = var9
					end
					local layout = v_1.layout
					
					if typeof(layout) == "table" then
						local var10
						local colSpan = layout.colSpan or layout.col_span
						local rowSpan = layout.rowSpan or layout.row_span
						local alignmentType = layout.alignmentType or layout.alignment_type
						local var11 = tonumber(layout.minRowPadding or layout.min_row_padding)
						
						if colSpan ~= nil then
							var10 = true
							
							if colSpan == 1 then
								if rowSpan ~= nil then
									var10 = true
									
									if rowSpan == 1 then
										if alignmentType ~= nil then
											var10 = true
											
											if alignmentType == "" then
												var10 = var11 ~= nil and var11 > 0
											end
										end
									end
								end
							end
							if var10 then
								t_2[i_1] = {
									colSpan = colSpan,
									rowSpan = rowSpan,
									alignmentType = alignmentType,
									minRowPadding = var11
								}
								var8 = true
								
								if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui and typeof(var9) == "table" and ((colSpan or 1) == 1 and (rowSpan or 1) == 2) then
									local var12, var13, var14 = getOneByTwoTileFlowId(i, i_1, var9, kind)
									local cloned = table.clone(var9)
									cloned.oneByTwoTileFlowId = var12
									
									if var13 ~= nil then
										cloned.adId = var13
									end
									if var14 ~= nil then
										cloned.contentType = var14
									end
									t_1[i_1] = cloned
								end
							end
						end
					end
				end
			end
		end
		local collectionItemSize = v.collection_item_size
		t[i] = {
			items = t_1,
			layouts = if var8 then t_2 else nil,
			collectionItemSize = if typeof(collectionItemSize) == "string" and collectionItemSize ~= "" then collectionItemSize else nil
		}
	end
	return t
end

local function poolSectionFromEntry(p4, p5)
	-- upvalues: fFlagSduiPerSectionPoolSizing (ref), fFlagSduiSamePoolFeedItemSpacing (ref), fFlagSduiSkipFeedAnalyticsPosition (ref), var5 (ref)
	local identifier = p4.identifier
	
	if typeof(identifier) ~= "string" then
		return nil
	end
	local var15
	local poolId = nil
	local maxVisibleRows = nil
	local var16 = nil
	local var17 = nil
	local item = p4.item
	
	if typeof(item) == "table" then
		var15 = item
		local inputData = var15.input_data
		
		if inputData and inputData.kind and inputData.kind.value then
			var15 = inputData.kind.value
		end
		poolId = var15.pool_id
		maxVisibleRows = var15.max_visible_rows
		
		if fFlagSduiPerSectionPoolSizing then
			var16 = if typeof(var15.collection_item_size) == "string" and var15.collection_item_size ~= "" then var15.collection_item_size else nil
		end
		if fFlagSduiSamePoolFeedItemSpacing then
			var17 = var15.continues_previous_section == true or nil
		end
	end
	var15 = nil
	
	if fFlagSduiPerSectionPoolSizing and poolId ~= nil and p5 ~= nil then
		local var18 = p5[poolId]
		
		if var18 ~= nil then
			var15 = var18.collectionItemSize
		end
	end
	return {
		sectionId = identifier,
		poolId = poolId,
		numberOfRows = if maxVisibleRows == -1 and poolId ~= nil then -1 elseif typeof(maxVisibleRows) == "number" and maxVisibleRows > 0 then maxVisibleRows else 1,
		doesNotAdvanceStartRow = if fFlagSduiSkipFeedAnalyticsPosition then if fFlagSduiSkipFeedAnalyticsPosition then var5(p4.template) else nil else nil,
		entryCollectionItemSize = if fFlagSduiPerSectionPoolSizing then var16 else nil,
		templateCollectionItemSize = if fFlagSduiPerSectionPoolSizing then var15 else nil,
		continuesPreviousSection = if fFlagSduiSamePoolFeedItemSpacing then var17 else nil
	}
end

local function computePoolSections(p4, p5)
	-- upvalues: poolSectionFromEntry (ref), fFlagSduiPerSectionPoolSizing (ref)
	local t = {}
	
	for i, v in p4 do
		local var15 = poolSectionFromEntry(v, if fFlagSduiPerSectionPoolSizing then p5 else nil)
		
		if var15 ~= nil then
			table.insert(t, var15)
		end
	end
	return t
end

local function sectionsHaveMultiRow(p6)
	for i, v in p6 do
		if v.numberOfRows ~= 1 then
			return true
		end
	end
	return false
end

local function applyPoolEntryConfigs(p7, p8)
	-- upvalues: fFlagSduiPerSectionPoolSizing (ref)
	if fFlagSduiPerSectionPoolSizing or p8 == nil then return end
	for i, v in p8 do
		local var16 = p7[i]
		
		if var16 ~= nil and var16.collectionItemSize == nil and v.collectionItemSize ~= nil then
			var16.collectionItemSize = v.collectionItemSize
		end
	end
end

local function ingestPoolSections(p9, p10, p11, p12)
	-- upvalues: sduiPoolStoreModule (ref), normalizePoolData (ref), applyPoolEntryConfigs (ref)
	local configKey = p11.configKey
	
	if configKey == nil or #p9 == 0 then
		return nil
	end
	local sduiPoolStore = sduiPoolStoreModule.getSduiPoolStore(configKey)
	sduiPoolStore.setSections(p9)
	local var17 = if p10 ~= nil then nil else normalizePoolData(p10)
	
	if var17 ~= nil then
		applyPoolEntryConfigs(var17, p12)
		sduiPoolStore.setPools(var17)
	end
	return sduiPoolStore
end

return {
	resolvePoolDataGetter = resolvePoolDataGetter,
	buildPoolEntryConfigs = buildPoolEntryConfigs,
	applyPoolEntryConfigs = applyPoolEntryConfigs,
	normalizePoolData = normalizePoolData,
	getOneByTwoTileFlowIdsFromPools = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then getOneByTwoTileFlowIdsFromPools else nil,
	poolSectionFromEntry = poolSectionFromEntry,
	computePoolSections = computePoolSections,
	sectionsHaveMultiRow = sectionsHaveMultiRow,
	ingestPoolSections = ingestPoolSections,
	createPoolEntryFns = function(p9, p10, p11, p12, p13, p14, p15)
		-- upvalues: ingestPoolSections (ref), fFlagSduiSamePoolFeedItemSpacing (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref), fFlagSduiCollectionGridRevealRows (ref), sduiListEntryRendererModule (ref)
		local var17 = ingestPoolSections(p9, p14, p12, p15)
		local var18 = nil
		local var19 = nil
		
		if var17 ~= nil then
			local t = {}
			
			for i, v in p9 do
				if v.poolId ~= nil then
					t[v.sectionId] = true
				end
			end
			local t_1 = {}
			
			if fFlagSduiSamePoolFeedItemSpacing then
				for i_1, v_1 in p9 do
					if v_1.continuesPreviousSection then
						t_1[v_1.sectionId] = true
					end
				end
			end
			var18 = function(p16)
				-- upvalues: t (ref), var17 (ref)
				local identifier = p16.identifier
				
				return if typeof(identifier) == "string" and t[identifier] then { _section = { cells = var17.getSectionCells(identifier) } } else nil
			end
			
			var19 = function(p16, _)
				-- upvalues: var17 (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (copy), fFlagSduiCollectionGridRevealRows (copy), fFlagSduiSamePoolFeedItemSpacing (copy), t_1 (ref)
				local identifier = p16.identifier
				
				return if typeof(identifier) == "string" then {
					_requiresDataBinding = true,
					startRowGetter = var17.getSectionStartRow(identifier),
					numberOfRowsGetter = if fFlagSduiVerticalFeedProgressiveFillOnScroll then var17.getSectionRowCount(identifier) else nil,
					setDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p17)
						-- upvalues: var17 (copy), identifier (ref)
						var17.setSectionDisplayedRowCount(identifier, p17)
					end else nil,
					continuesPreviousSection = if fFlagSduiSamePoolFeedItemSpacing then t_1[identifier] else nil
				} else nil
			end
		end
		return {
			inputSlicer = sduiListEntryRendererModule.createInputSlicer(p10, p11, p12, p13, var18),
			entryConfigExtrasFn = var19
		}
	end
}