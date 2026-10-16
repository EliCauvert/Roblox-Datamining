local HttpService = game:GetService("HttpService")
local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.Signals)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiPoolStoreModule = require(SduiCoreSystem.ClientBinding.SduiPoolStore)
local _ = require(SduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local _ = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local SduiListEntryRendererModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryRenderer)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local AnalyticsConstantsModule = require(SduiCoreSystem.Analytics.analyticsConstants)
local FFlagSduiCollectionGridRevealRows = require(Parent.SharedFlags).FFlagSduiCollectionGridRevealRows
local FFlagSduiSkipFeedAnalyticsPosition = require(Parent.SharedFlags).FFlagSduiSkipFeedAnalyticsPosition
local FFlagSduiPerSectionPoolSizing = require(Parent.SharedFlags).FFlagSduiPerSectionPoolSizing
local FFlagSduiVerticalFeedProgressiveFillOnScroll = require(Parent.SharedFlags).FFlagSduiVerticalFeedProgressiveFillOnScroll
local FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui = require(Parent.SharedFlags).FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui
local FFlagSduiSamePoolFeedItemSpacing = require(Parent.SharedFlags).FFlagSduiSamePoolFeedItemSpacing
local T = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then {} else nil

local function getOneByTwoTileFlowId(p1, p2, p3, Kind) --[[ Line: 33 ]]
	-- upvalues: T (copy), HttpService (copy)
	local NativeAdData = p3.native_ad_data
	local Formatted = string.format("%s:%s:%s:%s", tostring(p1), tostring(p2), tostring(p3.universe_id or ""), if typeof(NativeAdData) == "string" then NativeAdData else "")
	local Entry = T[Formatted]
	
	if Entry == nil then
		Entry = HttpService:GenerateGUID(false):lower()
		T[Formatted] = Entry
	end
	local Type = Kind and Kind.type
	
	return Entry, if typeof(NativeAdData) == "string" and NativeAdData ~= "" then NativeAdData else nil, if Type == "universe" then "Game" elseif Type == "ad_link" then "AdLink" else nil
end

local function getOneByTwoTileFlowIdsFromPools(List) --[[ Line: 58 ]]
	-- upvalues: getOneByTwoTileFlowId (copy)
	local List1 = {}
	
	if List == nil then
		return List1
	end
	for i, value in List do
		if typeof(value) == "table" then
			local Items = value.items or {}
			for i1, item in Items do
				if typeof(item) == "table" then
					local Kind = item.kind
					local Value = Kind and Kind.value
					local Layout = item.layout
					
					if typeof(Value) == "table" and typeof(Layout) == "table" and (Layout.col_span or (Layout.colSpan or 1)) == 1 and (Layout.row_span or (Layout.rowSpan or 1)) == 2 then
						local OneByTwoTileFlowId, OneByTwoTileFlowId2, OneByTwoTileFlowId3 = getOneByTwoTileFlowId(i, i1, Value, Kind)
						table.insert(List1, {
							oneByTwoTileFlowId = OneByTwoTileFlowId,
							contentType = OneByTwoTileFlowId3,
							adId = OneByTwoTileFlowId2,
							alignmentType = Layout.alignment_type or Layout.alignmentType
						})
					end
				end
			end
		end
	end
	return List1
end

local Callback = if FFlagSduiSkipFeedAnalyticsPosition then function(p1): boolean --[[ Line: 107 ]]
	-- upvalues: AnalyticsConstantsModule (copy)
	if typeof(p1) == "table" then
		local Value = p1.kind and p1.kind.value
		local Shared = Value and Value.shared
		local AnalyticsData = Shared and Shared.analytics_data
		local Analytics = AnalyticsData and AnalyticsData[AnalyticsConstantsModule.DoesNotAdvanceStartRow]
		local Kind = Analytics and Analytics.kind
		
		return Kind ~= nil and Kind.type == "literal" and Kind.value == "true"
	else
		return false
	end
end else nil

