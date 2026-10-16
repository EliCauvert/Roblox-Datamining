local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local DataHydrationModule = require(Parent.DataHydration)
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local _ = require(AvatarExperienceCatalog.Models.WidgetListInfo)

local function asLegacyContent(Content) --[[ Line: 28 ]]
	if typeof(Content) ~= "table" then
		return {}
	end
	local List = {}
	
	for _, value in Content do
		if typeof(value) == "table" then
			table.insert(List, value)
		end
	end
	return List
end

return function(p1, p2) --[[ Line: 42 | Named "buildOrderedWidgetsFromCatalogPage" ]]
	-- upvalues: GetSduiApiStoreFunction (copy), DataHydrationModule (copy), asLegacyContent (copy)
	local List = {}
	local InputData = GetSduiApiStoreFunction().getInputData(p1, p2)
	
	if typeof(InputData) ~= "table" then
		return List
	end
	local EntryOrder = InputData.entry_order
	local EntryMap = InputData.entry_map
	
	if typeof(EntryOrder) ~= "table" or typeof(EntryMap) ~= "table" then
		return List
	end
	local MarketplaceCatalogSortStore = DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false)
	
	for _, value in EntryOrder do
		if typeof(value) == "string" and value ~= "" then
			local Entry = EntryMap[value]
			
			if typeof(Entry) == "table" then
				local Value = if typeof(Entry.input_data) == "table" and typeof(Entry.input_data.kind) == "table" and typeof(Entry.input_data.kind.value) == "table" then Entry.input_data.kind.value else nil
				local Id = if typeof(Value) == "table" and typeof(Value.id) == "string" then Value.id else nil
				
				if Id ~= nil and Id ~= "" then
					local MarketplaceCatalogSort = MarketplaceCatalogSortStore.getMarketplaceCatalogSort(Id)
					local DataResult = if MarketplaceCatalogSort and MarketplaceCatalogSort.data then MarketplaceCatalogSort.data(false) else nil
					
					if DataResult then
						table.insert(List, {
							id = Id,
							type = DataResult.type,
							tagId = DataResult.tagId,
							content = asLegacyContent(DataResult.content)
						})
					else
						table.insert(List, { type = nil, tagId = nil, id = Id, content = {} })
					end
				end
			end
		end
	end
	return List
end