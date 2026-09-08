local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local _ = require(parent.AvatarExperienceCommon)
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local normalizeCatalogCategoriesModule = require(script.Parent.normalizeCatalogCategories)
local constantsModule = require(script.Parent.constants)

return {
	getCatalogCategories = function(p1, p2)
		-- upvalues: url (ref), makeAXResponseHandlerModule (ref), normalizeCatalogCategoriesModule (ref), constantsModule (ref)
		local var1, var2 = p1(`{url.APIS_URL}marketplace-widgets/v1/pills?{url:makeQueryString({ versionId = p2 })}`, "GET")
		
		return makeAXResponseHandlerModule(var1, normalizeCatalogCategoriesModule, {
			modelMismatchCounter = constantsModule.FETCH_CATALOG_CATEGORIES_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = constantsModule.FETCH_CATALOG_CATEGORIES_LATENCY_COUNTER_NAME
		}), var2
	end
}