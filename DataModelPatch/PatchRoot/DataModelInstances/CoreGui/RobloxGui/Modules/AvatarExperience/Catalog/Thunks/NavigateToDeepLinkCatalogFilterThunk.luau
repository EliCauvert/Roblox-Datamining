local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarExperienceFlagsModule = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesSDUILinks = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUILinks
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local NavigatedToDeepLinkCatalogFilterModule = require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local GetCatalogCategoriesFromStoreModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local ApplyCatalogCategorySelectionModule = require(Modules.AvatarExperience.Catalog.Stores.applyCatalogCategorySelection)

return function(p1)
	-- upvalues: NavigatedToDeepLinkCatalogFilterModule (copy), FFlagAXCatalogCategoriesSDUILinks (copy), FFlagAXMigrateAllTabToSduiDev (copy), GetCatalogCategoriesStoreModule (copy), GetCatalogCategoriesFromStoreModule (copy), CatalogUtilsModule (copy), ApplyCatalogCategorySelectionModule (copy)
	return function(p2)
		-- upvalues: NavigatedToDeepLinkCatalogFilterModule (upval), p1 (copy), FFlagAXCatalogCategoriesSDUILinks (upval), FFlagAXMigrateAllTabToSduiDev (upval), GetCatalogCategoriesStoreModule (upval), GetCatalogCategoriesFromStoreModule (upval), CatalogUtilsModule (upval), ApplyCatalogCategorySelectionModule (upval)
		p2:dispatch(NavigatedToDeepLinkCatalogFilterModule(p1))
		
		if (FFlagAXCatalogCategoriesSDUILinks or FFlagAXMigrateAllTabToSduiDev) and not GetCatalogCategoriesStoreModule.getCatalogCategoriesStore().getHasFetchedCategories(false) then return end
		local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
		local Taxonomy = p1.taxonomy
		
		if Taxonomy then
			local CategoryIdsByTaxonomy, CategoryIdsByTaxonomy2 = CatalogUtilsModule.findCategoryIdsByTaxonomy(Taxonomy, (GetCatalogCategoriesFromStoreModule()))
			
			if CategoryIdsByTaxonomy then
				if FFlagAXMigrateAllTabToSduiDev then
					ApplyCatalogCategorySelectionModule(GetCatalogCategoriesStoreModule.getCatalogSelectionStore, CategoryIdsByTaxonomy, CategoryIdsByTaxonomy2, { source = "DeepLink" })
					
					return
				end
				CatalogSelectionStore.changeCategory(CategoryIdsByTaxonomy, CategoryIdsByTaxonomy2)
			end
			return
		else
			local CategoryByCategoryId = if p1.category then CatalogUtilsModule.findCategoryByCategoryId(p1.category, (GetCatalogCategoriesFromStoreModule())) else CatalogUtilsModule.getCategoryId((CatalogSelectionStore.selectedCategoryId(false)))
			
			if CategoryByCategoryId == nil then return end
			local Id = CategoryByCategoryId.Id
			local Id1 = nil
			
			if p1.subcategory and CategoryByCategoryId and CategoryByCategoryId.Subcategories then
				local SubcategoryBySubcategoryId = CatalogUtilsModule.findSubcategoryBySubcategoryId(p1.subcategory, CategoryByCategoryId.Subcategories)
				
				if SubcategoryBySubcategoryId then
					Id1 = SubcategoryBySubcategoryId.Id
				end
			end
			if FFlagAXMigrateAllTabToSduiDev then
				ApplyCatalogCategorySelectionModule(GetCatalogCategoriesStoreModule.getCatalogSelectionStore, Id, Id1, { source = "DeepLink" })
				
				return
			else
				CatalogSelectionStore.changeCategory(Id, Id1)
			end
		end
	end
end