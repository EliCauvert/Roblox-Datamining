local DataHydrationModule = require(game:GetService("CorePackages").Workspace.Packages.DataHydration)
local GetCatalogCategoriesModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.GetCatalogCategories)

local function toMarketplaceData(p1)
	return {
		id = p1.Id,
		name = p1.CategoryFilter or p1.Name,
		title = p1.Title,
		taxonomyId = p1.TaxonomyUuid,
		assetTypes = p1.AssetTypeIdStrings,
		bundleTypes = p1.BundleTypes,
		tileType = p1.TileType,
		timeToRefresh = p1.TimeToRefresh,
		categoryId = p1.CategoryId,
		subcategoryId = p1.SubcategoryId,
		cameraFocus = p1.CameraFocus,
		cameraZoomRadius = p1.CameraZoomRadius,
		canAnimateCameraBasedMood = p1.CanAnimateCameraBasedMood
	}
end

return function(p1)
	-- upvalues: GetCatalogCategoriesModule (copy), DataHydrationModule (copy), toMarketplaceData (copy)
	local MarketplaceCatalogCategoryStore = DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false)
	local t = {}
	
	for _, value in p1 or GetCatalogCategoriesModule() do
		if value and value.Id then
			t[value.Id] = toMarketplaceData(value)
			
			if value.Subcategories then
				local Subcategories = {}
				
				for _, subcategory in value.Subcategories do
					if subcategory and subcategory.Id then
						table.insert(Subcategories, subcategory.Id)
						t[subcategory.Id] = toMarketplaceData(subcategory)
					end
				end
				if #Subcategories > 0 then
					t[value.Id].subcategories = Subcategories
				end
			end
		end
	end
	MarketplaceCatalogCategoryStore.updateMarketplaceCatalogCategories(t)
end