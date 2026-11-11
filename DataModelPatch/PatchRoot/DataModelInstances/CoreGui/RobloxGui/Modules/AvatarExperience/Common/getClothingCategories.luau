local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Constants = AvatarExperienceCommonModule.Constants
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local CatalogSubcategories = AvatarExperienceCommonModule.Enums.CatalogSubcategories
local CatalogCategoryIds = AvatarExperienceCommonModule.Enums.CatalogCategoryIds
local CatalogSDUICategoryIds = AvatarExperienceCommonModule.Enums.CatalogSDUICategoryIds
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogBodySuits = AvatarExperienceFlagsModule.FFlagAXCatalogBodySuits
local FFlagAXShowBodySuitsCategoryInCatalog = AvatarExperienceFlagsModule.FFlagAXShowBodySuitsCategoryInCatalog
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarEditorSubcategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorSubcategories
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local CatalogCategoryTaxonomyUUIDsModule = require(Modules.AvatarExperience.Common.Enum.CatalogCategoryTaxonomyUUIDs)
local GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule = require(Modules.AvatarExperience.Flags.GetFFlagAXAddNavigationKeyToEditorSubcategories)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXSwapOuterwearSubcategoryOrderModule = require(Modules.AvatarExperience.Flags.FFlagAXSwapOuterwearSubcategoryOrder)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local AXCategories: string = game:DefineFastString("AXCategories", if GetFFlagAXEnableSlotBasedEditorModule() then "JacketAccessory.ClassicShirts.ClassicTShirts.ClassicPants.LeftShoeAccessory.RightShoeAccessory" else "JacketAccessory.ClassicShirts.ClassicTShirts.ClassicPants")
local CollectSetResult = DashModule.collectSet(string.split(AXCategories, "."))
local GetFIntMinSecsToRefreshRecommendedCatalogPageModule = require(Modules.AvatarExperience.Flags.GetFIntMinSecsToRefreshRecommendedCatalogPage)
local config = {
	Tops = "Tops",
	Outerwear = "Outerwear",
	Bottoms = "Bottoms",
	LeftShoeAccessory = "LeftShoeAccessory",
	RightShoeAccessory = "RightShoeAccessory",
	Shoes = "Shoes",
	DivisibleShoes = "DivisibleShoes",
	ClassicShirts = "ClassicShirts",
	ClassicTShirts = "ClassicTShirts",
	ClassicPants = "ClassicPants",
	ShirtAccessory = "ShirtAccessory",
	TShirtAccessory = "TShirtAccessory",
	SweaterAccessory = "SweaterAccessory",
	PantsAccessory = "PantsAccessory",
	JacketAccessory = "JacketAccessory",
	ShortsAccessory = "ShortsAccessory",
	DressSkirtAccessory = "DressSkirtAccessory",
	Bodysuits = if FFlagAXCatalogBodySuits then "Bodysuits" else nil
}

