local Home = script:FindFirstAncestor("Home")
local SduiSharedUtilitiesModule = require(Home.Parent.SduiSharedUtilities)
local HomeConstantsModule = require(Home.HomeConstants)
local HomeSortDetailConstantsModule = require(Home.HomeSortDetailPage.HomeSortDetailConstants)
local IsHomeSortDetailSortIncludedModule = require(Home.HomeSortDetailPage.isHomeSortDetailSortIncluded)

local function _(p1) --[[ Line: 18 | Named "readSortInputData" ]]
	if typeof(p1) == "table" then
		local InputData = p1.input_data
		local Kind = if typeof(InputData) == "table" then InputData.kind else nil
		
		return if typeof(Kind) == "table" and typeof(Kind.value) == "table" then Kind.value else nil
	else
		return nil
	end
end

local _ = function(p1) --[[ Line: 30 | Named "readSortInputDataType" ]]
	local InputData = if typeof(p1) == "table" then p1.input_data else nil
	local Kind = if typeof(InputData) == "table" then InputData.kind else nil
	
	return if typeof(Kind) == "table" and typeof(Kind.type) == "string" then Kind.type else nil
end

local _ = function(p1, p2): boolean --[[ Line: 36 | Named "matchesSort" ]]
	-- upvalues: IsHomeSortDetailSortIncludedModule (copy)
	local v1 = nil
	if typeof(p1) == "table" then
		local InputData = p1.input_data
		local Kind = if typeof(InputData) == "table" then InputData.kind else nil
		v1 = if typeof(Kind) == "table" and typeof(Kind.value) == "table" then Kind.value else nil
	else
		v1 = nil
	end
	local Text = if v1 then tostring(v1.sort_id) else nil
	local Flag = false
	
	if Text ~= nil then
		Flag = false
		
		if Text ~= "" then
			local InputData = if typeof(p1) == "table" then p1.input_data else nil
			local Kind = if typeof(InputData) == "table" then InputData.kind else nil
			Flag = IsHomeSortDetailSortIncludedModule(Text, if typeof(Kind) == "table" and typeof(Kind.type) == "string" then Kind.type else nil) and Text == p2
		end
	end
	return Flag
end

local function findFeedEntry(EntryOrder, EntryMap, p1, p2: number) --[[ Line: 45 ]]
	-- upvalues: IsHomeSortDetailSortIncludedModule (copy)
	if p2 ~= nil and p2 >= 1 and p2 % 1 == 0 then
		local EntryOrderEntry = EntryOrder[p2]
		local Entry = if EntryOrderEntry == nil then nil else EntryMap[EntryOrderEntry]
		local v1 = nil
		
		if typeof(Entry) == "table" then
			local InputData = Entry.input_data
			local Kind = if typeof(InputData) == "table" then InputData.kind else nil
			v1 = if typeof(Kind) == "table" and typeof(Kind.value) == "table" then Kind.value else nil
		else
			v1 = nil
		end
		local Text = if v1 then tostring(v1.sort_id) else nil
		local Flag = false
		
		if Text ~= nil then
			Flag = false
			
			if Text ~= "" then
				local InputData = if typeof(Entry) == "table" then Entry.input_data else nil
				local Kind = if typeof(InputData) == "table" then InputData.kind else nil
				Flag = IsHomeSortDetailSortIncludedModule(Text, if typeof(Kind) == "table" and typeof(Kind.type) == "string" then Kind.type else nil) and Text == p1
			end
		end
		if Flag then
			return EntryOrderEntry, Entry
		end
	end
	local Entry = nil
	for _, value in EntryOrder do
		Entry = EntryMap[value]
		local v2 = nil
		
		if typeof(Entry) == "table" then
			local InputData = Entry.input_data
			local Kind = if typeof(InputData) == "table" then InputData.kind else nil
			v2 = if typeof(Kind) == "table" and typeof(Kind.value) == "table" then Kind.value else nil
		else
			v2 = nil
		end
		local Text = if v2 then tostring(v2.sort_id) else nil
		local Flag = false
		local NoText = Text == nil
		
		if not NoText then
			Flag = false
			NoText = Text == ""
		end
		if not NoText then
			local InputData = if typeof(Entry) == "table" then Entry.input_data else nil
			local Kind = if typeof(InputData) == "table" then InputData.kind else nil
			Flag = IsHomeSortDetailSortIncludedModule(Text, if typeof(Kind) == "table" and typeof(Kind.type) == "string" then Kind.type else nil) and Text == p1
		end
		if Flag then
			return value, Entry
		end
	end
	return nil
