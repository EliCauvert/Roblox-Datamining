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

local function buildQueryStringWithArrayParams(p0) --[[ line: 20 ]]
	-- upvalues: t (ref), httpService (ref)
	local t_1 = {}
	
	for i, v in p0 do
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
	getCatalogV2SearchItemDetails = function(p1, p2) --[[ line: 38 ]]
		-- upvalues: buildQueryStringWithArrayParams (ref), url (ref), makeAXResponseHandlerModule (ref), normalizeCatalogV2SearchItemDetailsModule (ref), constantsModule (ref)
		local var8, var9 = p1(`{url.CATALOG_URL}v2/search/items/details?{buildQueryStringWithArrayParams(p2)}`, "GET")
		
		return makeAXResponseHandlerModule(var8, normalizeCatalogV2SearchItemDetailsModule, {
			modelMismatchCounter = constantsModule.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = constantsModule.FETCH_CATALOG_V2_SEARCH_ITEM_DETAILS_LATENCY_COUNTER_NAME
		}), var9
	end,
	buildQueryStringWithArrayParams = buildQueryStringWithArrayParams
}