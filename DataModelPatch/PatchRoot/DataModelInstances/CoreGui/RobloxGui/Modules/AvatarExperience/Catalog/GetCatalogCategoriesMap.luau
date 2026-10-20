local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

return function()
	-- upvalues: GetCatalogCategoriesStoreModule (copy)
	return GetCatalogCategoriesStoreModule.getCatalogCategoriesStore().getCategoriesMap(false) or {}
end