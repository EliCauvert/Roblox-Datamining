local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local GetCatalogCategoriesFromStoreModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local FFlagAXCatalogCategoriesSDUILinks = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUILinks
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local FFlagAXFixPrefetchMarketplaceStartupCrash = AvatarExperienceFlagsModule.FFlagAXFixPrefetchMarketplaceStartupCrash

return require(CorePackages.Packages.Rodux).createReducer({
	subcategoryId = nil,
	categoryId = require(Modules.AvatarExperience.Common.Constants).DefaultCatalogCategoryId
}, {
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, p2)
		-- upvalues: FFlagAXCatalogCategoriesSDUILinks (copy), FFlagAXMigrateAllTabToSduiDev (copy), GetCatalogCategoriesStoreModule (copy), GetCatalogCategoriesFromStoreModule (copy), CatalogUtilsModule (copy), FFlagAXFixPrefetchMarketplaceStartupCrash (copy)
		if FFlagAXCatalogCategoriesSDUILinks or FFlagAXMigrateAllTabToSduiDev then
			local CatalogCategoriesStore = GetCatalogCategoriesStoreModule.getCatalogCategoriesStore()
			
			if not CatalogCategoriesStore.getHasFetchedCategories(false) then
				if CatalogCategoriesStore.setPendingDeepLinkAction then
					CatalogCategoriesStore.setPendingDeepLinkAction(p2)
				end
				return p1
			end
		end
		local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
		local Taxonomy = p2.taxonomy
		
		if Taxonomy then
			local CategoryIdsByTaxonomy, CategoryIdsByTaxonomy2 = CatalogUtilsModule.findCategoryIdsByTaxonomy(Taxonomy, (GetCatalogCategoriesFromStoreModule()))
			
			if CategoryIdsByTaxonomy and not FFlagAXFixPrefetchMarketplaceStartupCrash then
				CatalogSelectionStore.changeCategory(CategoryIdsByTaxonomy, CategoryIdsByTaxonomy2)
			end
			return p1
		else
			local CategoryByCategoryId = if p2.category then CatalogUtilsModule.findCategoryByCategoryId(p2.category, (GetCatalogCategoriesFromStoreModule())) else CatalogUtilsModule.getCategoryId((CatalogSelectionStore.selectedCategoryId(false)))
			
			if CategoryByCategoryId == nil then
				return p1
			end
			local Id = CategoryByCategoryId.Id
			local Id1 = nil
			
			if p2.subcategory and CategoryByCategoryId and CategoryByCategoryId.Subcategories then
				local SubcategoryBySubcategoryId = CatalogUtilsModule.findSubcategoryBySubcategoryId(p2.subcategory, CategoryByCategoryId.Subcategories)
				
				if SubcategoryBySubcategoryId then
					Id1 = SubcategoryBySubcategoryId.Id
				end
			end
			if not FFlagAXFixPrefetchMarketplaceStartupCrash then
				CatalogSelectionStore.changeCategory(Id, Id1)
			end
			return p1
		end
	end
})