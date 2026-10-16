local Parent = script:FindFirstAncestor("Home").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local HomeOmniFeedCache = require(Parent.DiscoveryUtils).HomeOmniFeedCache
local GetSduiTemplateStoreFunction = require(Parent.SduiSharedUtilities).getSduiTemplateStore
local config = { universe = { "player_count" } }

local function _(Tbl) --[[ Line: 47 | Named "cloneMessage" ]]
	return table.clone(Tbl)
end

local _ = function(p1) --[[ Line: 52 | Named "readInputValue" ]]
	local Kind = if p1 == nil then nil else p1.kind
	
	return if Kind == nil then nil else Kind.value
end

local _ = function(Tbl, Value) --[[ Line: 58 | Named "replaceInputValue" ]]
	local Copy = table.clone(Tbl)
	Copy.kind = { type = Tbl.kind.type, value = Value }
	
	return Copy
end

local _ = function(p1): boolean --[[ Line: 64 | Named "isFeed" ]]
	return type(p1) == "table" and type(p1.entry_map) == "table"
end

local function itemListFields(List) --[[ Line: 76 ]]
	local List1 = {}
	
	for i, value in List do
		if type(value) == "table" and #value > 0 and type(value[1]) == "table" then
			table.insert(List1, i)
		end
	end
	table.sort(List1)
	
	return List1
end

local _ = function(p1) --[[ Line: 87 | Named "readPoolId" ]]
	local PoolId = p1.pool_id
	
	return if type(PoolId) == "string" and PoolId ~= "" then PoolId else nil
end