local function createCatalogSubcategories()
	-- upvalues: config (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), CatalogSubcategories (copy), ConstantsModule (copy), Constants (copy), SearchUuidModule (copy), GetFIntMinSecsToRefreshRecommendedCatalogPageModule (copy), CatalogCategoryTaxonomyUUIDsModule (copy), FFlagAXCatalogBodySuits (copy)
	local config1 = {
		[config.ShirtAccessory] = {
			Name = "Shirts",
			Title = "Feature.Avatar.Label.Shirts",
			SubcategoryId = 59,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Shirts,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Shirts,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ShirtAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.Shirts:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Shirts:rawValue()
		},
		[config.TShirtAccessory] = {
			Name = "TShirts",
			Title = "Feature.Catalog.LabelTShirts",
			SubcategoryId = 58,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.TShirts,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.TShirts,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.TShirtAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.TShirts:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.TShirts:rawValue()
		},
		[config.SweaterAccessory] = {
			Name = "Sweaters",
			Title = "Feature.Avatar.Label.Sweaters",
			SubcategoryId = 62,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Sweaters,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Sweaters,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.SweaterAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.Sweaters:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Sweaters:rawValue()
		},
		[config.JacketAccessory] = {
			Name = "Jackets",
			Title = "Feature.Avatar.Label.Jackets",
			SubcategoryId = 61,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Jackets,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Jackets,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.JacketAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.Jackets:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Jackets:rawValue()
		},
		[config.PantsAccessory] = {
			Name = "Pants",
			Title = "Feature.Avatar.Label.Pants",
			SubcategoryId = 60,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Pants,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Pants,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.PantsAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.Pants:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Pants:rawValue()
		},
		[config.DressSkirtAccessory] = {
			Name = "DressSkirt",
			Title = "Feature.Avatar.Label.DressesAndSkirts",
			SubcategoryId = 65,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.DressesAndSkirts,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.DressesAndSkirts:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.DressesAndSkirts:rawValue()
		},
		[config.ShortsAccessory] = {
			Name = "Shorts",
			Title = "Feature.Avatar.Label.Shorts",
			SubcategoryId = 63,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Shorts,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Shorts,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ShortsAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.Shorts:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Shorts:rawValue()
		},
		[config.Shoes] = {
			Name = "Shoes",
			Title = "Feature.Avatar.Label.Shoes",
			SubcategoryId = 64,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Shoes,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Shoes,
			BundleTypes = { ConstantsModule.BundleTypeIdStrings.Shoes },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.Shoes:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Shoes:rawValue()
		},
		[config.ClassicShirts] = {
			Name = "Classic Shirts",
			Title = "Feature.Avatar.Label.ClassicShirts",
			SubcategoryId = 56,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.ClassicShirts,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.ClassicShirts,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Shirt },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.ClassicShirts:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.ClassicShirts:rawValue()
		},
		[config.ClassicTShirts] = {
			Name = "Classic T-Shirts",
			Title = "Feature.Avatar.Label.ClassicTShirts",
			SubcategoryId = 55,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.ClassicTShirts,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.ClassicTShirts,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.TShirt },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.ClassicTShirts:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.ClassicTShirts:rawValue()
		},
		[config.ClassicPants] = {
			Name = "Classic Pants",
			Title = "Feature.Avatar.Label.ClassicPants",
			SubcategoryId = 57,
			isSubcategory = true,
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.ClassicPants,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.ClassicPants,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Pants },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.ClassicPants:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.ClassicPants:rawValue()
		}
	}
	
	if FFlagAXCatalogBodySuits then
		config1[config.Bodysuits] = {
			Name = "Bodysuits",
			Title = "Feature.Avatar.Label.Bodysuits",
			isSubcategory = true,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = CatalogSubcategories.Bodysuits:rawValue(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Bodysuits:rawValue()
		}
	end
	return config1
end

local function buildCatalogClothingAssetTypes(CollectSetResult)
	-- upvalues: config (copy), ConstantsModule (copy)
	local List = {}
	
	if CollectSetResult[config.ShirtAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.ShirtAccessory)
	end
	if CollectSetResult[config.TShirtAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.TShirtAccessory)
	end
	if CollectSetResult[config.SweaterAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.SweaterAccessory)
	end
	if CollectSetResult[config.JacketAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.JacketAccessory)
	end
	if CollectSetResult[config.PantsAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.PantsAccessory)
	end
	if CollectSetResult[config.ShortsAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.ShortsAccessory)
	end
	if CollectSetResult[config.DressSkirtAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory)
	end
	if CollectSetResult[config.LeftShoeAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory)
	end
	if CollectSetResult[config.RightShoeAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.RightShoeAccessory)
	end
	if CollectSetResult[config.ClassicShirts] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.Shirt)
	end
	if CollectSetResult[config.ClassicTShirts] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.TShirt)
	end
	if CollectSetResult[config.ClassicPants] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.Pants)
	end
	return List
end

local function buildCatalogSubcategoriesToUse(CollectSetResult, p1)
	-- upvalues: config (copy), FFlagAXCatalogBodySuits (copy), FFlagAXShowBodySuitsCategoryInCatalog (copy)
	local List = {}
	
	if CollectSetResult[config.ShirtAccessory] then
		table.insert(List, p1[config.ShirtAccessory])
	end
	if CollectSetResult[config.TShirtAccessory] then
		table.insert(List, p1[config.TShirtAccessory])
	end
	if CollectSetResult[config.SweaterAccessory] then
		table.insert(List, p1[config.SweaterAccessory])
	end
	if CollectSetResult[config.JacketAccessory] then
		table.insert(List, p1[config.JacketAccessory])
	end
	if CollectSetResult[config.PantsAccessory] then
		table.insert(List, p1[config.PantsAccessory])
	end
	if CollectSetResult[config.DressSkirtAccessory] then
		table.insert(List, p1[config.DressSkirtAccessory])
	end
	if FFlagAXCatalogBodySuits and (CollectSetResult[config.Bodysuits] or FFlagAXShowBodySuitsCategoryInCatalog) then
		table.insert(List, p1[config.Bodysuits])
	end
	if CollectSetResult[config.ShortsAccessory] then
		table.insert(List, p1[config.ShortsAccessory])
	end
	if CollectSetResult[config.LeftShoeAccessory] then
		table.insert(List, p1[config.Shoes])
	end
	if CollectSetResult[config.ClassicShirts] then
		table.insert(List, p1[config.ClassicShirts])
	end
	if CollectSetResult[config.ClassicTShirts] then
		table.insert(List, p1[config.ClassicTShirts])
	end
	if CollectSetResult[config.ClassicPants] then
		table.insert(List, p1[config.ClassicPants])
	end
	return List
