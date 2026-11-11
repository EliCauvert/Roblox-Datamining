local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(game:GetService("CorePackages").Packages.SignalsReact).useSignalState
local AXFixTallTilesForSubcategories = game:DefineFastFlag("AXFixTallTilesForSubcategories", false)

function useTallTileV3(p1): boolean
	-- upvalues: GetCatalogCategoriesStoreModule (copy), AXFixTallTilesForSubcategories (copy), UseSignalStateFunction (copy)
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	local CatalogSearchSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore()
	
	if AXFixTallTilesForSubcategories then
		local UseSignalStateResult = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryInfo)
		local UseSignalStateResult1 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryInfo)
		
		return (if p1 then UseSignalStateResult1 else UseSignalStateResult).TileType == "Tall"
	else
		local UseSignalStateResult = UseSignalStateFunction(CatalogSelectionStore.selectedCategory)
		local UseSignalStateResult2 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategory)
		
		return (if p1 then UseSignalStateResult2 else UseSignalStateResult).TileType == "Tall"
	end
end

return useTallTileV3