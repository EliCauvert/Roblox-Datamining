local CorePackages = game:GetService("CorePackages")
local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FFlagAXCatalogCategoriesStoreImprovePerf = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStoreImprovePerf

return function(p1, p2, p3, p4)
	-- upvalues: FFlagAXCatalogCategoriesStoreImprovePerf (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy)
	local Name = nil
	local Name1 = nil
	local TaxonomyUuid = nil
	
	if FFlagAXCatalogCategoriesStoreImprovePerf then
		Name = if p2 then p2.Name else nil
		Name1 = if p3 then p3.Name else nil
		TaxonomyUuid = if p4 then p4.TaxonomyUuid else nil
	else
		local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
		local UseSignalStateResult = UseSignalStateFunction(CatalogSelectionStore.selectedCategory)
		local UseSignalStateResult1 = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategory)
		local UseSignalStateResult2 = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryInfo)
		local CatalogSearchSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore()
		local UseSignalStateResult3 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategory)
		local UseSignalStateResult4 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategory)
		local UseSignalStateResult5 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryInfo)
		
		if p1 then
			Name = if UseSignalStateResult3 then UseSignalStateResult3.Name else nil
			Name1 = if UseSignalStateResult4 then UseSignalStateResult4.Name else nil
			TaxonomyUuid = if UseSignalStateResult5 then UseSignalStateResult5.TaxonomyUuid else nil
		else
			Name = if UseSignalStateResult then UseSignalStateResult.Name else nil
			Name1 = if UseSignalStateResult1 then UseSignalStateResult1.Name else nil
			TaxonomyUuid = if UseSignalStateResult2 then UseSignalStateResult2.TaxonomyUuid else nil
		end
	end
	return ReactModule.useMemo(function()
		-- upvalues: Name (ref), Name1 (ref), TaxonomyUuid (ref)
		return {
			impressionsCategory = Name,
			impressionsSubcategory = Name1,
			impressionsTaxonomyId = TaxonomyUuid
		}
	end, { Name, Name1, TaxonomyUuid })
end