end

local v1 = nil

local function createClothingCategories()
	-- upvalues: AXCategories (ref), CollectSetResult (ref), DashModule (copy), createCatalogSubcategories (copy), buildCatalogClothingAssetTypes (copy), buildCatalogSubcategoriesToUse (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), CatalogCategories (copy), SearchUuidModule (copy), GetFIntMinSecsToRefreshRecommendedCatalogPageModule (copy), CatalogCategoryIds (copy), CatalogCategoryTaxonomyUUIDsModule (copy), config (copy), ConstantsModule (copy), GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule (copy), AvatarEditorSubcategories (copy), Constants (copy), ConstantsModule1 (copy), FFlagAXCatalogCategoriesSDUI (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogSDUICategoryIds (copy), FFlagAXSwapOuterwearSubcategoryOrderModule (copy), AvatarEditorCategories (copy)
	AXCategories = game:GetFastString("AXCategories")
	CollectSetResult = DashModule.collectSet(string.split(AXCategories, "."))
	local CatalogCategories1 = {
		Name = "Clothing",
		Title = "Feature.Catalog.Label.Clothing",
		CanAnimateCameraBasedMood = true,
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Clothing,
		AssetTypeIdStrings = buildCatalogClothingAssetTypes(CollectSetResult),
		SearchUuid = SearchUuidModule(),
		Subcategories = buildCatalogSubcategoriesToUse(CollectSetResult, (createCatalogSubcategories())),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		Id = CatalogCategories.Clothing:rawValue(),
		CategoryId = CatalogCategoryIds.Clothing:rawValue(),
		TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Clothing:rawValue()
	}
	local List = {}
	
	if CollectSetResult[config.ShirtAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.ShirtAccessory)
	end
	if CollectSetResult[config.TShirtAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.TShirtAccessory)
	end
	if CollectSetResult[config.SweaterAccessory] then
		table.insert(List, ConstantsModule.AssetTypeIdStrings.SweaterAccessory)
	end
	local TShirtAccessory = if CollectSetResult[config.TShirtAccessory] then ConstantsModule.AssetTypeIdStrings.TShirtAccessory else List[1]
	local List1 = {}
	
	if CollectSetResult[config.PantsAccessory] then
		table.insert(List1, ConstantsModule.AssetTypeIdStrings.PantsAccessory)
	end
	if CollectSetResult[config.ShortsAccessory] then
		table.insert(List1, ConstantsModule.AssetTypeIdStrings.ShortsAccessory)
	end
	if CollectSetResult[config.DressSkirtAccessory] then
		table.insert(List1, ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory)
	end
	local config1 = {
		Tops = {
			Name = "Tops",
			Title = "Feature.Catalog.Label.Tops",
			IconOn = "icons/menu/clothing/shirts_on",
			IconOff = "icons/menu/clothing/shirts_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Tops else nil,
			RecommendedAssetTypeIdString = TShirtAccessory,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Tops,
			RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = if GetFFlagAXEnableSlotBasedEditorModule() then CatalogSubcategories.Shirts else CatalogSubcategories.TShirts
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = if GetFFlagAXEnableSlotBasedEditorModule() then CatalogSubcategories.Shirts:rawValue() else "T-Shirts"
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = if GetFFlagAXEnableSlotBasedEditorModule() then CatalogSDUICategoryIds.Clothing_Shirts:rawValue() else CatalogSDUICategoryIds.Clothing_TShirts:rawValue()
			} else nil,
			AssetTypeIdStrings = List,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.Tops
		},
		Outerwear = {
			Name = "Outerwear",
			Title = "Feature.Avatar.Label.Outerwear",
			IconOn = "icons/menu/clothing/jackets_on",
			IconOff = "icons/menu/clothing/jackets_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Outerwear else nil,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Outerwear,
			RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.Jackets
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.Jackets:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_Jackets:rawValue()
			} else nil,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.JacketAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.Outerwear
		},
		Bottoms = {
			Name = "Bottoms",
			Title = "Feature.Avatar.Label.Bottoms",
			IconOn = "icons/menu/clothing/pants_on",
			IconOff = "icons/menu/clothing/pants_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Bottoms else nil,
			RecommendedAssetTypeIdString = if CollectSetResult[config.PantsAccessory] then ConstantsModule.AssetTypeIdStrings.PantsAccessory else List1[1],
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Bottoms,
			RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.Pants
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.Pants:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_Pants:rawValue()
			} else nil,
			AssetTypeIdStrings = List1,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.Bottoms
		},
		Shoes = if GetFFlagAXEnableSlotBasedEditorModule() then {
			Name = "Shoes",
			Title = "Feature.Avatar.Label.Shoes",
			IconOn = "icons/menu/clothing/shoes_on",
			IconOff = "icons/menu/clothing/shoes_off",
			RenderItemTiles = true,
			RenderOutfitItemTiles = true,
			Category = 2,
			SubcategoryFiltersHeader = "Feature.Catalog.Heading.ShowShoes",
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Shoes else nil,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Shoes,
			RecommendationsType = ConstantsModule1.RecommendationsType.Shoes,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.Shoes
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.Shoes:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_Shoes:rawValue()
			} else nil,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.Shoes },
			SubcategoryFilters = {
				{
					Name = "Full Pairs",
					Title = "Feature.Avatar.Label.FullPair",
					RenderOutfitItemTiles = true,
					NavigationKey = AvatarEditorSubcategories.ShoesPairs,
					BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.Shoes },
					SearchUuid = SearchUuidModule()
				},
				{
					Name = "Left Shoes",
					Title = "Feature.Avatar.Label.LeftShoe",
					NavigationKey = AvatarEditorSubcategories.LeftShoes,
					AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory },
					SearchUuid = SearchUuidModule()
				},
				{
					Name = "Right Shoes",
					Title = "Feature.Avatar.Label.RightShoe",
					NavigationKey = AvatarEditorSubcategories.RightShoes,
					AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RightShoeAccessory },
					SearchUuid = SearchUuidModule()
				}
			},
			Id = AvatarEditorSubcategories.Shoes
		} else nil,
		LeftShoes = if GetFFlagAXEnableSlotBasedEditorModule() then nil else {
			Name = "Left Shoes",
			Title = "Feature.Avatar.Label.LeftShoes",
			IconOn = "icons/menu/clothing/shoes_on",
			IconOff = "icons/menu/clothing/shoes_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.LeftShoes else nil,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Shoes,
			RecommendationsType = ConstantsModule1.RecommendationsType.Shoes,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.Shoes
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.Shoes:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_Shoes:rawValue()
			} else nil,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.LeftShoes
		},
		RightShoes = if GetFFlagAXEnableSlotBasedEditorModule() then nil else {
			Name = "Right Shoes",
			Title = "Feature.Avatar.Label.RightShoes",
			IconOn = "icons/menu/clothing/shoes_on",
			IconOff = "icons/menu/clothing/shoes_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.RightShoes else nil,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Shoes,
			RecommendationsType = ConstantsModule1.RecommendationsType.Shoes,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.Shoes
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.Shoes:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_Shoes:rawValue()
			} else nil,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RightShoeAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.RightShoes
		},
		DivisibleShoes = if GetFFlagAXEnableSlotBasedEditorModule() then nil else {
			Name = "Divisible Shoes",
			Title = "Feature.Avatar.Label.Shoes",
			IconOn = "icons/menu/clothing/shoes_on",
			IconOff = "icons/menu/clothing/shoes_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.DivisibleShoes else nil,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.Shoes,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			SubButtons = {
				[1] = {
					Name = "Left",
					Title = "Feature.Avatar.Label.LeftInitial",
					AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory },
					SearchUuid = SearchUuidModule(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule()
				},
				[2] = {
					Name = "Right",
					Title = "Feature.Avatar.Label.RightInitial",
					AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RightShoeAccessory },
					SearchUuid = SearchUuidModule(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule()
				}
			},
			RecommendationsType = ConstantsModule1.RecommendationsType.Shoes,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.Shoes
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.Shoes:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_Shoes:rawValue()
			} else nil,
			Id = AvatarEditorSubcategories.DivisibleShoes
		},
		ClassicShirts = {
			Name = "Classic Shirts",
			Title = "Feature.Avatar.Label.ClassicShirts",
			IconOn = "icons/menu/clothing/shirts_on",
			IconOff = "icons/menu/clothing/shirts_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClassicShirts else nil,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.ClassicShirts,
			RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.ClassicShirts
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.ClassicShirts:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.ClothingClassicShirts:rawValue()
			} else nil,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Shirt },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.ClassicShirts
		},
		ClassicTShirts = {
			Name = "Classic T-Shirts",
			Title = "Feature.Avatar.Label.ClassicTShirts",
			IconOn = "icons/menu/clothing/shirts_on",
			IconOff = "icons/menu/clothing/shirts_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClassicTShirts else nil,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.ClassicTShirts,
			RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.ClassicTShirts
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.ClassicTShirts:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_ClassicTShirts:rawValue()
			} else nil,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.TShirt },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.ClassicTShirts
		},
		ClassicPants = {
			Name = "Classic Pants",
			Title = "Feature.Avatar.Label.ClassicPants",
			IconOn = "icons/menu/clothing/pants_on",
			IconOff = "icons/menu/clothing/pants_off",
			RenderItemTiles = true,
			Category = 2,
			NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClassicPants else nil,
			CameraFocus = ConstantsModule.FocusType.Legs,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Clothing.ClassicPants,
			RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.Clothing,
				SubcategoryKey = CatalogSubcategories.ClassicPants
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategories.Clothing:rawValue(),
				SubcategoryId = CatalogSubcategories.ClassicPants:rawValue()
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.Clothing:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Clothing_ClassicPants:rawValue()
			} else nil,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Pants },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorSubcategories.ClassicPants
		}
	}
	local List2 = {}
	local Subcategory = 0
	
	if FFlagAXSwapOuterwearSubcategoryOrderModule then
		if CollectSetResult[config.Outerwear] or CollectSetResult[config.JacketAccessory] then
			Subcategory += 1
			config1.Outerwear.Subcategory = Subcategory
			table.insert(List2, config1.Outerwear)
		end
		if CollectSetResult[config.Tops] then
			Subcategory += 1
			config1.Tops.Subcategory = Subcategory
			table.insert(List2, config1.Tops)
		end
	else
		if CollectSetResult[config.Tops] then
			Subcategory += 1
			config1.Tops.Subcategory = Subcategory
			table.insert(List2, config1.Tops)
		end
		if CollectSetResult[config.Outerwear] or CollectSetResult[config.JacketAccessory] then
			Subcategory += 1
			config1.Outerwear.Subcategory = Subcategory
			table.insert(List2, config1.Outerwear)
		end
	end
	if CollectSetResult[config.Bottoms] then
		Subcategory += 1
		config1.Bottoms.Subcategory = Subcategory
		table.insert(List2, config1.Bottoms)
	end
	if GetFFlagAXEnableSlotBasedEditorModule() then
		Subcategory += 1
		config1.Shoes.Subcategory = Subcategory
		table.insert(List2, config1.Shoes)
	else
		if CollectSetResult[config.LeftShoeAccessory] then
			Subcategory += 1
			config1.LeftShoes.Subcategory = Subcategory
			table.insert(List2, config1.LeftShoes)
		end
		if CollectSetResult[config.RightShoeAccessory] then
			Subcategory += 1
			config1.RightShoes.Subcategory = Subcategory
			table.insert(List2, config1.RightShoes)
		end
	end
	if CollectSetResult[config.ClassicShirts] then
		Subcategory += 1
		config1.ClassicShirts.Subcategory = Subcategory
		table.insert(List2, config1.ClassicShirts)
	end
	if GetFFlagAXEnableSlotBasedEditorModule() then
		if CollectSetResult[config.ClassicPants] then
			Subcategory += 1
			config1.ClassicPants.Subcategory = Subcategory
			table.insert(List2, config1.ClassicPants)
		end
		if CollectSetResult[config.ClassicTShirts] then
			config1.ClassicTShirts.Subcategory = Subcategory + 1
			table.insert(List2, config1.ClassicTShirts)
		end
	else
		if CollectSetResult[config.ClassicTShirts] then
			Subcategory += 1
			config1.ClassicTShirts.Subcategory = Subcategory
			table.insert(List2, config1.ClassicTShirts)
		end
		if CollectSetResult[config.ClassicPants] then
			config1.ClassicPants.Subcategory = Subcategory + 1
			table.insert(List2, config1.ClassicPants)
		end
	end
	return {
		avatarEditorCategories = {
			Name = "Clothing",
			Title = "Feature.Catalog.Label.Clothing",
			IconOn = "icons/menu/clothing/clothing_on",
			IconOff = "icons/menu/clothing/clothing_off",
			Category = 2,
			Subcategory = nil,
			CanAnimateCameraBasedMood = true,
			HideTextUnderTile = true,
			NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.Clothing else nil,
			Subcategories = List2,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Id = AvatarEditorCategories.Clothing
		},
		catalogCategories = CatalogCategories1
	}
end

return function(p1)
	-- upvalues: v1 (ref), createClothingCategories (copy)
	if not v1 or p1 then
		v1 = createClothingCategories()
	end
	return v1
end