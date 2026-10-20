local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FFlagAXMigrateAllTabToSduiDev = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

return function()
	-- upvalues: GetCatalogCategoriesStoreModule (copy), FFlagAXMigrateAllTabToSduiDev (copy)
	local CatalogCategoriesStore = GetCatalogCategoriesStoreModule.getCatalogCategoriesStore()
	
	return if FFlagAXMigrateAllTabToSduiDev then CatalogCategoriesStore.getCategoriesMap(false) else CatalogCategoriesStore.getCategories(false)
end