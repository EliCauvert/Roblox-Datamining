local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local CatalogSubcategories = AvatarExperienceCommonModule.Enums.CatalogSubcategories
local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagAXTallTilesForMakeupLooks = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXTallTilesForMakeupLooks

function useTallTileV2(p1, _): boolean
	-- upvalues: GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXTallTilesForMakeupLooks (copy)
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	local CatalogSearchSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore()
	local UseSignalStateResult = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
	local UseSignalStateResult1 = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	local UseSignalStateResult2 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryId)
	local UseSignalStateResult3 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategoryId)
	local UseSignalStateResult4 = if p1 then UseSignalStateResult2 else UseSignalStateResult
	local UseSignalStateResult5 = if p1 then UseSignalStateResult3 else UseSignalStateResult1
	
	return UseSignalStateResult4 == CatalogCategories.AllAnimations:rawValue() or (UseSignalStateResult4 == CatalogCategories.Characters:rawValue() or (UseSignalStateResult4 == CatalogCategories.Avatars:rawValue() or (UseSignalStateResult5 == CatalogSubcategories.FullBodies:rawValue() or FFlagAXTallTilesForMakeupLooks and UseSignalStateResult5 == CatalogSubcategories.MakeupLooks:rawValue())))
end

return useTallTileV2