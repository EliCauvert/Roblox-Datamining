local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(game:GetService("CorePackages").Packages.SignalsReact).useSignalState

return function()
	-- upvalues: GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy)
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	
	return UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId), (UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId))
end