end

local function selectHomeSortDetailFeedEntry(InputData, p3, p4) --[[ Line: 68 ]]
	-- upvalues: findFeedEntry (copy)
	if typeof(InputData) ~= "table" then
		return nil
	end
	local EntryOrder = InputData.entry_order
	local EntryMap = InputData.entry_map
	
	if typeof(EntryOrder) ~= "table" or typeof(EntryMap) ~= "table" then
		return nil
	end
	local FeedEntry, FeedEntry2 = findFeedEntry(EntryOrder, EntryMap, p3, p4)
	
	if FeedEntry == nil or FeedEntry2 == nil then
		return nil
	end
	local RobloxComponent = FeedEntry2.roblox_component
	
	if typeof(RobloxComponent) ~= "string" or RobloxComponent == "" then
		return nil
	end
	local InputData1 = nil
	if typeof(FeedEntry2) == "table" then
		local InputData2 = FeedEntry2.input_data
		local Kind = if typeof(InputData2) == "table" then InputData2.kind else nil
		InputData1 = if typeof(Kind) == "table" and typeof(Kind.value) == "table" then Kind.value else nil
	else
		InputData1 = nil
	end
	return if InputData1 == nil then nil else {
		identifier = FeedEntry,
		feedEntry = FeedEntry2,
		inputData = InputData1,
		contentPools = InputData.content_pools or {}
	}
end

local function buildVerticalFeedInputData(p3) --[[ Line: 103 ]]
	-- upvalues: HomeSortDetailConstantsModule (copy)
	local Copy = table.clone(p3.inputData)
	Copy.entry_order = {
		HomeSortDetailConstantsModule.DropDownIdentifier,
		p3.identifier
	}
	Copy.entry_map = {
		[HomeSortDetailConstantsModule.DropDownIdentifier] = {
			roblox_component = HomeSortDetailConstantsModule.DropDownRobloxComponent
		},
		[p3.identifier] = p3.feedEntry
	}
	Copy.content_pools = p3.contentPools
	
	return Copy
end

local _ = function(p3, p4) --[[ Line: 119 | Named "getHomeInputData" ]]
	-- upvalues: HomeConstantsModule (copy)
	local InputData = p3.getInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier, p4)
	
	return if InputData == nil then p3.getInputData(HomeConstantsModule.ConfigKey, nil, p4) else InputData
end

return function(p3, p4) --[[ Line: 127 | Named "buildHomeSortDetailPageEntry" ]]
	-- upvalues: SduiSharedUtilitiesModule (copy), selectHomeSortDetailFeedEntry (copy), HomeConstantsModule (copy), HomeSortDetailConstantsModule (copy), buildVerticalFeedInputData (copy)
	if p3 == "" then
		return nil
	else
		local SduiApiStore = SduiSharedUtilitiesModule.getSduiApiStore()
		local InputData = SduiApiStore.getInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier, nil)
		
		return if selectHomeSortDetailFeedEntry(if InputData == nil then SduiApiStore.getInputData(HomeConstantsModule.ConfigKey, nil, nil) else InputData, p3, p4) == nil then nil else {
			robloxComponentType = HomeSortDetailConstantsModule.RobloxComponent,
			identifier = HomeSortDetailConstantsModule.Identifier,
			componentInputDataGetter = function(p5) --[[ Line: 141 ]]
				-- upvalues: selectHomeSortDetailFeedEntry (upval), SduiApiStore (copy), HomeConstantsModule (upval), p3 (copy), p4 (copy), buildVerticalFeedInputData (upval)
				local InputData = SduiApiStore.getInputData(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier, p5)
				local SelectHomeSortDetailFeedEntryResult = selectHomeSortDetailFeedEntry(if InputData == nil then SduiApiStore.getInputData(HomeConstantsModule.ConfigKey, nil, p5) else InputData, p3, p4)
				
				return if SelectHomeSortDetailFeedEntryResult then buildVerticalFeedInputData(SelectHomeSortDetailFeedEntryResult) else {}
			end
		}
	end
end