local _ = function(p1, p2: number) --[[ Line: 92 | Named "takeItems" ]]
	local t = {}
	
	if p1 == nil then
		return t
	end
	for i = 1, math.min(#p1, p2) do
		t[i] = p1[i]
	end
	return t
end

local _ = function(p3, p4) --[[ Line: 106 | Named "readSortId" ]]
	local SortId = p4.sort_id
	
	if SortId == nil or SortId == "" then
		warn(`Home SDUI cache entry "{p7}" has no sort_id; using its identifier`)
		
		return p3
	else
		return (tostring(SortId))
	end
end

local function collectReferencedKeys(List, p3) --[[ Line: 125 ]]
	-- upvalues: collectReferencedKeys (copy)
	local ValueType = type(List)
	
	if ValueType == "table" then
		for _, value in List do
			collectReferencedKeys(value, p3)
		end
		return
	elseif ValueType == "string" or ValueType == "number" then
		p3[tostring(List)] = true
	end
end

local function filterOrder(EntryOrder, Entry_map) --[[ Line: 136 ]]
	local List = {}
	
	if EntryOrder == nil then
		return List
	end
	for _, value in EntryOrder do
		if Entry_map[value] ~= nil then
			table.insert(List, value)
		end
	end
	return List
end

local function filterOrderMap(EntryOrderMap, Entry_map) --[[ Line: 149 ]]
	-- upvalues: filterOrder (copy)
	local t = {}
	
	if EntryOrderMap == nil then
		return t
	end
	for i, value in EntryOrderMap do
		local FilterOrderResult = filterOrder(value.items, Entry_map)
		
		if #FilterOrderResult > 0 then
			local Copy = table.clone(value)
			Copy.items = FilterOrderResult
			t[i] = Copy
		end
	end
	return t
end

local function pruneFeed(Tbl, TopicIdToNumCacheItems) --[[ Line: 166 ]]
	-- upvalues: itemListFields (copy), filterOrder (copy), filterOrderMap (copy)
	local Entry_map = {}
	local Content_pools = {}
	local List = {}
	local t = {}
	
	if Tbl.entry_order ~= nil then
		for _, value in Tbl.entry_order do
			if not t[value] then
				t[value] = true
				table.insert(List, value)
			end
		end
	end
	local List1 = {}
	
	for i in Tbl.entry_map do
		if not t[i] then
			t[i] = true
			table.insert(List1, i)
		end
	end
	table.sort(List1)
	
	for _, value1 in List1 do
		table.insert(List, value1)
	end
	for _, value2 in List do
		local Entry = Tbl.entry_map[value2]
		
		if Entry ~= nil then
			local InputData = Entry.input_data
			local Kind = if InputData == nil then nil else InputData.kind
			local Value = if Kind == nil then nil else Kind.value
			
			if type(Value) == "table" then
				local PoolId = Value.pool_id
				local PoolId1 = if type(PoolId) == "string" and PoolId ~= "" then PoolId else nil
				local ItemListFieldsResult = itemListFields(Value)
				
				if PoolId1 ~= nil or #ItemListFieldsResult ~= 0 then
					local SortId = Value.sort_id
					local value3 = nil
					
					if SortId == nil or SortId == "" then
						warn(`Home SDUI cache entry "{value2}" has no sort_id; using its identifier`)
						value3 = value2
					else
						value3 = tostring(SortId)
					end
					local TopicIdToNumCacheItem = TopicIdToNumCacheItems[value3]
					
					if TopicIdToNumCacheItem ~= nil then
						local Copy = table.clone(Value)
						
						if PoolId1 ~= nil then
							local ContentPool = (Tbl.content_pools or {})[PoolId1]
							
							if ContentPool ~= nil then
								if Content_pools[PoolId1] == nil then
									local Copy1 = table.clone(ContentPool)
									local Items = ContentPool.items
									local Largest = math.max(TopicIdToNumCacheItem.cap - TopicIdToNumCacheItem.count, 0)
									local t1 = {}
									local Items1 = nil
									
									if Items == nil then
										Items1 = t1
									else
										for i1 = 1, math.min(#Items, Largest) do
											t1[i1] = Items[i1]
										end
										Items1 = t1
									end
									Copy1.items = Items1
									TopicIdToNumCacheItem.count += #Copy1.items
									Content_pools[PoolId1] = Copy1
								end
							else
								continue
							end
						else
							for _, value4 in ItemListFieldsResult do
								local Entry1 = Value[value4]
								local Largest = math.max(TopicIdToNumCacheItem.cap - TopicIdToNumCacheItem.count, 0)
								local t2 = {}
								local t1 = nil
								
								if Entry1 == nil then
									t1 = t2
								else
									for i2 = 1, math.min(#Entry1, Largest) do
										t2[i2] = Entry1[i2]
									end
									t1 = t2
								end
								TopicIdToNumCacheItem.count += #t1
								Copy[value4] = t1
							end
						end
						local Copy2 = table.clone(Entry)
						local InputData1 = Entry.input_data
						local Copy3 = table.clone(InputData1)
						Copy3.kind = { type = InputData1.kind.type, value = Copy }
						Copy2.input_data = Copy3
						Entry_map[value2] = Copy2
					end
				end
			end
		end
	end
	if next(Entry_map) == nil then
		return nil
	end
	local Copy4 = table.clone(Tbl)
	Copy4.entry_map = Entry_map
	
	if Tbl.content_pools ~= nil then
		Copy4.content_pools = Content_pools
	end
	if Tbl.entry_order ~= nil then
		Copy4.entry_order = filterOrder(Tbl.entry_order, Entry_map)
	end
	if Tbl.entry_order_map ~= nil then
		Copy4.entry_order_map = filterOrderMap(Tbl.entry_order_map, Entry_map)
	end
	return Copy4
end

local function pruneHydration(Tbl, p4) --[[ Line: 267 ]]
	-- upvalues: config (copy)
	if Tbl == nil then
		return nil
	end
	local Copy = table.clone(Tbl)
	
	for i, value in Tbl do
		if type(value) == "table" then
			local Entry = config[i]
			local t = {}
			
			for i1, value1 in value do
				if type(value1) == "table" and p4[tostring(i1)] then
					local Copy1 = table.clone(value1)
					
					if Entry ~= nil then
						for _, value2 in Entry do
							Copy1[value2] = nil
						end
					end
					t[i1] = Copy1
				end
			end
			Copy[i] = t
		end
	end
	return Copy
end

local function fillMissingTemplatesFromStore(p5) --[[ Line: 303 ]]
	-- upvalues: GetSduiTemplateStoreFunction (copy), AppPage (copy), Parent (copy)
	local SduiTemplateStore = GetSduiTemplateStoreFunction()
	local CachedRobloxComponentToTemplateId = SduiTemplateStore.getCachedRobloxComponentToTemplateId(AppPage.Home)
	
	if next(CachedRobloxComponentToTemplateId) == nil then return end
	local Copy = table.clone(p5.templates or {})
	local TemplateEntry = require(Parent.ServiceContractsProto).apppageplatform.shared.template_entry.TemplateEntry
	
	for Roblox_component, value in CachedRobloxComponentToTemplateId do
		if Copy[value] == nil then
			local Template = SduiTemplateStore.getTemplate(value)
			
			if Template ~= nil then
				Copy[value] = TemplateEntry.new({ template = Template, roblox_component = Roblox_component })
			end
		end
	end
	p5.templates = Copy
end

return {
	buildSduiHomePageCachePayload = function(Tbl) --[[ Line: 334 ]]
		-- upvalues: HomeOmniFeedCache (copy), pruneFeed (copy), collectReferencedKeys (copy), pruneHydration (copy), fillMissingTemplatesFromStore (copy)
		local TopicIdToNumCacheItems = HomeOmniFeedCache.getTopicIdToNumCacheItems()
		local t = {}
		local Page_entries = {}
		local PageEntries = Tbl.page_entries or {}
		for _, pageEntry in PageEntries do
			local InputData = pageEntry.input_data
			local Kind = if InputData == nil then nil else InputData.kind
			local Value = if Kind == nil then nil else Kind.value
			
			if type(Value) == "table" and type(Value.entry_map) == "table" then
				local PruneFeedResult = pruneFeed(Value, TopicIdToNumCacheItems)
				
				if PruneFeedResult ~= nil then
					local Copy = table.clone(pageEntry)
					local InputData1 = pageEntry.input_data
					local Copy1 = table.clone(InputData1)
					Copy1.kind = { type = InputData1.kind.type, value = PruneFeedResult }
					Copy.input_data = Copy1
					table.insert(Page_entries, Copy)
					collectReferencedKeys(Copy, t)
				end
			end
		end
		if #Page_entries == 0 then
			return nil
		else
			local Copy = table.clone(Tbl)
			Copy.page_entries = Page_entries
			Copy.hydration_data = pruneHydration(Tbl.hydration_data, t)
			Copy.request_id = ""
			fillMissingTemplatesFromStore(Copy)
			
			return Copy
		end
	end,
	serializeSduiHomePageCache = function(p6) --[[ Line: 379 ]]
		-- upvalues: Parent (copy)
		return require(Parent.ServiceContractsProto).proto.json.serializeBuffer(p6:encode())
	end,
	deserializeSduiHomePageCache = function(p6) --[[ Line: 385 ]]
		-- upvalues: Parent (copy)
		if p6 == nil then
			return nil
		else
			local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
			
			return ServiceContractsProtoModule.apppageplatform.home.home_page.HomePageResponse.decode((ServiceContractsProtoModule.proto.json.deserializeBuffer(p6)))
		end
	end,
	getSduiHomePageItemsForSortId = function(p6) --[[ Line: 398 ]]
		-- upvalues: HomeOmniFeedCache (copy), Parent (copy), itemListFields (copy)
		local CachedSduiHomePageData = HomeOmniFeedCache.getCachedSduiHomePageData()
		local DecodeResult = nil
		
		if CachedSduiHomePageData == nil then
			DecodeResult = nil
		else
			local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
			DecodeResult = ServiceContractsProtoModule.apppageplatform.home.home_page.HomePageResponse.decode((ServiceContractsProtoModule.proto.json.deserializeBuffer(CachedSduiHomePageData)))
		end
		if DecodeResult == nil then
			return nil
		end
		local Value1 = nil
		local Value = nil
		local PoolId1 = nil
		local ItemListFieldsResult = nil
		for _, pageEntry in DecodeResult.page_entries do
			local InputData = pageEntry.input_data
			local Kind = if InputData == nil then nil else InputData.kind
			Value = if Kind == nil then nil else Kind.value
			
			if type(Value) == "table" and type(Value.entry_map) == "table" then
				for i, value in Value.entry_map do
					local InputData1 = value.input_data
					local Kind1 = if InputData1 == nil then nil else InputData1.kind
					Value1 = if Kind1 == nil then nil else Kind1.value
					
					if type(Value1) == "table" then
						local PoolId = Value1.pool_id
						PoolId1 = if type(PoolId) == "string" and PoolId ~= "" then PoolId else nil
						ItemListFieldsResult = itemListFields(Value1)
						
						if PoolId1 ~= nil or #ItemListFieldsResult ~= 0 then
							local SortId = Value1.sort_id
							local i1 = nil
							
							if SortId == nil or SortId == "" then
								warn(`Home SDUI cache entry "{i}" has no sort_id; using its identifier`)
								i1 = i
							else
								i1 = tostring(SortId)
							end
							if i1 == p6 then
								if PoolId1 == nil then
									return Value1[ItemListFieldsResult[1]]
								end
								local List = {}
								local Items = ((Value.content_pools or {})[PoolId1] or {}).items or {}
								for _, item in Items do
									local Kind2 = if item == nil then nil else item.kind
									local Value2 = if Kind2 == nil then nil else Kind2.value
									
									if Value2 ~= nil then
										table.insert(List, Value2)
									end
								end
								return List
							end
						end
					end
				end
			end
		end
		return nil
	end
}