local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Constants = AvatarExperienceCommonModule.Constants
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local GetClothingCategoriesModule = require(Modules.AvatarExperience.Common.getClothingCategories)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local AvatarExperienceCommonModule1 = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule1.Enums.CatalogCategories
local CatalogSubcategories = AvatarExperienceCommonModule1.Enums.CatalogSubcategories
local CatalogCategoryIds = AvatarExperienceCommonModule1.Enums.CatalogCategoryIds
local CatalogSubcategoryIds = AvatarExperienceCommonModule1.Enums.CatalogSubcategoryIds
local CatalogCategoryTaxonomyUUIDsModule = require(Modules.AvatarExperience.Common.Enum.CatalogCategoryTaxonomyUUIDs)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXAvatarsTabIXP = AvatarExperienceCommonModule.Experiments.AXAvatarsTabIXP
local GetFIntMinSecsToRefreshRecommendedCatalogPageModule = require(Modules.AvatarExperience.Flags.GetFIntMinSecsToRefreshRecommendedCatalogPage)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagRemoveClassicHeadsAndFaces = AvatarExperienceFlagsModule.FFlagRemoveClassicHeadsAndFaces
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXCatalogCategoryTooltip
local FFlagAXMigrateCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXMigrateCategoryTooltip
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSupportDisableFilters
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FIntAXMakeupCategoryPosition = AvatarExperienceFlagsModule.FIntAXMakeupCategoryPosition
local FFlagAXMakeupCategoryPositionExperiment = AvatarExperienceFlagsModule.FFlagAXMakeupCategoryPositionExperiment
local FFlagAXCatalogMakeupTaxonomy = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupTaxonomy
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXFixWidgetOnlyTabNoItemsFound = AvatarExperienceFlagsModule.FFlagAXFixWidgetOnlyTabNoItemsFound
local FFlagAXCatalogM41Props = AvatarExperienceFlagsModule.FFlagAXCatalogM41Props
local FFlagAXCatalogM41FullMasks = AvatarExperienceFlagsModule.FFlagAXCatalogM41FullMasks
local FFlagAXCatalogM41HandAndArm = AvatarExperienceFlagsModule.FFlagAXCatalogM41HandAndArm
local FFlagAXFixHandAndArmWidgetApiContext = AvatarExperienceFlagsModule.FFlagAXFixHandAndArmWidgetApiContext
local FFlagAXM41AllCategoriesToTaxonomy = AvatarExperienceFlagsModule.FFlagAXM41AllCategoriesToTaxonomy
local FFlagAXAddHDCatalogTab = AvatarExperienceFlagsModule.FFlagAXAddHDCatalogTab
local FFlagAXAddHDCatalogTooltip = AvatarExperienceFlagsModule.FFlagAXAddHDCatalogTooltip
local FFlagAXCatalogBackgroundsSupport = AvatarExperienceFlagsModule.FFlagAXCatalogBackgroundsSupport
local FIntAXBackgroundsCatalogTabPosition = AvatarExperienceFlagsModule.FIntAXBackgroundsCatalogTabPosition
local AXHDCatalogTabPosition = game:DefineFastInt("AXHDCatalogTabPosition", 2)
local AXBodyCategoryTooltipKey = game:DefineFastString("AXBodyCategoryTooltipKey", "BodyCategoryCatalogTooltip")

