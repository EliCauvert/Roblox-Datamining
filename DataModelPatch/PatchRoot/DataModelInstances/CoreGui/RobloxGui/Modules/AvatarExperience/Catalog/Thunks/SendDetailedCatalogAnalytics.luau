local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

return function(CatalogSearch, Callback, p1, p2, p3, p4, p5)
	-- upvalues: CatalogConstantsModule (copy), ArgCheckModule (copy), GetCatalogCategoriesStoreModule (copy), ItemDataModule (copy), CatalogUtilsModule (copy)
	return function(p6)
		-- upvalues: CatalogSearch (copy), CatalogConstantsModule (upval), ArgCheckModule (upval), GetCatalogCategoriesStoreModule (upval), ItemDataModule (upval), p1 (copy), p2 (copy), CatalogUtilsModule (upval), p3 (copy), p4 (copy), Callback (copy), p5 (copy)
		local State = p6:getState()
		local Detail = State.AvatarExperience.AvatarScene.AvatarRoute.opaque.params.detail
		local CategoryId = nil
		local SelectedSubcategoryIdResult = nil
		local SearchesInCatalogEntry = nil
		local ItemSubType = nil
		
		if CatalogSearch ~= CatalogConstantsModule.AnalyticsContext.ItemDetailsRecommendedItem then
			SearchesInCatalogEntry = State.Search.SearchesInCatalog[Detail]
			
			if CatalogSearch == CatalogConstantsModule.AnalyticsContext.CatalogSearch then
				ArgCheckModule.isNotNil(SearchesInCatalogEntry, "searchInCatalog")
				CategoryId = State.AvatarExperience.Catalog.SearchCategories.categoryId
				SelectedSubcategoryIdResult = State.AvatarExperience.Catalog.SearchCategories.subcategoryId
			else
				local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
				CategoryId = CatalogSelectionStore.selectedCategoryId(false)
				SelectedSubcategoryIdResult = CatalogSelectionStore.selectedSubcategoryId(false)
			end
			ItemSubType = CatalogUtilsModule.GetItemSubType(p2, (ItemDataModule(State.AvatarExperience.Common, p1, p2)))
		end
		Callback(CatalogSearch, math.ceil(p3 / p4), CategoryId, SelectedSubcategoryIdResult, nil, {
			keyword = SearchesInCatalogEntry and SearchesInCatalogEntry.keyword
		}, p3, p1, p2, ItemSubType, p5, State.AvatarExperience.Common.Widgets.WidgetInfo.RequestId, State.AvatarExperience.AnalyticsMetadata)
	end
end