local httpService = game:GetService("HttpService")
local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local _ = require(avatarExperienceCatalog.Models.CatalogV2SearchItemDetails)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local normalizeCatalogV2SearchItemDetailsModule = require(script.Parent.normalizeCatalogV2SearchItemDetails)
local constantsModule = require(script.Parent.constants)
local t = { assetTypeIds = true, bundleTypeIds = true }

local function buildQueryStringWithArrayParams(p1)
	-- upvalues: t (ref), httpService (ref)
	local t_1 = {}
	
	for i, v in p1 do
		if not t[i] or type(v) ~= "table" then
			if not t[i] then
				table.insert(t_1, `{i}={httpService:UrlEncode(tostring(v))}`)
			end
		end
		for i_1, v_1 in v do
			table.insert(t_1, `{i}={httpService:UrlEncode(tostring(v_1))}`)
		end
	end
	return table.concat(t_1, "&")
end

return {
	getCatalogV2SearchItemDetails = function(p2, p3)
		-- upvalues: buildQueryStringWithArrayParams (ref), url (ref), makeAXResponseHandlerModule (ref), normalizeCatalogV2SearchItemDetailsModule (ref), constantsModule (ref)
		local var1, var2 = p2(`{url.CATALOG_URL}v2/search/items/details?{buildQueryStringWithArrayParams(p3)}`, "GET")
		
		return makeAXResponseHandlerModule(var1, normalizeCatalogV2SearchItemDetailsModule, {
			modelMismatchCounter = constantsModule.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = constantsModule.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_LATENCY_COUNTER_NAME
		}), var2
	end,
	buildQueryStringWithArrayParams = buildQueryStringWithArrayParams
}