local function buildCategories()
	-- upvalues: AXAvatarsTabIXP (copy), IxpUtilsModule (copy), CatalogCategories (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), FFlagAXCatalogSupportDisableFilters (copy), SearchUuidModule (copy), GetFIntMinSecsToRefreshRecommendedCatalogPageModule (copy), CatalogCategoryIds (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXFixWidgetOnlyTabNoItemsFound (copy), FFlagAXM41AllCategoriesToTaxonomy (copy), CatalogCategoryTaxonomyUUIDsModule (copy), ConstantsModule (copy), FFlagAXAddHDCatalogTab (copy), FFlagAXAddHDCatalogTooltip (copy), FFlagAXCatalogBackgroundsSupport (copy), FFlagAXCatalogMakeupSupport (copy), CatalogSubcategories (copy), Constants (copy), FFlagAXCatalogMakeupTaxonomy (copy), CatalogSubcategoryIds (copy), FFlagAXCatalogM41FullMasks (copy), FFlagAXCatalogM41HandAndArm (copy), FFlagAXFixHandAndArmWidgetApiContext (copy), FFlagAXCatalogM41Props (copy), FFlagRemoveClassicHeadsAndFaces (copy), FFlagAXMigrateCategoryTooltip (copy), AXBodyCategoryTooltipKey (copy), FFlagAXCatalogCategoryTooltip (copy), GetClothingCategoriesModule (copy), AXHDCatalogTabPosition (copy), FFlagAXMakeupCategoryPositionExperiment (copy), FIntAXMakeupCategoryPosition (copy), FIntAXBackgroundsCatalogTabPosition (copy)
	local TestVariable = if AXAvatarsTabIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXAvatarsTabIXP.EnabledForUser) else nil
	local config = {
		Name = "All",
		Title = "Feature.Avatar.Heading.All",
		CategoryFilter = "Recommended",
		ShowSponsored = true,
		ShowWidgets = true,
		ShowTopics = true,
		CanAnimateCameraBasedMood = true,
		Id = CatalogCategories.Recommended:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Recommended,
		DisableFilters = not FFlagAXCatalogSupportDisableFilters or nil,
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		CategoryId = CatalogCategoryIds.All:rawValue(),
		WidgetContext = if FFlagAXMigrateAllTabToSduiDev then "catalog-tab:recommended" elseif FFlagAXCatalogCategoriesSDUI or FFlagAXFixWidgetOnlyTabNoItemsFound then "catalog-tab:all" else nil,
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.AllItems:rawValue() else nil
	}
	local config1 = {
		Name = "Characters",
		Title = "Feature.Catalog.Label.Characters",
		CanAnimateCameraBasedMood = true,
		Id = CatalogCategories.Characters:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Characters,
		BundleTypes = { ConstantsModule.BundleTypeIdStrings.BodyParts },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		CategoryId = CatalogCategoryIds.Characters:rawValue()
	}
	local Config = if FFlagAXAddHDCatalogTab then {
		Name = "HighDefinition",
		Title = "Feature.Catalog.Label.HD",
		CategoryFilter = "HighDefinition",
		Id = CatalogCategories.HighDefinition:rawValue(),
		TooltipKey = if FFlagAXAddHDCatalogTooltip then "AXHDCategoryCatalogTooltip" else nil,
		TooltipLocalizationKey = if FFlagAXAddHDCatalogTooltip then "Feature.Catalog.Message.HighDefinitionCategoryTooltip" else nil,
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule()
	} else nil
	local Config1 = if FFlagAXCatalogBackgroundsSupport then {
		Name = "Backgrounds",
		Title = "Feature.Avatar.Label.Backgrounds",
		DisableFilters = true,
		Id = CatalogCategories.Backgrounds:rawValue(),
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Backgrounds:rawValue()
	} else nil
	local List = {}
	local v1 = nil
	
	if FFlagAXCatalogMakeupSupport then
		table.insert(List, {
			Name = "Looks",
			Title = "Feature.Catalog.Label.MakeupLooks",
			DisableFilters = true,
			LooksWidgetContextForOrganicContent = "makeup-tab",
			isSubcategory = true,
			Id = CatalogSubcategories.MakeupLooks:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.MakeupLooks,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule()
		})
		table.insert(List, {
			Name = "Eyes",
			Title = "Feature.Catalog.Label.EyeMakeup",
			isSubcategory = true,
			Id = CatalogSubcategories.EyeMakeup:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.EyeMakeup,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.EyeMakeup,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EyeMakeup },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = if FFlagAXCatalogMakeupTaxonomy then CatalogCategoryTaxonomyUUIDsModule.EyeMakeup:rawValue() else nil
		})
		table.insert(List, {
			Name = "Lips",
			Title = "Feature.Catalog.Label.LipMakeup",
			isSubcategory = true,
			Id = CatalogSubcategories.LipMakeup:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.LipMakeup,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.LipMakeup,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LipMakeup },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = if FFlagAXCatalogMakeupTaxonomy then CatalogCategoryTaxonomyUUIDsModule.LipMakeup:rawValue() else nil
		})
		table.insert(List, {
			Name = "Face",
			Title = "Feature.Catalog.Label.FaceMakeup",
			isSubcategory = true,
			Id = CatalogSubcategories.FaceMakeup:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.FaceMakeup,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FaceMakeup },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = if FFlagAXCatalogMakeupTaxonomy then CatalogCategoryTaxonomyUUIDsModule.FaceMakeup:rawValue() else nil
		})
		table.insert(List, {
			Name = "Eyelashes",
			Title = "Feature.Catalog.Label.EyelashMakeup",
			isSubcategory = true,
			Id = CatalogSubcategories.Eyelashes:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Eyelashes,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyelashes,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EyelashAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = if FFlagAXCatalogMakeupTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Eyelashes:rawValue() else nil
		})
		table.insert(List, {
			Name = "Eyebrows",
			Title = "Feature.Catalog.Label.EyebrowMakeup",
			isSubcategory = true,
			Id = CatalogSubcategories.Eyebrows:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Eyebrows,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyebrows,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EyebrowAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = if FFlagAXCatalogMakeupTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Eyebrows:rawValue() else nil
		})
		v1 = {
			Name = "Makeup",
			Title = "Feature.Catalog.Label.Makeup",
			CanAnimateCameraBasedMood = true,
			Id = CatalogCategories.Makeup:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Makeup,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Makeup,
			AssetTypeIdStrings = {
				ConstantsModule.AssetTypeIdStrings.EyelashAccessory,
				ConstantsModule.AssetTypeIdStrings.EyebrowAccessory,
				ConstantsModule.AssetTypeIdStrings.FaceMakeup,
				ConstantsModule.AssetTypeIdStrings.LipMakeup,
				ConstantsModule.AssetTypeIdStrings.EyeMakeup
			},
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			Subcategories = List,
			TaxonomyUuid = if FFlagAXCatalogMakeupTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Makeup:rawValue() else nil
		}
	end
	local List1 = {}
	table.insert(List1, {
		Name = "Hats",
		Title = "Feature.Avatar.Label.Head",
		isSubcategory = true,
		Id = CatalogSubcategories.Hats:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Hats,
		CameraFocus = ConstantsModule.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Hats,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Hat },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Hats:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.HeadAccessories:rawValue() else nil
	})
	table.insert(List1, {
		Name = "Face",
		Title = "Feature.Avatar.Label.Face",
		isSubcategory = true,
		Id = CatalogSubcategories.Face:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Face,
		CameraFocus = ConstantsModule.FocusType.Face,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FaceAccessory },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Face:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.FaceAccessories:rawValue() else nil
	})
	
	if FFlagAXCatalogM41FullMasks then
		table.insert(List1, {
			Name = "Full Masks",
			Title = "Feature.Avatar.Label.FullMasks",
			isSubcategory = true,
			Id = CatalogSubcategories.FullMasks:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.FullMasks,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.FullMasks:rawValue()
		})
	end
	table.insert(List1, {
		Name = "Neck",
		Title = "Feature.Avatar.Label.Neck",
		isSubcategory = true,
		Id = CatalogSubcategories.Neck:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Neck,
		CameraFocus = ConstantsModule.FocusType.Neck,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Neck,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.NeckAccessory },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Neck:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.NeckAccessories:rawValue() else nil
	})
	table.insert(List1, {
		Name = "Shoulder",
		Title = "Feature.Avatar.Label.Shoulder",
		isSubcategory = true,
		Id = CatalogSubcategories.Shoulder:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Shoulder,
		CameraFocus = ConstantsModule.FocusType.Shoulders,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ShoulderAccessory },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Shoulder:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.ShoulderAccessories:rawValue() else nil
	})
	
	if FFlagAXCatalogM41HandAndArm then
		table.insert(List1, {
			Title = "Feature.Avatar.Label.HandAndArm",
			isSubcategory = true,
			Id = CatalogSubcategories.HandAndArm:rawValue(),
			Name = if FFlagAXFixHandAndArmWidgetApiContext then "Hand And Arm" else "Hand & Arm",
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.HandAndArm,
			CameraFocus = ConstantsModule.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.HandAndArm:rawValue()
		})
	end
	table.insert(List1, {
		Name = "Front",
		Title = "Feature.Avatar.Label.Front",
		isSubcategory = true,
		Id = CatalogSubcategories.Front:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Front,
		CameraFocus = ConstantsModule.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Front,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FrontAccessory },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Front:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.FrontAccessories:rawValue() else nil
	})
	table.insert(List1, {
		Name = "Back",
		Title = "Feature.Avatar.Label.Back",
		isSubcategory = true,
		Id = CatalogSubcategories.Back:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Back,
		CameraFocus = ConstantsModule.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Back,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.BackAccessory },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Back:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.BackAccessories:rawValue() else nil
	})
	table.insert(List1, {
		Name = "Waist",
		Title = "Feature.Avatar.Label.Waist",
		isSubcategory = true,
		Id = CatalogSubcategories.Waist:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Waist,
		CameraFocus = ConstantsModule.FocusType.Waist,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Waist,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.WaistAccessory },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Waist:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.WaistAccessories:rawValue() else nil
	})
	
	if FFlagAXCatalogM41Props then
		table.insert(List1, {
			Name = "Props",
			Title = "Feature.Avatar.Label.Props",
			isSubcategory = true,
			Id = CatalogSubcategories.Props:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Props,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDsModule.Props:rawValue()
		})
	end
	table.insert(List1, {
		Name = "Gear",
		Title = "Feature.Catalog.Label.Gear",
		isSubcategory = true,
		Id = CatalogSubcategories.Gear:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Gear,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Gear },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Gear:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Gear:rawValue() else nil
	})
	local config4 = {
		Name = "Accessories",
		Title = "Feature.Catalog.LabelAccessories",
		CanAnimateCameraBasedMood = true,
		Id = CatalogCategories.Accessories:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Accessories,
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		AssetTypeIdStrings = {
			ConstantsModule.AssetTypeIdStrings.Hat,
			ConstantsModule.AssetTypeIdStrings.FaceAccessory,
			ConstantsModule.AssetTypeIdStrings.NeckAccessory,
			ConstantsModule.AssetTypeIdStrings.ShoulderAccessory,
			ConstantsModule.AssetTypeIdStrings.FrontAccessory,
			ConstantsModule.AssetTypeIdStrings.BackAccessory,
			ConstantsModule.AssetTypeIdStrings.WaistAccessory,
			ConstantsModule.AssetTypeIdStrings.Gear
		},
		SearchUuid = SearchUuidModule(),
		CategoryId = CatalogCategoryIds.Accessories:rawValue(),
		Subcategories = List1,
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Accessories:rawValue() else nil
	}
	local List2 = {}
	table.insert(List2, {
		Name = "Heads",
		Title = "Feature.Avatar.Label.Heads",
		isSubcategory = true,
		Id = CatalogSubcategories.Heads:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Heads,
		CameraFocus = ConstantsModule.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Heads,
		BundleTypes = { ConstantsModule.BundleTypeIdStrings.DynamicHead },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.DynamicHeads:rawValue() else nil
	})
	table.insert(List2, {
		Name = "Hair",
		Title = "Feature.Catalog.Label.Hair",
		isSubcategory = true,
		Id = CatalogSubcategories.Hair:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Hair,
		CameraFocus = ConstantsModule.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Hair,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.HairAccessory },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Hair:rawValue() else nil
	})
	
	if not FFlagRemoveClassicHeadsAndFaces then
		table.insert(List2, {
			Name = "Classic Heads",
			Title = "Feature.Avatar.Label.ClassicHeads",
			isSubcategory = true,
			Id = CatalogSubcategories.ClassicHeads:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.ClassicHeads,
			CameraFocus = ConstantsModule.FocusType.Head,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Head },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.ClassicHeads:rawValue() else nil
		})
		table.insert(List2, {
			Name = "Classic Faces",
			Title = "Feature.Avatar.Label.ClassicFaces",
			isSubcategory = true,
			Id = CatalogSubcategories.ClassicFaces:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.ClassicFaces,
			CameraFocus = ConstantsModule.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Face },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.ClassicFaces:rawValue() else nil
		})
	end
	local config2 = {
		Name = "Heads",
		Title = "Feature.Avatar.Label.Heads",
		CanAnimateCameraBasedMood = true,
		Id = CatalogCategories.Head:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Head,
		AssetTypeIdStrings = {
			ConstantsModule.AssetTypeIdStrings.HairAccessory,
			ConstantsModule.AssetTypeIdStrings.Head,
			ConstantsModule.AssetTypeIdStrings.Face,
			ConstantsModule.AssetTypeIdStrings.DynamicHead
		},
		BundleTypes = { ConstantsModule.BundleTypeIdStrings.DynamicHead },
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		CategoryId = CatalogCategoryIds.Heads:rawValue(),
		Subcategories = List2
	}
	local List11 = {}
	table.insert(List11, {
		Name = "AnimationBundles",
		Title = "Feature.Catalog.Label.Bundles",
		CanAnimateCameraBasedMood = true,
		isSubcategory = true,
		Id = CatalogSubcategories.AnimationBundles:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.AnimationBundles,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		BundleTypes = { ConstantsModule.BundleTypeIdStrings.Animations },
		PageType = ConstantsModule.PageType.Animation,
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.AnimationBundles:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.AnimationBundles:rawValue() else nil
	})
	table.insert(List11, {
		Name = "Emotes",
		Title = "Feature.Catalog.Label.Emotes",
		CanAnimateCameraBasedMood = false,
		isSubcategory = true,
		Id = CatalogSubcategories.Emotes:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Emotes,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EmoteAnimation },
		PageType = ConstantsModule.PageType.Emotes,
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		SubcategoryId = CatalogSubcategoryIds.Emotes:rawValue(),
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Emotes:rawValue() else nil
	})
	local config3 = {
		Name = "AllAnimations",
		Title = "Feature.Avatar.Heading.Animations",
		CanAnimateCameraBasedMood = true,
		Id = CatalogCategories.AllAnimations:rawValue(),
		NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.AllAnimations,
		CategoryId = CatalogCategoryIds.AllAnimations:rawValue(),
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EmoteAnimation },
		BundleTypes = { ConstantsModule.BundleTypeIdStrings.Animations },
		PageType = ConstantsModule.PageType.AllAnimation,
		SearchUuid = SearchUuidModule(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
		Subcategories = List11,
		TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Animations:rawValue() else nil
	}
	local v2 = nil
	local List21 = {}
	local v3 = nil
	
	if TestVariable then
		v2 = {
			Name = "Avatars",
			Title = "Feature.Catalog.Label.Avatars",
			LooksWidgetContextForOrganicContent = "avatarTab",
			CanAnimateCameraBasedMood = true,
			Id = CatalogCategories.Avatars:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Avatars,
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			DisableFilters = if FFlagAXCatalogSupportDisableFilters then true else nil
		}
		table.insert(List21, {
			Name = "Full Bodies",
			Title = "Feature.Catalog.Label.FullBodies",
			isSubcategory = true,
			Id = CatalogSubcategories.FullBodies:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.FullBodies,
			BundleTypes = { ConstantsModule.BundleTypeIdStrings.BodyParts },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			SubcategoryId = CatalogSubcategoryIds.FullBodies:rawValue(),
			TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.FullBodies:rawValue() else nil
		})
		table.insert(List21, {
			Name = "Hair",
			Title = "Feature.Catalog.Label.Hair",
			isSubcategory = true,
			Id = CatalogSubcategories.Hair:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Hair,
			CameraFocus = ConstantsModule.FocusType.Head,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Hair,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.HairAccessory },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			SubcategoryId = CatalogSubcategoryIds.Hair:rawValue(),
			TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Hair:rawValue() else nil
		})
		table.insert(List21, {
			Name = "Heads",
			Title = "Feature.Avatar.Label.Heads",
			isSubcategory = true,
			Id = CatalogSubcategories.Heads:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.Heads,
			CameraFocus = ConstantsModule.FocusType.Head,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Heads,
			BundleTypes = { ConstantsModule.BundleTypeIdStrings.DynamicHead },
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			SubcategoryId = CatalogSubcategoryIds.Head:rawValue(),
			TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.DynamicHeads:rawValue() else nil
		})
		
		if not FFlagRemoveClassicHeadsAndFaces then
			table.insert(List21, {
				Name = "Classic Heads",
				Title = "Feature.Avatar.Label.ClassicHeads",
				isSubcategory = true,
				Id = CatalogSubcategories.ClassicHeads:rawValue(),
				NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.ClassicHeads,
				CameraFocus = ConstantsModule.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Head },
				SearchUuid = SearchUuidModule(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
				SubcategoryId = CatalogSubcategoryIds.ClassicHeads:rawValue(),
				TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.ClassicHeads:rawValue() else nil
			})
			table.insert(List21, {
				Name = "Classic Faces",
				Title = "Feature.Avatar.Label.ClassicFaces",
				isSubcategory = true,
				Id = CatalogSubcategories.ClassicFaces:rawValue(),
				NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogSubcategories.ClassicFaces,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Face },
				SearchUuid = SearchUuidModule(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
				SubcategoryId = CatalogSubcategoryIds.ClassicFaces:rawValue(),
				TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.ClassicFaces:rawValue() else nil
			})
		end
		v3 = {
			Name = "Body",
			Title = "Feature.Catalog.Label.Body",
			CanAnimateCameraBasedMood = true,
			Id = CatalogCategories.Body:rawValue(),
			NavigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else CatalogCategories.Body,
			TooltipKey = if FFlagAXMigrateCategoryTooltip then AXBodyCategoryTooltipKey elseif FFlagAXCatalogCategoryTooltip then "BodyCategoryCatalogTooltip" else nil,
			TooltipLocalizationKey = if FFlagAXMigrateCategoryTooltip then "Feature.Catalog.Message.BodyCategoryTooltip" else nil,
			AssetTypeIdStrings = {
				ConstantsModule.AssetTypeIdStrings.HairAccessory,
				ConstantsModule.AssetTypeIdStrings.Head,
				ConstantsModule.AssetTypeIdStrings.Face,
				ConstantsModule.AssetTypeIdStrings.DynamicHead
			},
			BundleTypes = {
				ConstantsModule.BundleTypeIdStrings.BodyParts,
				ConstantsModule.BundleTypeIdStrings.DynamicHead
			},
			SearchUuid = SearchUuidModule(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPageModule(),
			CategoryId = CatalogCategoryIds.Body:rawValue(),
			Subcategories = List21,
			TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy then CatalogCategoryTaxonomyUUIDsModule.Body:rawValue() else nil
		}
	end
	local List3 = {}
	table.insert(List3, config)
	
	if TestVariable then
		table.insert(List3, v2)
		table.insert(List3, v3)
	else
		table.insert(List3, config1)
	end
	if FFlagAXCatalogMakeupSupport then
		table.insert(List3, v1)
	end
	if FFlagAXCatalogBackgroundsSupport then
		table.insert(List3, Config1)
	end
	table.insert(List3, GetClothingCategoriesModule().catalogCategories)
	table.insert(List3, config4)
	
	if not TestVariable then
		table.insert(List3, config2)
	end
	table.insert(List3, config3)
	
	if FFlagAXAddHDCatalogTab then
		table.insert(List3, math.clamp(AXHDCatalogTabPosition, 1, #List3 + 1), Config)
	end
	if FFlagAXCatalogMakeupSupport and FFlagAXMakeupCategoryPositionExperiment and FIntAXMakeupCategoryPosition > 0 then
		local Index = 0
		
		for i1, value1 in List3 do
			if value1 == v1 then
				Index = i1
				break
			end
		end
		if Index > 0 then
			table.remove(List3, Index)
			table.insert(List3, math.clamp(FIntAXMakeupCategoryPosition, 1, #List3 + 1), v1)
		end
	end
	if FFlagAXCatalogBackgroundsSupport and FIntAXBackgroundsCatalogTabPosition > 0 then
		local Index1 = 0
		
		for i, value in List3 do
			if value == Config1 then
				Index1 = i
				break
			end
		end
		if Index1 > 0 then
			table.remove(List3, Index1)
			table.insert(List3, math.clamp(FIntAXBackgroundsCatalogTabPosition, 1, #List3 + 1), Config1)
		end
	end
	return List3
end

local v4 = nil

local function _(p1)
	-- upvalues: ArgCheckModule (copy), FFlagAXRemoveCatalogCategoryNavKey (copy)
	ArgCheckModule.isNotNil(p1.SearchUuid, "category  " .. p1.Name .. " is missing SearchUuid")
	ArgCheckModule.isNotNil(p1.Id, "category  " .. p1.Name .. " is missing Id")
	
	if FFlagAXRemoveCatalogCategoryNavKey then
		ArgCheckModule.isTypeOrNil(p1.NavigationKey, "nil", "NavigationKey")
	end
end

local _ = function(Key, p1)
	if Key then
		if p1[Key] then
			error("Duplicate Id found: " .. Key)
			
			return
		end
		p1[Key] = true
	end
end

local function sanityCheck(List)
	-- upvalues: ArgCheckModule (copy), FFlagAXRemoveCatalogCategoryNavKey (copy)
	local t = {}
	
	for _, value in List do
		ArgCheckModule.isNotNil(value.SearchUuid, "category  " .. value.Name .. " is missing SearchUuid")
		ArgCheckModule.isNotNil(value.Id, "category  " .. value.Name .. " is missing Id")
		
		if FFlagAXRemoveCatalogCategoryNavKey then
			ArgCheckModule.isTypeOrNil(value.NavigationKey, "nil", "NavigationKey")
		end
		local Id = value.Id
		
		if Id then
			if t[Id] then
				error("Duplicate Id found: " .. Id)
			else
				t[Id] = true
			end
		end
		if value.Subcategories then
			for _, subcategory in value.Subcategories do
				ArgCheckModule.isNotNil(subcategory.SearchUuid, "category  " .. subcategory.Name .. " is missing SearchUuid")
				ArgCheckModule.isNotNil(subcategory.Id, "category  " .. subcategory.Name .. " is missing Id")
				
				if FFlagAXRemoveCatalogCategoryNavKey then
					ArgCheckModule.isTypeOrNil(subcategory.NavigationKey, "nil", "NavigationKey")
				end
				local Id1 = subcategory.Id
				
				if Id1 then
					if t[Id1] then
						error("Duplicate Id found: " .. Id1)
					else
						t[Id1] = true
					end
				end
				ArgCheckModule.isNotNil(subcategory.isSubcategory, "subcategory  " .. subcategory.Id .. " is missing isSubcategory")
			end
		end
	end
end

return function(p1)
	-- upvalues: buildCategories (copy), sanityCheck (copy), v4 (ref)
	if p1 then
		local Categories = buildCategories()
		sanityCheck(Categories)
		
		return Categories
	end
	if not v4 then
		v4 = buildCategories()
		sanityCheck(v4)
	end
	return v4
end