local function normalizePoolData(List) --[[ Line: 178 ]]
	-- upvalues: FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (copy), getOneByTwoTileFlowId (copy)
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
							
							if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui and typeof(Value) == "table" and (ColSpan or 1) == 1 and (RowSpan or 1) == 2 then
								local OneByTwoTileFlowId, OneByTwoTileFlowId2, OneByTwoTileFlowId3 = getOneByTwoTileFlowId(i, i1, Value, Kind)
								local Copy = table.clone(Value)
								Copy.oneByTwoTileFlowId = OneByTwoTileFlowId
								
								if OneByTwoTileFlowId2 ~= nil then
									Copy.adId = OneByTwoTileFlowId2
								end
								if OneByTwoTileFlowId3 ~= nil then
									Copy.contentType = OneByTwoTileFlowId3
								end
								Items[i1] = Copy
							end
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

local function poolSectionFromEntry(p1, p2) --[[ Line: 251 ]]
	-- upvalues: FFlagSduiPerSectionPoolSizing (copy), FFlagSduiSamePoolFeedItemSpacing (copy), FFlagSduiSkipFeedAnalyticsPosition (copy), Callback (copy)
	local Identifier = p1.identifier
	
	if typeof(Identifier) ~= "string" then
		return nil
	end
	local PoolId = nil
	local MaxVisibleRows = nil
	local CollectionItemSize = nil
	local IsContinuesPreviousSection = nil
	local Item = p1.item
	
	if typeof(Item) == "table" then
		local Item1 = Item
		local InputData = Item1.input_data
		
		if InputData and InputData.kind and InputData.kind.value then
			Item1 = InputData.kind.value
		end
		PoolId = Item1.pool_id
		MaxVisibleRows = Item1.max_visible_rows
		
		if FFlagSduiPerSectionPoolSizing then
			CollectionItemSize = if typeof(Item1.collection_item_size) == "string" and Item1.collection_item_size ~= "" then Item1.collection_item_size else nil
		end
		if FFlagSduiSamePoolFeedItemSpacing then
			IsContinuesPreviousSection = Item1.continues_previous_section == true or nil
		end
	end
	local CollectionItemSize1 = nil
	
	if FFlagSduiPerSectionPoolSizing and PoolId ~= nil and p2 ~= nil then
		local v1 = p2[PoolId]
		
		if v1 ~= nil then
			CollectionItemSize1 = v1.collectionItemSize
		end
	end
	local CallbackResult = if FFlagSduiSkipFeedAnalyticsPosition then Callback(p1.template) else nil
	
	return {
		sectionId = Identifier,
		poolId = PoolId,
		numberOfRows = if MaxVisibleRows == -1 and PoolId ~= nil then -1 elseif typeof(MaxVisibleRows) == "number" and MaxVisibleRows > 0 then MaxVisibleRows else 1,
		doesNotAdvanceStartRow = if FFlagSduiSkipFeedAnalyticsPosition then CallbackResult else nil,
		entryCollectionItemSize = if FFlagSduiPerSectionPoolSizing then CollectionItemSize else nil,
		templateCollectionItemSize = if FFlagSduiPerSectionPoolSizing then CollectionItemSize1 else nil,
		continuesPreviousSection = if FFlagSduiSamePoolFeedItemSpacing then IsContinuesPreviousSection else nil
	}
end

local function applyPoolEntryConfigs(p1, List) --[[ Line: 332 ]]
	-- upvalues: FFlagSduiPerSectionPoolSizing (copy)
	if FFlagSduiPerSectionPoolSizing or List == nil then return end
	for i, value in List do
		local v1 = p1[i]
		
		if v1 ~= nil and v1.collectionItemSize == nil and value.collectionItemSize ~= nil then
			v1.collectionItemSize = value.collectionItemSize
		end
	end
end

