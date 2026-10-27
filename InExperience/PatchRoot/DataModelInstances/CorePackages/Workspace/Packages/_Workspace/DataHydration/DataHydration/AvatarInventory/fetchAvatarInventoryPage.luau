local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpService = game:GetService("HttpService")
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(script.Parent.AvatarInventoryStoreTypes)
local InventoryOutfitTypeToInventoryTypeId = require(Parent.AvatarExperienceModel).Constants.InventoryOutfitTypeToInventoryTypeId

local function parseAvatarInventoryResponse(p1)
	local NextPageToken = if typeof(p1) == "table" then p1.nextPageToken else nil
	
	return {
		items = if typeof(p1) == "table" and typeof(p1.avatarInventoryItems) == "table" then p1.avatarInventoryItems else {},
		nextPageToken = if typeof(NextPageToken) == "string" and NextPageToken ~= "" then NextPageToken else nil
	}
end

local function buildQueryString(p1, Input)
	-- upvalues: HttpService (copy), InventoryOutfitTypeToInventoryTypeId (copy), HttpModule (copy)
	local config = {
		pageLimit = p1.pageLimit or 25,
		sortOption = p1.sortOption or "recentAdded",
		pageToken = if Input then HttpService:UrlEncode(Input) else nil
	}
	local Count = 0
	
	local function _(p2, p3)
		-- upvalues: config (copy), Count (ref)
		config[`itemCategories[{Count}].itemType`] = p2
		config[`itemCategories[{Count}].itemSubType`] = p3
		Count += 1
	end
	
	local AssetTypeIds = p1.assetTypeIds or {}
	for _, assetTypeId in AssetTypeIds do
		config[`itemCategories[{Count}].itemType`] = "asset"
		config[`itemCategories[{Count}].itemSubType`] = assetTypeId
		Count += 1
	end
	local OutfitInventoryTypes = p1.outfitInventoryTypes or {}
	for _, outfitInventoryType in OutfitInventoryTypes do
		local InventoryOutfitTypeToInventoryTypeIdEntry = InventoryOutfitTypeToInventoryTypeId[outfitInventoryType]
		
		if InventoryOutfitTypeToInventoryTypeIdEntry == nil then
			error(`AvatarInventory: unknown outfit inventory type {outfitInventoryType}`)
		end
		config[`itemCategories[{Count}].itemType`] = "outfit"
		config[`itemCategories[{Count}].itemSubType`] = InventoryOutfitTypeToInventoryTypeIdEntry
		Count += 1
	end
	return HttpModule.Url:makeQueryString(config)
end

return function(p2, p3, p4)
	-- upvalues: HttpModule (copy), HttpClientModule (copy), buildQueryString (copy), parseAvatarInventoryResponse (copy)
	local P7 = p4 or {}
	
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "avatar.avatar-inventory.get",
		network = P7.network,
		url = `{string.gsub(P7.baseUrl or HttpModule.Url.AVATAR_URL, "/$", "")}/v1/avatar-inventory?{buildQueryString(p2, p3)}`,
		decode = parseAvatarInventoryResponse
	})))
end