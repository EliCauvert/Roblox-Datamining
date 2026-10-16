local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local _ = require(Parent.AvatarExperienceCommon)
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local NormalizeCatalogCategoriesModule = require(script.Parent.normalizeCatalogCategories)
local ConstantsModule = require(script.Parent.constants)

return {
	getCatalogCategories = function(Callback, VersionId) --[[ Line: 15 ]]
		-- upvalues: Url (copy), MakeAXResponseHandlerModule (copy), NormalizeCatalogCategoriesModule (copy), ConstantsModule (copy)
		local GET, GET2 = Callback(`{Url.APIS_URL}marketplace-widgets/v1/pills?{Url:makeQueryString({ versionId = VersionId })}`, "GET")
		
		return MakeAXResponseHandlerModule(GET, NormalizeCatalogCategoriesModule, {
			modelMismatchCounter = ConstantsModule.FETCH_CATALOG_CATEGORIES_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = ConstantsModule.FETCH_CATALOG_CATEGORIES_LATENCY_COUNTER_NAME
		}), GET2
	end
}