local HttpService = game:GetService("HttpService")
local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local _ = require(AvatarExperienceCatalog.Models.CatalogV2SearchItemDetails)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local NormalizeCatalogV2SearchItemDetailsModule = require(script.Parent.normalizeCatalogV2SearchItemDetails)
local ConstantsModule = require(script.Parent.constants)
local config = { assetTypeIds = true, bundleTypeIds = true }

local function buildQueryStringWithArrayParams(List): string --[[ Line: 20 ]]
	-- upvalues: config (copy), HttpService (copy)
	local List1 = {}
	
	for i, value in List do
		if not config[i] or type(value) ~= "table" then
			if not config[i] then
				table.insert(List1, `{i}={HttpService:UrlEncode((tostring(value)))}`)
				continue
			end
			continue
		end
		for _, value1 in value do
			table.insert(List1, `{i}={HttpService:UrlEncode((tostring(value1)))}`)
		end
	end
	return table.concat(List1, "&")
end

return {
	getCatalogV2SearchItemDetails = function(Callback, p1) --[[ Line: 38 ]]
		-- upvalues: buildQueryStringWithArrayParams (copy), Url (copy), MakeAXResponseHandlerModule (copy), NormalizeCatalogV2SearchItemDetailsModule (copy), ConstantsModule (copy)
		local GET, GET2 = Callback(`{Url.CATALOG_URL}v2/search/items/details?{buildQueryStringWithArrayParams(p1)}`, "GET")
		
		return MakeAXResponseHandlerModule(GET, NormalizeCatalogV2SearchItemDetailsModule, {
			modelMismatchCounter = ConstantsModule.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = ConstantsModule.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_LATENCY_COUNTER_NAME
		}), GET2
	end,
	buildQueryStringWithArrayParams = buildQueryStringWithArrayParams
}