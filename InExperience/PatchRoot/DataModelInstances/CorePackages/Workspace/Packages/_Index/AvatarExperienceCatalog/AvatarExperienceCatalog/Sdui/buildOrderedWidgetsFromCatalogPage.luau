local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local dataHydrationModule = require(parent.DataHydration)
local getSduiApiStore = require(parent.SduiSharedUtilities).getSduiApiStore
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)

local function asLegacyContent(p1)
	if typeof(p1) ~= "table" then
		return {}
	end
	local t = {}
	
	for i, v in p1 do
		if typeof(v) == "table" then
			table.insert(t, v)
		end
	end
	return t
end

return function(p2, p3)
	-- upvalues: getSduiApiStore (ref), dataHydrationModule (ref), asLegacyContent (ref)
	local t = {}
	local inputData = getSduiApiStore().getInputData(p2, p3)
	
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
			local var1 = entryMap[v]
			
			if typeof(var1) == "table" then
				local var2 = if typeof(var1.input_data) == "table" and typeof(var1.input_data.kind) == "table" and typeof(var1.input_data.kind.value) == "table" then var1.input_data.kind.value else nil
				local var3 = if typeof(var2) == "table" and typeof(var2.id) == "string" then var2.id else nil
				
				if var3 ~= nil and var3 ~= "" then
					local marketplaceCatalogSort = marketplaceCatalogSortStore.getMarketplaceCatalogSort(var3)
					local var4 = if marketplaceCatalogSort and marketplaceCatalogSort.data then marketplaceCatalogSort.data(false) else nil
					
					if var4 then
						table.insert(t, {
							id = var3,
							type = var4.type,
							tagId = var4.tagId,
							content = asLegacyContent(var4.content)
						})
					else
						table.insert(t, { type = nil, tagId = nil, id = var3, content = {} })
					end
				end
			end
		end
	end
	return t
end