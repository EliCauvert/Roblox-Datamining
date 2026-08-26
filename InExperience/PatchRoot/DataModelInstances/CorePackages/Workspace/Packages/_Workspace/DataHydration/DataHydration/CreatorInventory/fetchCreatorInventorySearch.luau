local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBuilderModule = require(parent.UrlBuilder)
local urlBase = urlBuilderModule.UrlBase
local _ = require(script.Parent.CreatorInventoryStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local t = {
	ASSET_TYPE_MODEL = "Model",
	ASSET_TYPE_AUDIO = "Audio",
	ASSET_TYPE_IMAGE = "Image"
}
local t_1 = {
	STATE_INVALID = "Invalid",
	STATE_ACTIVE = "Active",
	STATE_ARCHIVED = "Archived"
}

local function decodeSearchResponse(p1)
	-- upvalues: t (ref), t_1 (ref)
	assert(type(p1) == "table", "Creator Inventory response must be a table")
	local t_2 = {}
	
	for i, v in p1.items or {} do
		local cloned = table.clone(v)
		local assetItem = v.assetItem
		
		if assetItem ~= nil then
			local cloned_1 = table.clone(assetItem)
			local asset = assetItem.asset
			assert(type(asset) == "table", "Creator Inventory asset is missing")
			local assetType = t[asset.assetType]
			assert(assetType ~= nil, `Unsupported Creator Inventory asset type: {tostring(asset.assetType)}`)
			local state = t_1[asset.state]
			assert(state ~= nil, `Unsupported Creator Inventory asset state: {tostring(asset.state)}`)
			local cloned_2 = table.clone(asset)
			cloned_2.assetType = assetType
			cloned_2.state = state
			cloned_2.assetSubType = t[asset.assetSubType] or asset.assetSubType
			cloned_1.asset = cloned_2
			cloned.assetItem = cloned_1
		end
		t_2[i] = cloned
	end
	return { items = t_2, nextPageToken = p1.nextPageToken }
end

return function(p2, p3)
	-- upvalues: urlBase (ref), urlBuilderModule (ref), fetch (ref), decodeSearchResponse (ref), asPromise (ref)
	p3 = p3 or {}
	local baseUrl = p3.baseUrl or urlBase.APIS
	local t = {
		query = p2.query,
		filter = `assetTypes={p2.assetType};universeIds={p2.universeId}`
	}
	
	if p2.maxPageSize ~= nil then
		t.maxPageSize = p2.maxPageSize
	end
	if p2.pageToken ~= nil then
		t.pageToken = p2.pageToken
	end
	local replaced = string.gsub(urlBuilderModule.UrlBuilder.addQueryString(baseUrl .. "/creator-inventory-api/v1/-/creator-inventory-items:search", t), "creator%-inventory%-items%%3Asearch", "creator-inventory-items:search", 1)
	
	if p2.query == "" then
		replaced ..= "&query="
	end
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "creator-inventory.search",
		network = p3.network,
		url = replaced,
		decode = decodeSearchResponse
	}))
end