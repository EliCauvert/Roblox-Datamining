local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local dataHydrationModule = require(parent.DataHydration)
local getSduiApiStore = require(parent.SduiSharedUtilities).getSduiApiStore
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)

local function asLegacyContent(p0) --[[ line: 28 ]]
	if typeof(p0) ~= "table" then
		return {}
	end
	local t = {}
	
	for i, v in p0 do
		if typeof(v) == "table" then
			table.insert(t, v)
		end
	end
	return t
end

return function(p1, p2) --[[ line: 42 | named "buildOrderedWidgetsFromCatalogPage" ]]
	-- upvalues: getSduiApiStore (ref), dataHydrationModule (ref), asLegacyContent (ref)
	local t = {}
	local inputData = getSduiApiStore().getInputData(p1, p2)
	
	if typeof(inputData) ~= "table" then
		return t
	end
	local entryOrder = inputData.entry_order
	local entryMap = inputData.entry_map
	
	if typeof(entryOrder) ~= "table" or typeof(entryMap) ~= "table" then
		return t
	end
	local marketplaceCatalogSortStore = dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false)
	
	for i, v in entryOrder do
		if typeof(v) == "string" and v ~= "" then
			local var7 = entryMap[v]
			
			if typeof(var7) == "table" then
				local var8 = if typeof(var7.input_data) == "table" and typeof(var7.input_data.kind) == "table" and typeof(var7.input_data.kind.value) == "table" then var7.input_data.kind.value else nil
				local var9 = if typeof(var8) == "table" and typeof(var8.id) == "string" then var8.id else nil
				
				if var9 ~= nil and var9 ~= "" then
					local marketplaceCatalogSort = marketplaceCatalogSortStore.getMarketplaceCatalogSort(var9)
					local var11 = if marketplaceCatalogSort and marketplaceCatalogSort.data then marketplaceCatalogSort.data(false) else nil
					
					if var11 then
						table.insert(t, {
							id = var9,
							type = var11.type,
							tagId = var11.tagId,
							content = asLegacyContent(var11.content)
						})
					else
						table.insert(t, { type = nil, tagId = nil, id = var9, content = {} })
					end
				end
			end
		end
	end
	return t
end