local function ingestPoolSections(p2, p3, p4, p5) --[[ Line: 350 ]]
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
	resolvePoolDataGetter = function(p2, p3, p4, p5) --[[ Line: 123 ]]
		-- upvalues: SduiPropUtilsModule (copy)
		if p2 == nil or p2 == "" then
			return nil
		else
			local DynamicBindingPropValue = SduiPropUtilsModule.generateDynamicBindingPropValue(p2, p3, p4, p5)
			
			return function(p6) --[[ Line: 138 ]]
				-- upvalues: DynamicBindingPropValue (copy)
				return DynamicBindingPropValue(p6).data
			end
		end
	end,
	buildPoolEntryConfigs = function(p2) --[[ Line: 149 ]]
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
	getOneByTwoTileFlowIdsFromPools = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then getOneByTwoTileFlowIdsFromPools else nil,
	poolSectionFromEntry = poolSectionFromEntry,
	computePoolSections = function(List, p3) --[[ Line: 307 ]]
		-- upvalues: poolSectionFromEntry (copy), FFlagSduiPerSectionPoolSizing (copy)
		local List1 = {}
		
		for _, value in List do
			local PoolSectionFromEntryResult = poolSectionFromEntry(value, if FFlagSduiPerSectionPoolSizing then p3 else nil)
			
			if PoolSectionFromEntryResult ~= nil then
				table.insert(List1, PoolSectionFromEntryResult)
			end
		end
		return List1
	end,
	sectionsHaveMultiRow = function(List): boolean --[[ Line: 320 ]]
		for _, value in List do
			if value.numberOfRows ~= 1 then
				return true
			end
		end
		return false
	end,
	ingestPoolSections = ingestPoolSections,
	createPoolEntryFns = function(List, p4, p5, p6, p7, p8, p9) --[[ Line: 375 ]]
		-- upvalues: ingestPoolSections (copy), FFlagSduiSamePoolFeedItemSpacing (copy), FFlagSduiVerticalFeedProgressiveFillOnScroll (copy), FFlagSduiCollectionGridRevealRows (copy), SduiListEntryRendererModule (copy)
		local IngestPoolSectionsResult = ingestPoolSections(List, p8, p6, p9)
		local v2: ((any) -> any)? = nil
		local EntryConfigExtrasFn: ((any, any) -> any)? = nil
		
		if IngestPoolSectionsResult ~= nil then
			local t = {}
			
			for _, value in List do
				if value.poolId ~= nil then
					t[value.sectionId] = true
				end
			end
			local t2 = {}
			
			if FFlagSduiSamePoolFeedItemSpacing then
				for _, value1 in List do
					if value1.continuesPreviousSection then
						t2[value1.sectionId] = true
					end
				end
			end
			v2 = function(p10) --[[ Line: 406 ]]
				-- upvalues: t (copy), IngestPoolSectionsResult (copy)
				local Identifier = p10.identifier
				
				return if typeof(Identifier) == "string" and t[Identifier] then {
					_section = {
						cells = IngestPoolSectionsResult.getSectionCells(Identifier)
					}
				} else nil
			end
			
			EntryConfigExtrasFn = function(p10, _) --[[ Line: 418 ]]
				-- upvalues: IngestPoolSectionsResult (copy), FFlagSduiVerticalFeedProgressiveFillOnScroll (upval), FFlagSduiCollectionGridRevealRows (upval), FFlagSduiSamePoolFeedItemSpacing (upval), t2 (copy)
				local Identifier = p10.identifier
				
				return if typeof(Identifier) == "string" then {
					_requiresDataBinding = true,
					startRowGetter = IngestPoolSectionsResult.getSectionStartRow(Identifier),
					numberOfRowsGetter = if FFlagSduiVerticalFeedProgressiveFillOnScroll then IngestPoolSectionsResult.getSectionRowCount(Identifier) else nil,
					setDisplayedRowCount = if FFlagSduiCollectionGridRevealRows then function(p11) --[[ Line: 429 ]]
						-- upvalues: IngestPoolSectionsResult (upval), Identifier (copy)
						IngestPoolSectionsResult.setSectionDisplayedRowCount(Identifier, p11)
					end else nil,
					continuesPreviousSection = if FFlagSduiSamePoolFeedItemSpacing then t2[Identifier] else nil
				} else nil
			end
		end
		return {
			inputSlicer = SduiListEntryRendererModule.createInputSlicer(p4, p5, p6, p7, v2),
			entryConfigExtrasFn = EntryConfigExtrasFn
		}
	end
}