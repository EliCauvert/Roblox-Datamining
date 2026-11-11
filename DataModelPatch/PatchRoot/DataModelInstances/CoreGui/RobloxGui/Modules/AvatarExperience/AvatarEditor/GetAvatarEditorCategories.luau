local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Constants = AvatarExperienceCommonModule.Constants
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local GetClothingCategoriesModule = require(Modules.AvatarExperience.Common.getClothingCategories)
local GetEmotesCategoryModule = require(Modules.AvatarExperience.Common.getEmotesCategory)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local AvatarExperienceCommonModule1 = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule1.Enums.CatalogCategories
local CatalogSubcategories = AvatarExperienceCommonModule1.Enums.CatalogSubcategories
local CatalogSDUICategoryIds = AvatarExperienceCommonModule1.Enums.CatalogSDUICategoryIds
local CatalogCategoryKeys = AvatarExperienceCommonModule1.Enums.CatalogCategoryKeys
local CatalogSubcategoryKeys = AvatarExperienceCommonModule1.Enums.CatalogSubcategoryKeys
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local IconName = require(CorePackages.Packages.Foundation).Enums.IconName
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXCatalogHeadCategoryCombineIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarEditorSubcategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorSubcategories
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local FFlagAEGetEditableOutfitsTypeModule = require(Modules.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType)
local GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule = require(Modules.AvatarExperience.Flags.GetFFlagAXAddNavigationKeyToEditorSubcategories)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local GetFFlagAXExtractEmotesCategoryModule = require(Modules.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory)
local GetFFlagAXEnableRecommendationTypeAllInCustomizeModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize)
local FFlagAXTweakSlotsCameraPositioningModule = require(Modules.AvatarExperience.Flags.FFlagAXTweakSlotsCameraPositioning)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagRemoveClassicHeadsAndFaces = AvatarExperienceFlagsModule.FFlagRemoveClassicHeadsAndFaces
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXCustomizeBackgrounds = AvatarExperienceFlagsModule.FFlagAXCustomizeBackgrounds
local FFlagAXBackgroundsCustomizeHydration = AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local AXAvatarTabShopForMore = game:DefineFastFlag("AXAvatarTabShopForMore", false)
local FFlagAXAvatarTabLooksYouMayAlsoLike = AvatarExperienceFlagsModule.FFlagAXAvatarTabLooksYouMayAlsoLike
local FFlagAXDownrankMakeupCustomize = AvatarExperienceFlagsModule.FFlagAXDownrankMakeupCustomize
local AXAvatarsTabIXP = AvatarExperienceCommonModule.Experiments.AXAvatarsTabIXP
local List = nil

local function v43()
	-- upvalues: AXAvatarsTabIXP (copy), IxpUtilsModule (copy), ConstantsModule1 (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogCategoryKeys (copy), CatalogSubcategoryKeys (copy), CatalogSDUICategoryIds (copy), FFlagAEGetEditableOutfitsTypeModule (copy), ConstantsModule (copy), GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule (copy), AvatarEditorSubcategories (copy), AvatarEditorCategories (copy)
	local TestVariable = if AXAvatarsTabIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXAvatarsTabIXP.EnabledForUser) else nil
	
	return {
		Title = "Feature.Catalog.Label.Characters",
		IconOn = "icons/menu/clothing/characters_on",
		IconOff = "icons/menu/clothing/characters_off",
		RenderItemTiles = true,
		RenderOutfitItemTiles = true,
		CanAnimateCameraBasedMood = true,
		Name = ConstantsModule1.CharacterKey,
		RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable then CatalogCategories.Body else CatalogCategories.Characters,
			SubcategoryKey = if TestVariable then CatalogSubcategories.FullBodies else nil
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
			SubcategoryId = if TestVariable then CatalogSubcategoryKeys.FullBodies else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if TestVariable then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
		} else nil,
		SearchUuid = ConstantsModule1.CharacterKey,
		OutfitType = if FFlagAEGetEditableOutfitsTypeModule then ConstantsModule.OutfitTypes.Avatar else nil,
		Subcategories = {
			[1] = {
				Name = "Creations",
				Title = "Feature.Avatar.Label.Creations",
				IconOn = "icons/menu/clothing/creations_on",
				IconOff = "icons/menu/clothing/creations_off",
				RenderItemTiles = true,
				RenderOutfitItemTiles = true,
				ManageOutfitsEnabled = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.CreatedCharacters else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = if TestVariable then CatalogCategories.Avatars else CatalogCategories.Characters
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = if TestVariable then CatalogCategoryKeys.Avatars else CatalogCategoryKeys.Characters
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = if TestVariable then CatalogSDUICategoryIds.Avatars:rawValue() else CatalogSDUICategoryIds.Characters:rawValue()
				} else nil,
				SearchUuid = ConstantsModule1.EditableCharacterKey,
				OutfitType = if FFlagAEGetEditableOutfitsTypeModule then ConstantsModule.OutfitTypes.Avatar else nil,
				BundleTypes = {
					ConstantsModule.BundleTypeIdStrings.BodyParts,
					ConstantsModule.BundleTypeIdStrings.Animations
				},
				Id = AvatarEditorSubcategories.CreatedCharacters
			},
			[2] = {
				Name = "Purchased",
				Title = "Feature.Avatar.Label.Purchased",
				IconOn = "icons/menu/clothing/purchased_on",
				IconOff = "icons/menu/clothing/purchased_off",
				RenderItemTiles = true,
				RenderOutfitItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.PurchasedCharacters else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = if TestVariable then CatalogCategories.Body else CatalogCategories.Characters,
					SubcategoryKey = if TestVariable then CatalogSubcategories.FullBodies else nil
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = if TestVariable then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
					SubcategoryId = if TestVariable then CatalogSubcategoryKeys.FullBodies else nil
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = if TestVariable then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
					SubcategoryId = if TestVariable then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
				} else nil,
				SearchUuid = ConstantsModule1.PurchasedCharacterKey,
				OutfitType = ConstantsModule.OutfitTypes.Avatar,
				Id = AvatarEditorSubcategories.PurchasedCharacters
			}
		} or nil,
		Id = AvatarEditorCategories.Characters
	}
end

local function v44()
	-- upvalues: AXAvatarsTabIXP (copy), IxpUtilsModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), AvatarEditorCategories (copy), SearchUuidModule (copy), GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule (copy), AvatarEditorSubcategories (copy), ConstantsModule1 (copy), ConstantsModule (copy), Constants (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogSubcategoryKeys (copy), CatalogSDUICategoryIds (copy), FFlagRemoveClassicHeadsAndFaces (copy), CatalogCategoryKeys (copy), FFlagAXRootSlotBasedEditorFlag (copy)
	local TestVariable = if AXAvatarsTabIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXAvatarsTabIXP.EnabledForUser) else nil
	local config = {
		Name = "Body",
		Title = "Feature.Catalog.Label.Body",
		IconOn = "icons/menu/clothing/body_on",
		IconOff = "icons/menu/clothing/body_off",
		CanAnimateCameraBasedMood = true,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.Body else nil,
		SearchUuid = SearchUuidModule(),
		Subcategories = {},
		Id = AvatarEditorCategories.Body
	}
	local config1 = {
		Name = "Skin",
		Title = "Feature.Avatar.Label.Skin",
		IconOn = "icons/menu/clothing/skin_on",
		IconOff = "icons/menu/clothing/skin_off",
		RenderItemTiles = false,
		hideFilter = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Skin else nil,
		RecommendationsType = ConstantsModule1.RecommendationsType.None,
		PageType = ConstantsModule.PageType.BodyColors,
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Skin
	}
	local config2 = {
		Name = "Build",
		Title = "Feature.Avatar.Label.Build",
		IconOn = "icons/menu/clothing/build_on",
		IconOff = "icons/menu/clothing/build_off",
		RenderItemTiles = false,
		hideFilter = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Build else nil,
		RecommendationsType = ConstantsModule1.RecommendationsType.None,
		PageType = ConstantsModule.PageType.BodyStyle,
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Build
	}
	local config3 = {
		Name = "Hair",
		Title = "Feature.Avatar.Label.Hair",
		IconOn = "icons/menu/clothing/hair_on",
		IconOff = "icons/menu/clothing/hair_off",
		RenderItemTiles = true,
		UseGetInventoryV2 = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Hair else nil,
		CameraFocus = ConstantsModule.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Hair,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable then CatalogCategories.Body else CatalogCategories.Head,
			SubcategoryKey = CatalogSubcategories.Hair
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then { CategoryId = CatalogSubcategoryKeys.Hair } elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Head:rawValue(),
			SubcategoryId = CatalogSDUICategoryIds.Body_Hair:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.HairAccessory },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Hair
	}
	local config4 = {
		Name = "Heads",
		Title = "Feature.Avatar.Label.Head",
		IconOn = "icons/menu/clothing/type_on",
		IconOff = "icons/menu/clothing/type_off",
		RenderItemTiles = true,
		RenderOutfitItemTiles = true,
		UseGetInventoryV2 = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Heads else nil,
		CameraFocus = ConstantsModule.FocusType.Face,
		CameraZoomRadius = if FFlagRemoveClassicHeadsAndFaces then Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Heads else Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads,
		RecommendationsType = ConstantsModule1.RecommendationsType.DynamicHeads,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable then CatalogCategories.Body else CatalogCategories.Head,
			SubcategoryKey = CatalogSubcategories.Heads
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then { CategoryId = CatalogSubcategoryKeys.Heads } elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Head:rawValue(),
			SubcategoryId = CatalogSDUICategoryIds.Body_Heads:rawValue()
		} else nil,
		AssetTypeIdStrings = if FFlagRemoveClassicHeadsAndFaces then nil else { ConstantsModule.AssetTypeIdStrings.Head },
		BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.DynamicHead },
		SubcategoryFiltersHeader = if FFlagRemoveClassicHeadsAndFaces then nil else "Feature.Catalog.Heading.ShowHeadType",
		SubcategoryFilters = if FFlagRemoveClassicHeadsAndFaces then nil else {
			{
				Name = "All Heads",
				Title = "Feature.Avatar.Label.AllHeads",
				RenderOutfitItemTiles = true,
				NavigationKey = AvatarEditorSubcategories.AllHeads,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Head },
				BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.DynamicHead },
				SearchUuid = SearchUuidModule()
			},
			{
				Name = "Dynamic Heads",
				Title = "Feature.Avatar.Label.DynamicHeads",
				RenderOutfitItemTiles = true,
				NavigationKey = AvatarEditorSubcategories.DynamicHeads,
				BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.DynamicHead },
				SearchUuid = SearchUuidModule()
			},
			{
				Name = "Classic Heads",
				Title = "Feature.Avatar.Label.ClassicHeads",
				NavigationKey = AvatarEditorSubcategories.ClassicHeads,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Head },
				SearchUuid = SearchUuidModule()
			}
		},
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Heads
	}
	local Config = if FFlagRemoveClassicHeadsAndFaces then nil else {
		Name = "Faces",
		Title = "Feature.Avatar.Label.Face",
		IconOn = "icons/menu/clothing/faces_on",
		IconOff = "icons/menu/clothing/faces_off",
		RenderItemTiles = true,
		UseGetInventoryV2 = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClassicFaces else nil,
		CameraFocus = ConstantsModule.FocusType.Face,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable then CatalogCategories.Body else CatalogCategories.Head,
			SubcategoryKey = CatalogSubcategories.ClassicFaces
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then { CategoryId = CatalogSubcategoryKeys.ClassicFaces } elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Head:rawValue(),
			SubcategoryId = CatalogSDUICategoryIds.Body_ClassicFaces:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Face },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.ClassicFaces
	}
	table.insert(config.Subcategories, {
		Name = "Full Body",
		Title = "Feature.Catalog.Label.FullBody",
		IconOn = "icons/menu/clothing/body_on",
		IconOff = "icons/menu/clothing/body_off",
		RenderItemTiles = true,
		RenderOutfitItemTiles = true,
		UseGetInventoryV2 = true,
		SubcategoryFiltersHeader = "Feature.Catalog.Heading.ShowBodyParts",
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.PurchasedCharacters else nil,
		RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable then CatalogCategories.Body else CatalogCategories.Characters,
			SubcategoryKey = if TestVariable then CatalogSubcategories.FullBodies else nil
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
			SubcategoryId = if TestVariable then CatalogSubcategoryKeys.FullBodies else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if TestVariable then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
		} else nil,
		SearchUuid = ConstantsModule1.PurchasedCharacterKey,
		OutfitType = ConstantsModule.OutfitTypes.Avatar,
		BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.BodyParts },
		SubcategoryFilters = {
			{
				Name = "Full Body",
				Title = "Feature.Avatar.Label.FullBody",
				RenderOutfitItemTiles = true,
				NavigationKey = AvatarEditorSubcategories.FullBody,
				BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.BodyParts },
				SearchUuid = SearchUuidModule()
			},
			{
				Name = "Torso",
				Title = "Feature.Avatar.Label.Torso",
				NavigationKey = AvatarEditorSubcategories.Torsos,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Torso },
				SearchUuid = SearchUuidModule()
			},
			{
				Name = "Right Arms",
				Title = "Feature.Avatar.Label.RightArm",
				NavigationKey = AvatarEditorSubcategories.RightArms,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RightArm },
				SearchUuid = SearchUuidModule()
			},
			{
				Name = "Left Arms",
				Title = "Feature.Avatar.Label.LeftArm",
				NavigationKey = AvatarEditorSubcategories.LeftArms,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LeftArm },
				SearchUuid = SearchUuidModule()
			},
			{
				Name = "Right Legs",
				Title = "Feature.Avatar.Label.RightLeg",
				NavigationKey = AvatarEditorSubcategories.RightLegs,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RightLeg },
				SearchUuid = SearchUuidModule()
			},
			{
				Name = "Left Legs",
				Title = "Feature.Avatar.Label.LeftLeg",
				NavigationKey = AvatarEditorSubcategories.LeftLegs,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LeftLeg },
				SearchUuid = SearchUuidModule()
			}
		},
		Id = AvatarEditorSubcategories.PurchasedCharacters
	})
	table.insert(config.Subcategories, config3)
	
	if not FFlagAXRootSlotBasedEditorFlag then
		table.insert(config.Subcategories, config2)
	end
	table.insert(config.Subcategories, config4)
	
	if not FFlagRemoveClassicHeadsAndFaces then
		table.insert(config.Subcategories, Config)
	end
	if FFlagAXRootSlotBasedEditorFlag then
		table.insert(config.Subcategories, config2)
	end
	table.insert(config.Subcategories, config1)
	
	return config
end

local Callback = if FFlagAXCustomizeMakeupSupport then function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), AvatarEditorCategories (copy), IconName (copy), SearchUuidModule (copy), GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule (copy), AvatarEditorSubcategories (copy), ConstantsModule (copy), Constants (copy), ConstantsModule1 (copy), FFlagAXCatalogMakeupSupport (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogCategoryKeys (copy), CatalogSubcategoryKeys (copy)
	return {
		Name = "Makeup",
		Title = "Feature.Avatar.Label.Makeup",
		CanAnimateCameraBasedMood = true,
		ShowSubcategoriesAsSubnavigation = true,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.Makeup else nil,
		IconOn = IconName.TwoMakeupBrushes,
		IconOff = IconName.TwoMakeupBrushes,
		SearchUuid = SearchUuidModule(),
		Subcategories = {
			{
				Name = "MakeupLooks",
				Title = "Feature.Avatar.Label.Looks",
				IconOn = "icons/menu/clothing/type_on",
				IconOff = "icons/menu/clothing/type_off",
				RenderItemTiles = true,
				RenderOutfitItemTiles = true,
				UseGetInventoryV2 = true,
				hideFilter = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.MakeupLooks else nil,
				PageType = ConstantsModule.PageType.MakeupLooks,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.MakeupLooks,
				RecommendationsType = ConstantsModule1.RecommendationsType.None,
				MatchingCatalogPage = if FFlagAXCatalogMakeupSupport and not FFlagAXCatalogCategoriesSDUI then {
					CategoryKey = CatalogCategories.Makeup,
					SubcategoryKey = CatalogSubcategories.MakeupLooks
				} else nil,
				MatchingCatalogPageIds = if FFlagAXCatalogMakeupSupport and FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Makeup,
					SubcategoryId = CatalogSubcategoryKeys.MakeupLooks
				} else nil,
				AssetTypeIdStrings = {},
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.MakeupLooks
			},
			{
				Name = "EyeMakeup",
				Title = "Feature.Avatar.Label.EyeMakeup",
				IconOn = "icons/menu/clothing/type_on",
				IconOff = "icons/menu/clothing/type_off",
				RenderItemTiles = true,
				RenderOutfitItemTiles = true,
				UseGetInventoryV2 = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.EyeMakeup else nil,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.EyeMakeup,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogMakeupSupport and not FFlagAXCatalogCategoriesSDUI then {
					CategoryKey = CatalogCategories.Makeup,
					SubcategoryKey = CatalogSubcategories.EyeMakeup
				} else nil,
				MatchingCatalogPageIds = if FFlagAXCatalogMakeupSupport and FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Makeup,
					SubcategoryId = CatalogSubcategoryKeys.EyeMakeup
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EyeMakeup },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.EyeMakeup
			},
			{
				Name = "LipMakeup",
				Title = "Feature.Avatar.Label.LipMakeup",
				IconOn = "icons/menu/clothing/type_on",
				IconOff = "icons/menu/clothing/type_off",
				RenderItemTiles = true,
				RenderOutfitItemTiles = true,
				UseGetInventoryV2 = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.LipMakeup else nil,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.LipMakeup,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogMakeupSupport and not FFlagAXCatalogCategoriesSDUI then {
					CategoryKey = CatalogCategories.Makeup,
					SubcategoryKey = CatalogSubcategories.FaceMakeup
				} else nil,
				MatchingCatalogPageIds = if FFlagAXCatalogMakeupSupport and FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Makeup,
					SubcategoryId = CatalogSubcategoryKeys.LipMakeup
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LipMakeup },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.LipMakeup
			},
			{
				Name = "FaceMakeup",
				Title = "Feature.Avatar.Label.FaceMakeup",
				IconOn = "icons/menu/clothing/type_on",
				IconOff = "icons/menu/clothing/type_off",
				RenderItemTiles = true,
				RenderOutfitItemTiles = true,
				UseGetInventoryV2 = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.FaceMakeup else nil,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogMakeupSupport and not FFlagAXCatalogCategoriesSDUI then {
					CategoryKey = CatalogCategories.Makeup,
					SubcategoryKey = CatalogSubcategories.LipMakeup
				} else nil,
				MatchingCatalogPageIds = if FFlagAXCatalogMakeupSupport and FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Makeup,
					SubcategoryId = CatalogSubcategoryKeys.FaceMakeup
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FaceMakeup },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.FaceMakeup
			},
			{
				Name = "Eyelashes",
				Title = "Feature.Avatar.Label.Eyelashes",
				RenderItemTiles = true,
				UseGetInventoryV2 = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Eyelashes else nil,
				IconOn = IconName.Eyelashes,
				IconOff = IconName.Eyelashes,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyelashes,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogMakeupSupport and not FFlagAXCatalogCategoriesSDUI then {
					CategoryKey = CatalogCategories.Makeup,
					SubcategoryKey = CatalogSubcategories.Eyelashes
				} else nil,
				MatchingCatalogPageIds = if FFlagAXCatalogMakeupSupport and FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Makeup,
					SubcategoryId = CatalogSubcategoryKeys.Eyelashes
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EyelashAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Eyelashes
			},
			{
				Name = "Eyebrows",
				Title = "Feature.Avatar.Label.Eyebrows",
				RenderItemTiles = true,
				UseGetInventoryV2 = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Eyebrows else nil,
				IconOn = IconName.Eyebrows,
				IconOff = IconName.Eyebrows,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyebrows,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogMakeupSupport and not FFlagAXCatalogCategoriesSDUI then {
					CategoryKey = CatalogCategories.Makeup,
					SubcategoryKey = CatalogSubcategories.Eyebrows
				} else nil,
				MatchingCatalogPageIds = if FFlagAXCatalogMakeupSupport and FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Makeup,
					SubcategoryId = CatalogSubcategoryKeys.Eyebrows
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EyebrowAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Eyebrows
			}
		},
		Id = AvatarEditorCategories.Makeup
	}
end else nil
local Callback1 = if FFlagAXCustomizeBackgrounds then function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), AvatarEditorCategories (copy), IconName (copy), SearchUuidModule (copy), FFlagAXBackgroundsCustomizeHydration (copy), ConstantsModule (copy)
	return {
		Name = "Backgrounds",
		Title = "Feature.Catalog.Label.Backgrounds",
		RenderItemTiles = true,
		UseGetInventoryV2 = true,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.Backgrounds else nil,
		IconOn = IconName.Image,
		IconOff = IconName.Image,
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorCategories.Backgrounds,
		AssetTypeIdStrings = if FFlagAXBackgroundsCustomizeHydration then { ConstantsModule.AssetTypeIdStrings.AvatarBackground } else nil
	}
end else nil

local function v45()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), AvatarEditorCategories (copy), SearchUuidModule (copy), GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule (copy), AvatarEditorSubcategories (copy), ConstantsModule (copy), Constants (copy), ConstantsModule1 (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogCategoryKeys (copy), CatalogSubcategoryKeys (copy), CatalogSDUICategoryIds (copy)
	return {
		Name = "Accessories",
		Title = "Feature.Catalog.LabelAccessories",
		IconOn = "icons/menu/clothing/accessories_on",
		IconOff = "icons/menu/clothing/accessories_off",
		HideTextUnderTile = true,
		CanAnimateCameraBasedMood = true,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.Accessories else nil,
		SearchUuid = SearchUuidModule(),
		Subcategories = if GetFFlagAXEnableSlotBasedEditorModule() then {
			[1] = {
				Name = "Hats",
				Title = "Feature.Avatar.Label.Head",
				IconOn = "icons/menu/clothing/hats_on",
				IconOff = "icons/menu/clothing/hats_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Hats else nil,
				CameraFocus = ConstantsModule.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Hats,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Hats
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Hats
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Heads:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Hat },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Hats
			},
			[2] = {
				Name = "Face",
				Title = "Feature.Avatar.Label.Face",
				IconOn = "icons/menu/clothing/face_on",
				IconOff = "icons/menu/clothing/face_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Face else nil,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Face,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Face
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Face
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Face:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FaceAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Face
			},
			[3] = {
				Name = "Neck",
				Title = "Feature.Avatar.Label.Neck",
				IconOn = "icons/menu/clothing/neck_on",
				IconOff = "icons/menu/clothing/neck_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Neck else nil,
				CameraFocus = ConstantsModule.FocusType.Neck,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Neck,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Neck
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Neck
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Neck:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.NeckAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Neck
			},
			[4] = {
				Name = "Back",
				Title = "Feature.Avatar.Label.Back",
				IconOn = "icons/menu/clothing/back_on",
				IconOff = "icons/menu/clothing/back_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Back else nil,
				CameraFocus = ConstantsModule.FocusType.Arms,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Back,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Back
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Back
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Back:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.BackAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Back
			},
			[5] = {
				Name = "Waist",
				Title = "Feature.Avatar.Label.Waist",
				IconOn = "icons/menu/clothing/waist_on",
				IconOff = "icons/menu/clothing/waist_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Waist else nil,
				CameraFocus = ConstantsModule.FocusType.Waist,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Waist,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Waist
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Waist
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Waist:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.WaistAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Waist
			},
			[6] = {
				Name = "Shoulder",
				Title = "Feature.Avatar.Label.Shoulder",
				IconOn = "icons/menu/clothing/shoulder_on",
				IconOff = "icons/menu/clothing/shoulder_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Shoulder else nil,
				CameraFocus = ConstantsModule.FocusType.Shoulders,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Shoulder,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Shoulder
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Shoulder
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Shoulder:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ShoulderAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Shoulder
			},
			[7] = {
				Name = "Front",
				Title = "Feature.Avatar.Label.Front",
				IconOn = "icons/menu/clothing/front_on",
				IconOff = "icons/menu/clothing/front_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Front else nil,
				CameraFocus = ConstantsModule.FocusType.Arms,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Front,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Front
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Front
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Front:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FrontAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Front
			},
			[8] = {
				Name = "Gear",
				Title = "Feature.Avatar.Label.Gear",
				IconOn = "icons/menu/clothing/gear_on",
				IconOff = "icons/menu/clothing/gear_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Gear else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Gear
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Gear
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Gear:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Gear },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Gear
			}
		} else {
			[1] = {
				Name = "Hats",
				Title = "Feature.Avatar.Label.Head",
				IconOn = "icons/menu/clothing/hats_on",
				IconOff = "icons/menu/clothing/hats_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Hats else nil,
				CameraFocus = ConstantsModule.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Hats,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Hats
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Hats
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Heads:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Hat },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Hats
			},
			[2] = {
				Name = "Face",
				Title = "Feature.Avatar.Label.Face",
				IconOn = "icons/menu/clothing/face_on",
				IconOff = "icons/menu/clothing/face_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Face else nil,
				CameraFocus = ConstantsModule.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Face,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Face
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Face
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Face:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FaceAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Face
			},
			[3] = {
				Name = "Neck",
				Title = "Feature.Avatar.Label.Neck",
				IconOn = "icons/menu/clothing/neck_on",
				IconOff = "icons/menu/clothing/neck_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Neck else nil,
				CameraFocus = ConstantsModule.FocusType.Neck,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Neck,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Neck
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Neck
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Neck:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.NeckAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Neck
			},
			[4] = {
				Name = "Shoulder",
				Title = "Feature.Avatar.Label.Shoulder",
				IconOn = "icons/menu/clothing/shoulder_on",
				IconOff = "icons/menu/clothing/shoulder_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Shoulder else nil,
				CameraFocus = ConstantsModule.FocusType.Shoulders,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Shoulder,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Shoulder
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Shoulder
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Shoulder:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ShoulderAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Shoulder
			},
			[5] = {
				Name = "Front",
				Title = "Feature.Avatar.Label.Front",
				IconOn = "icons/menu/clothing/front_on",
				IconOff = "icons/menu/clothing/front_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Front else nil,
				CameraFocus = ConstantsModule.FocusType.Arms,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Front,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Front
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Front
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Front:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FrontAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Front
			},
			[6] = {
				Name = "Back",
				Title = "Feature.Avatar.Label.Back",
				IconOn = "icons/menu/clothing/back_on",
				IconOff = "icons/menu/clothing/back_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Back else nil,
				CameraFocus = ConstantsModule.FocusType.Arms,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Back,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Back
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Back
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Back:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.BackAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Back
			},
			[7] = {
				Name = "Waist",
				Title = "Feature.Avatar.Label.Waist",
				IconOn = "icons/menu/clothing/waist_on",
				IconOff = "icons/menu/clothing/waist_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Waist else nil,
				CameraFocus = ConstantsModule.FocusType.Waist,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Waist,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Waist
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Waist
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Waist:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.WaistAccessory },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Waist
			},
			[8] = {
				Name = "Gear",
				Title = "Feature.Avatar.Label.Gear",
				IconOn = "icons/menu/clothing/gear_on",
				IconOff = "icons/menu/clothing/gear_off",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Gear else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
					CategoryKey = CatalogCategories.Accessories,
					SubcategoryKey = CatalogSubcategories.Gear
				},
				MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
					CategoryId = CatalogCategoryKeys.Accessories,
					SubcategoryId = CatalogSubcategoryKeys.Gear
				} elseif FFlagAXCatalogCategoriesSDUI then {
					CategoryId = CatalogSDUICategoryIds.Accessories:rawValue(),
					SubcategoryId = CatalogSDUICategoryIds.Accessories_Gear:rawValue()
				} else nil,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Gear },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.Gear
			}
		},
		Id = AvatarEditorCategories.Accessories
	}
end

local function v46()
	-- upvalues: AXAvatarsTabIXP (copy), IxpUtilsModule (copy), ConstantsModule1 (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), AvatarEditorCategories (copy), SearchUuidModule (copy), ConstantsModule (copy), FFlagAXAvatarTabLooksYouMayAlsoLike (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXCatalogCategoriesSDUI (copy), AXAvatarTabShopForMore (copy), CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogCategoryKeys (copy), CatalogSDUICategoryIds (copy), CatalogSubcategoryKeys (copy)
	local TestVariable = if AXAvatarsTabIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXAvatarsTabIXP.EnabledForUser) else nil
	
	return {
		Title = "Feature.Catalog.Label.Avatars",
		IconOn = "icons/menu/clothing/avatars_on",
		IconOff = "icons/menu/clothing/avatars_off",
		hideFilter = true,
		Name = ConstantsModule1.CharacterKey,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.Avatars else nil,
		SearchUuid = SearchUuidModule(),
		PageType = ConstantsModule.PageType.Avatars,
		Id = AvatarEditorCategories.Avatars,
		RecommendationsType = if GetFFlagAXEnableSlotBasedEditorModule() then if FFlagAXAvatarTabLooksYouMayAlsoLike then ConstantsModule1.RecommendationsType.AvatarLooks else ConstantsModule1.RecommendationsType.BodyParts else ConstantsModule1.RecommendationsType.All,
		ShowName = if GetFFlagAXEnableSlotBasedEditorModule() then true else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.AvatarOutfit },
		BundleTypeIdStrings = if FFlagAXInventoryDurablesSupport then { ConstantsModule.BundleTypeIdStrings.Avatars } else nil,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI or not GetFFlagAXEnableSlotBasedEditorModule() then nil elseif AXAvatarTabShopForMore then {
			CategoryKey = if TestVariable then CatalogCategories.Avatars else CatalogCategories.Characters
		} else {
			CategoryKey = CatalogCategories.Body,
			SubcategoryKey = CatalogSubcategories.FullBodies
		},
		MatchingCatalogPageIds = if GetFFlagAXEnableSlotBasedEditorModule() then if AXAvatarTabShopForMore then if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable then CatalogCategoryKeys.Avatars else CatalogCategoryKeys.Characters
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable then CatalogSDUICategoryIds.Avatars:rawValue() else CatalogSDUICategoryIds.Characters:rawValue()
		} else nil elseif FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = CatalogCategoryKeys.Body,
			SubcategoryId = CatalogSubcategoryKeys.FullBodies
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = CatalogSDUICategoryIds.Body:rawValue(),
			SubcategoryId = CatalogSDUICategoryIds.Body_FullBodies:rawValue()
		} else nil else nil
	}
end

local function v47()
	-- upvalues: CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogCategoryKeys (copy), CatalogSubcategoryKeys (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogSDUICategoryIds (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), FFlagAXCustomizeMakeupSupport (copy), AvatarEditorCategories (copy), SearchUuidModule (copy), ConstantsModule (copy), GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule (copy), AvatarEditorSubcategories (copy), ConstantsModule1 (copy)
	local config = {
		CategoryKey = CatalogCategories.AllAnimations,
		SubcategoryKey = CatalogSubcategories.AnimationBundles
	}
	local Config = if FFlagAXMigrateAllTabToSduiDev then {
		CategoryId = CatalogCategoryKeys.AllAnimations,
		SubcategoryId = CatalogSubcategoryKeys.AnimationBundles
	} elseif FFlagAXCatalogCategoriesSDUI then {
		CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue(),
		SubcategoryId = CatalogSDUICategoryIds.AnimationBundles:rawValue()
	} else nil
	
	return if GetFFlagAXEnableSlotBasedEditorModule() then {
		Name = "Animation",
		Title = "Feature.Avatar.Heading.Animations",
		IconOn = "icons/menu/clothing/animation_on",
		IconOff = "icons/menu/clothing/animation_off",
		CanAnimateCameraBasedMood = true,
		Id = if FFlagAXCustomizeMakeupSupport then AvatarEditorCategories.Animations else AvatarEditorCategories.Animation,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then if FFlagAXCustomizeMakeupSupport then AvatarEditorCategories.Animations else AvatarEditorCategories.Animation else nil,
		SearchUuid = SearchUuidModule(),
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		PageType = ConstantsModule.PageType.Animation,
		ShowName = if GetFFlagAXEnableSlotBasedEditorModule() then true else nil,
		Subcategories = {
			{
				Name = "Animation Full Sets",
				Title = "Feature.Avatar.Label.AnimationFullSet",
				IconOn = "icons/menu/clothing/animation_on",
				IconOff = "icons/menu/clothing/animation_off",
				EmptyString = "Feature.Avatar.Heading.Animations",
				RenderItemTiles = true,
				RenderOutfitItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.AnimationFullSets else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				BundleTypeIdStrings = { ConstantsModule.BundleTypeIdStrings.Animations },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.AnimationFullSets
			},
			{
				Name = "Idle Animations",
				Title = "Feature.Avatar.Label.Idle",
				IconOn = "icons/menu/clothing/idle_on",
				IconOff = "icons/menu/clothing/idle_off",
				EmptyString = "Feature.Avatar.Label.IdleAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.IdleAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.IdleAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.IdleAnimations
			},
			{
				Name = "Walk Animations",
				Title = "Feature.Avatar.Label.Walk",
				IconOn = "icons/menu/clothing/walk_on",
				IconOff = "icons/menu/clothing/walk_off",
				EmptyString = "Feature.Avatar.Label.WalkAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.WalkAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.WalkAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.WalkAnimations
			},
			{
				Name = "Run Animations",
				Title = "Feature.Avatar.Label.Run",
				IconOn = "icons/menu/clothing/animation_on",
				IconOff = "icons/menu/clothing/animation_off",
				EmptyString = "Feature.Avatar.Label.RunAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.RunAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RunAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.RunAnimations
			},
			{
				Name = "Jump Animations",
				Title = "Feature.Avatar.Label.Jump",
				IconOn = "icons/menu/clothing/jump_on",
				IconOff = "icons/menu/clothing/jump_off",
				EmptyString = "Feature.Avatar.Label.JumpAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.JumpAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.JumpAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.JumpAnimations
			},
			{
				Name = "Fall Animations",
				Title = "Feature.Avatar.Label.Fall",
				IconOn = "icons/menu/clothing/fall_on",
				IconOff = "icons/menu/clothing/fall_off",
				EmptyString = "Feature.Avatar.Label.FallAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.FallAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FallAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.FallAnimations
			},
			{
				Name = "Climb Animations",
				Title = "Feature.Avatar.Label.Climb",
				IconOn = "icons/menu/clothing/climb_on",
				IconOff = "icons/menu/clothing/climb_off",
				EmptyString = "Feature.Avatar.Label.ClimbAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClimbAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ClimbAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.ClimbAnimations
			},
			{
				Name = "Swim Animations",
				Title = "Feature.Avatar.Label.Swim",
				IconOn = "icons/menu/clothing/swim_on",
				IconOff = "icons/menu/clothing/swim_off",
				EmptyString = "Feature.Avatar.Label.SwimAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.SwimAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.SwimAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.SwimAnimations
			}
		}
	} else {
		Name = "Animation",
		Title = "Feature.Catalog.Label.Animation",
		IconOn = "icons/menu/clothing/animation_on",
		IconOff = "icons/menu/clothing/animation_off",
		CanAnimateCameraBasedMood = true,
		Id = AvatarEditorCategories.Animation,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.Animation else nil,
		SearchUuid = SearchUuidModule(),
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		PageType = ConstantsModule.PageType.Animation,
		Subcategories = {
			[1] = {
				Name = "Idle Animations",
				Title = "Feature.Avatar.Label.Idle",
				IconOn = "icons/menu/clothing/idle_on",
				IconOff = "icons/menu/clothing/idle_off",
				EmptyString = "Feature.Avatar.Label.IdleAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.IdleAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.IdleAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.IdleAnimations
			},
			[2] = {
				Name = "Walk Animations",
				Title = "Feature.Avatar.Label.Walk",
				IconOn = "icons/menu/clothing/walk_on",
				IconOff = "icons/menu/clothing/walk_off",
				EmptyString = "Feature.Avatar.Label.WalkAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.WalkAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.WalkAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.WalkAnimations
			},
			[3] = {
				Name = "Run Animations",
				Title = "Feature.Avatar.Label.Run",
				IconOn = "icons/menu/clothing/animation_on",
				IconOff = "icons/menu/clothing/animation_off",
				EmptyString = "Feature.Avatar.Label.RunAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.RunAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RunAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.RunAnimations
			},
			[4] = {
				Name = "Jump Animations",
				Title = "Feature.Avatar.Label.Jump",
				IconOn = "icons/menu/clothing/jump_on",
				IconOff = "icons/menu/clothing/jump_off",
				EmptyString = "Feature.Avatar.Label.JumpAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.JumpAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.JumpAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.JumpAnimations
			},
			[5] = {
				Name = "Fall Animations",
				Title = "Feature.Avatar.Label.Fall",
				IconOn = "icons/menu/clothing/fall_on",
				IconOff = "icons/menu/clothing/fall_off",
				EmptyString = "Feature.Avatar.Label.FallAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.FallAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FallAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.FallAnimations
			},
			[6] = {
				Name = "Climb Animations",
				Title = "Feature.Avatar.Label.Climb",
				IconOn = "icons/menu/clothing/climb_on",
				IconOff = "icons/menu/clothing/climb_off",
				EmptyString = "Feature.Avatar.Label.ClimbAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClimbAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ClimbAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.ClimbAnimations
			},
			[7] = {
				Name = "Swim Animations",
				Title = "Feature.Avatar.Label.Swim",
				IconOn = "icons/menu/clothing/swim_on",
				IconOff = "icons/menu/clothing/swim_off",
				EmptyString = "Feature.Avatar.Label.SwimAnimations",
				RenderItemTiles = true,
				NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.SwimAnimations else nil,
				RecommendationsType = ConstantsModule1.RecommendationsType.AvatarAnimations,
				MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else config,
				MatchingCatalogPageIds = Config,
				AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.SwimAnimation },
				SearchUuid = SearchUuidModule(),
				Id = AvatarEditorSubcategories.SwimAnimations
			}
		}
	}
end

local function v48()
	-- upvalues: AXCatalogHeadCategoryCombineIXPModule (copy), IxpUtilsModule (copy), AXAvatarsTabIXP (copy), v43 (copy), SearchUuidModule (copy), AvatarEditorCategories (copy), GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule (copy), AvatarEditorSubcategories (copy), ConstantsModule (copy), Constants (copy), ConstantsModule1 (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogCategories (copy), CatalogSubcategories (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogSubcategoryKeys (copy), CatalogSDUICategoryIds (copy), FFlagRemoveClassicHeadsAndFaces (copy), CatalogCategoryKeys (copy), IsVRAppBuildFunction (copy), v45 (copy), v47 (copy), GetFFlagAXExtractEmotesCategoryModule (copy), GetEmotesCategoryModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), List (ref), GetClothingCategoriesModule (copy)
	local TestVariable = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then IxpUtilsModule.readTestVariable(AXCatalogHeadCategoryCombineIXPModule.EnableHeadCategoryCombination) else nil
	local TestVariable1 = if AXAvatarsTabIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXAvatarsTabIXP.EnabledForUser) else nil
	local v1 = v43()
	local config = {
		Name = "HeadAndBody",
		Title = "Feature.Avatar.Label.HeadBody",
		IconOn = "icons/menu/clothing/body_on",
		IconOff = "icons/menu/clothing/body_off",
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorCategories.Body
	}
	local config1 = {
		Name = "Style",
		Title = "Feature.Avatar.Label.Heads",
		IconOn = "icons/menu/clothing/type_on",
		IconOff = "icons/menu/clothing/type_off",
		RenderItemTiles = true,
		RenderOutfitItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Heads else nil,
		UseGetInventoryV2 = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then true else nil,
		CameraFocus = ConstantsModule.FocusType.Face,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Style,
		RecommendationsType = ConstantsModule1.RecommendationsType.DynamicHeads,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Head,
			SubcategoryKey = CatalogSubcategories.Heads
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then { CategoryId = CatalogSubcategoryKeys.Heads } elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Head:rawValue(),
			SubcategoryId = CatalogSDUICategoryIds.Body_Heads:rawValue()
		} else nil,
		OutfitType = ConstantsModule.OutfitTypes.DynamicHead,
		OutfitFilter = Enum.OutfitSource.Purchased,
		AssetTypeIdStrings = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then {
			ConstantsModule.AssetTypeIdStrings.Head,
			ConstantsModule.AssetTypeIdStrings.Face
		} else nil,
		OutfitTypeIdStrings = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then { ConstantsModule.BundleTypeIdStrings.DynamicHead } else nil,
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Heads
	}
	local config2 = {
		Name = "Hair",
		Title = "Feature.Avatar.Label.Hair",
		IconOn = "icons/menu/clothing/hair_on",
		IconOff = "icons/menu/clothing/hair_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Hair else nil,
		CameraFocus = ConstantsModule.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Hair,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Head,
			SubcategoryKey = CatalogSubcategories.Hair
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then { CategoryId = CatalogSubcategoryKeys.Hair } elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Head:rawValue(),
			SubcategoryId = CatalogSDUICategoryIds.Body_Hair:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.HairAccessory },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Hair
	}
	local config3 = {
		Name = "Skin",
		Title = "Feature.Avatar.Label.Skin",
		IconOn = "icons/menu/clothing/skin_on",
		IconOff = "icons/menu/clothing/skin_off",
		RenderItemTiles = false,
		hideFilter = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Skin else nil,
		RecommendationsType = ConstantsModule1.RecommendationsType.None,
		PageType = ConstantsModule.PageType.BodyColors,
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Skin
	}
	local config4 = {
		Name = "Classic Heads",
		Title = "Feature.Avatar.Label.ClassicHeads",
		IconOn = "icons/menu/clothing/classicHead_on",
		IconOff = "icons/menu/clothing/classicHead_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClassicHeads else nil,
		CameraFocus = ConstantsModule.FocusType.Face,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.ClassicHeads,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Head,
			SubcategoryKey = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then CatalogSubcategories.Heads elseif FFlagRemoveClassicHeadsAndFaces then CatalogSubcategories.Heads else CatalogSubcategories.ClassicHeads
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then CatalogSubcategoryKeys.Heads elseif FFlagRemoveClassicHeadsAndFaces then CatalogSubcategoryKeys.Heads else CatalogSubcategoryKeys.ClassicHeads
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Head:rawValue(),
			SubcategoryId = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then CatalogSDUICategoryIds.Body_Heads:rawValue() elseif FFlagRemoveClassicHeadsAndFaces then CatalogSDUICategoryIds.Body_Heads:rawValue() else CatalogSDUICategoryIds.Body_ClassicHeads:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Head },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.ClassicHeads
	}
	local config5 = {
		Name = "Classic Faces",
		Title = "Feature.Avatar.Label.ClassicFaces",
		IconOn = "icons/menu/clothing/faces_on",
		IconOff = "icons/menu/clothing/faces_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.ClassicFaces else nil,
		CameraFocus = ConstantsModule.FocusType.Face,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.ClassicFaces,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Head,
			SubcategoryKey = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then CatalogSubcategories.Heads elseif FFlagRemoveClassicHeadsAndFaces then CatalogSubcategories.Face else CatalogSubcategories.ClassicFaces
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then CatalogSubcategoryKeys.Heads elseif FFlagRemoveClassicHeadsAndFaces then CatalogCategoryKeys.Accessories else CatalogSubcategoryKeys.ClassicFaces,
			SubcategoryId = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then nil elseif FFlagRemoveClassicHeadsAndFaces then CatalogSubcategoryKeys.Face else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() and TestVariable then CatalogSDUICategoryIds.Body_Heads:rawValue() elseif FFlagRemoveClassicHeadsAndFaces then CatalogSDUICategoryIds.Accessories_Face:rawValue() else CatalogSDUICategoryIds.Body_ClassicFaces:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Face },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.ClassicFaces
	}
	local config6 = {
		Name = "Torsos",
		Title = "Feature.Avatar.Label.Torsos",
		IconOn = "icons/menu/clothing/torsos_on",
		IconOff = "icons/menu/clothing/torsos_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Torsos else nil,
		CameraFocus = ConstantsModule.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Torsos,
		RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Characters,
			SubcategoryKey = if TestVariable1 then CatalogSubcategories.FullBodies else nil
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable1 then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
			SubcategoryId = if TestVariable1 then CatalogSubcategoryKeys.FullBodies else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.Torso },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Torsos
	}
	local config7 = {
		Name = "Left Arms",
		Title = "Feature.Avatar.Label.LeftArms",
		IconOn = "icons/menu/clothing/arms_on",
		IconOff = "icons/menu/clothing/arms_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.LeftArms else nil,
		CameraFocus = ConstantsModule.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Arms,
		RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Characters,
			SubcategoryKey = if TestVariable1 then CatalogSubcategories.FullBodies else nil
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable1 then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
			SubcategoryId = if TestVariable1 then CatalogSubcategoryKeys.FullBodies else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LeftArm },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.LeftArms
	}
	local config8 = {
		Name = "Right Arms",
		Title = "Feature.Avatar.Label.RightArms",
		IconOn = "icons/menu/clothing/arms_on",
		IconOff = "icons/menu/clothing/arms_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.RightArms else nil,
		CameraFocus = ConstantsModule.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Arms,
		RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Characters,
			SubcategoryKey = if TestVariable1 then CatalogSubcategories.FullBodies else nil
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable1 then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
			SubcategoryId = if TestVariable1 then CatalogSubcategoryKeys.FullBodies else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RightArm },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.RightArms
	}
	local config9 = {
		Name = "Left Legs",
		Title = "Feature.Avatar.Label.LeftLegs",
		IconOn = "icons/menu/clothing/legs_on",
		IconOff = "icons/menu/clothing/legs_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.LeftLegs else nil,
		CameraFocus = ConstantsModule.FocusType.Legs,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Legs,
		RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Characters,
			SubcategoryKey = if TestVariable1 then CatalogSubcategories.FullBodies else nil
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable1 then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
			SubcategoryId = if TestVariable1 then CatalogSubcategoryKeys.FullBodies else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.LeftLeg },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.LeftLegs
	}
	local config10 = {
		Name = "Right Legs",
		Title = "Feature.Avatar.Label.RightLegs",
		IconOn = "icons/menu/clothing/legs_on",
		IconOff = "icons/menu/clothing/legs_off",
		RenderItemTiles = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.RightLegs else nil,
		CameraFocus = ConstantsModule.FocusType.Legs,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Legs,
		RecommendationsType = ConstantsModule1.RecommendationsType.BodyParts,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			CategoryKey = if TestVariable1 then CatalogCategories.Body else CatalogCategories.Characters,
			SubcategoryKey = if TestVariable1 then CatalogSubcategories.FullBodies else nil
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			CategoryId = if TestVariable1 then CatalogCategoryKeys.Body else CatalogCategoryKeys.Characters,
			SubcategoryId = if TestVariable1 then CatalogSubcategoryKeys.FullBodies else nil
		} elseif FFlagAXCatalogCategoriesSDUI then {
			CategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body:rawValue() else CatalogSDUICategoryIds.Characters:rawValue(),
			SubcategoryId = if TestVariable1 then CatalogSDUICategoryIds.Body_FullBodies:rawValue() else nil
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RightLeg },
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.RightLegs
	}
	local config11 = {
		Name = "Build",
		Title = "Feature.Avatar.Label.Build",
		IconOn = "icons/menu/clothing/build_on",
		IconOff = "icons/menu/clothing/build_off",
		RenderItemTiles = false,
		hideFilter = true,
		NavigationKey = if GetFFlagAXAddNavigationKeyToEditorSubcategoriesModule() then AvatarEditorSubcategories.Build else nil,
		RecommendationsType = ConstantsModule1.RecommendationsType.None,
		PageType = ConstantsModule.PageType.BodyStyle,
		SearchUuid = SearchUuidModule(),
		Id = AvatarEditorSubcategories.Build
	}
	local List1 = {}
	table.insert(List1, config1)
	table.insert(List1, config2)
	table.insert(List1, config3)
	
	if (not AXCatalogHeadCategoryCombineIXPModule.isEnabled() or not TestVariable) and not FFlagRemoveClassicHeadsAndFaces then
		table.insert(List1, config4)
		table.insert(List1, config5)
	end
	table.insert(List1, config6)
	table.insert(List1, config7)
	table.insert(List1, config8)
	table.insert(List1, config9)
	table.insert(List1, config10)
	
	if not IsVRAppBuildFunction() then
		table.insert(List1, config11)
	end
	config.Subcategories = List1
	List = {
		v1,
		config,
		GetClothingCategoriesModule().avatarEditorCategories,
		v45(),
		if GetFFlagAXExtractEmotesCategoryModule() then GetEmotesCategoryModule() else {
			Title = "Feature.Avatar.Heading.Emotes",
			IconOn = "icons/menu/clothing/emotes_on",
			IconOff = "icons/menu/clothing/emotes_off",
			EquipSlotsCount = 8,
			RenderItemTiles = true,
			CanAnimateCameraBasedMood = false,
			Name = ConstantsModule.AssetCategories.Emotes,
			CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
			PageType = ConstantsModule.PageType.Emotes,
			RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
			MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
				CategoryKey = CatalogCategories.AllAnimations,
				SubcategoryKey = CatalogSubcategories.Emotes
			},
			MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
				CategoryId = CatalogCategoryKeys.AllAnimations,
				SubcategoryId = CatalogSubcategoryKeys.Emotes
			} elseif FFlagAXCatalogCategoriesSDUI then {
				CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue(),
				SubcategoryId = CatalogSDUICategoryIds.Emotes:rawValue()
			} else nil,
			AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EmoteAnimation },
			SearchUuid = SearchUuidModule(),
			Id = AvatarEditorCategories.Emotes,
			ShowName = if GetFFlagAXEnableSlotBasedEditorModule() then true else nil
		},
		(v47())
	}
	
	for Category, value in List do
		value.Category = Category
		value.Subcategory = nil
		
		if value.Subcategories then
			for Subcategory, subcategory in value.Subcategories do
				subcategory.Category = Category
				subcategory.Subcategory = Subcategory
			end
		end
	end
end

local function buildSlotBasedEditorCategories()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), AvatarEditorCategories (copy), SearchUuidModule (copy), FFlagAXTweakSlotsCameraPositioningModule (copy), ConstantsModule (copy), FFlagAXCustomizeMakeupSupport (copy), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy), CatalogCategories (copy), ConstantsModule1 (copy), v44 (copy), Callback (copy), v45 (copy), FFlagAXCustomizeBackgrounds (copy), Callback1 (copy), v47 (copy), v46 (copy), GetEmotesCategoryModule (copy), FFlagAXDownrankMakeupCustomize (copy), GetClothingCategoriesModule (copy)
	local config = {
		Name = "All",
		Title = "Feature.Avatar.Heading.All",
		CanAnimateCameraBasedMood = true,
		RenderOutfitItemTiles = true,
		IconOn = "icons/menu/clothing/purchased_on",
		IconOff = "icons/menu/clothing/purchased_off",
		RenderItemTiles = true,
		UseGetInventoryV2 = true,
		NavigationKey = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarEditorCategories.All else nil,
		SearchUuid = SearchUuidModule(),
		CameraFocus = if FFlagAXTweakSlotsCameraPositioningModule then ConstantsModule.FocusType.Neck else ConstantsModule.FocusType.Arms,
		CameraZoomRadius = if FFlagAXTweakSlotsCameraPositioningModule then 15 else 13,
		AssetTypeIdStrings = if FFlagAXCustomizeMakeupSupport then {
			ConstantsModule.AssetTypeIdStrings.TShirt,
			ConstantsModule.AssetTypeIdStrings.Shirt,
			ConstantsModule.AssetTypeIdStrings.Pants,
			ConstantsModule.AssetTypeIdStrings.Hat,
			ConstantsModule.AssetTypeIdStrings.Face,
			ConstantsModule.AssetTypeIdStrings.Gear,
			ConstantsModule.AssetTypeIdStrings.HairAccessory,
			ConstantsModule.AssetTypeIdStrings.FaceAccessory,
			ConstantsModule.AssetTypeIdStrings.NeckAccessory,
			ConstantsModule.AssetTypeIdStrings.ShoulderAccessory,
			ConstantsModule.AssetTypeIdStrings.FrontAccessory,
			ConstantsModule.AssetTypeIdStrings.BackAccessory,
			ConstantsModule.AssetTypeIdStrings.WaistAccessory,
			ConstantsModule.AssetTypeIdStrings.TShirtAccessory,
			ConstantsModule.AssetTypeIdStrings.ShirtAccessory,
			ConstantsModule.AssetTypeIdStrings.PantsAccessory,
			ConstantsModule.AssetTypeIdStrings.JacketAccessory,
			ConstantsModule.AssetTypeIdStrings.SweaterAccessory,
			ConstantsModule.AssetTypeIdStrings.ShortsAccessory,
			ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory,
			ConstantsModule.AssetTypeIdStrings.Head,
			ConstantsModule.AssetTypeIdStrings.EyelashAccessory,
			ConstantsModule.AssetTypeIdStrings.EyebrowAccessory,
			ConstantsModule.AssetTypeIdStrings.FaceMakeup,
			ConstantsModule.AssetTypeIdStrings.EyeMakeup,
			ConstantsModule.AssetTypeIdStrings.LipMakeup
		} else {
			ConstantsModule.AssetTypeIdStrings.TShirt,
			ConstantsModule.AssetTypeIdStrings.Shirt,
			ConstantsModule.AssetTypeIdStrings.Pants,
			ConstantsModule.AssetTypeIdStrings.Hat,
			ConstantsModule.AssetTypeIdStrings.Face,
			ConstantsModule.AssetTypeIdStrings.Gear,
			ConstantsModule.AssetTypeIdStrings.HairAccessory,
			ConstantsModule.AssetTypeIdStrings.FaceAccessory,
			ConstantsModule.AssetTypeIdStrings.NeckAccessory,
			ConstantsModule.AssetTypeIdStrings.ShoulderAccessory,
			ConstantsModule.AssetTypeIdStrings.FrontAccessory,
			ConstantsModule.AssetTypeIdStrings.BackAccessory,
			ConstantsModule.AssetTypeIdStrings.WaistAccessory,
			ConstantsModule.AssetTypeIdStrings.TShirtAccessory,
			ConstantsModule.AssetTypeIdStrings.ShirtAccessory,
			ConstantsModule.AssetTypeIdStrings.PantsAccessory,
			ConstantsModule.AssetTypeIdStrings.JacketAccessory,
			ConstantsModule.AssetTypeIdStrings.SweaterAccessory,
			ConstantsModule.AssetTypeIdStrings.ShortsAccessory,
			ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory,
			ConstantsModule.AssetTypeIdStrings.Head
		},
		BundleTypeIdStrings = {
			ConstantsModule.BundleTypeIdStrings.BodyParts,
			ConstantsModule.BundleTypeIdStrings.DynamicHead,
			ConstantsModule.BundleTypeIdStrings.Shoes,
			ConstantsModule.BundleTypeIdStrings.Animations
		},
		MatchingCatalogPage = if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then { CategoryKey = CatalogCategories.Recommended } else nil,
		RecommendationsType = if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then ConstantsModule1.RecommendationsType.All else nil,
		Id = AvatarEditorCategories.All
	}
	local v2 = v44()
	local CallbackResult = if FFlagAXCustomizeMakeupSupport then Callback() else nil
	local v3 = v45()
	local CallbackResult1 = if FFlagAXCustomizeBackgrounds then Callback1() else nil
	local v4 = v47()
	local v5 = v46()
	local EmotesCategoryModule = GetEmotesCategoryModule()
	local List = if FFlagAXCustomizeMakeupSupport and not FFlagAXDownrankMakeupCustomize then {
		config, v5, v2, CallbackResult,
		GetClothingCategoriesModule().avatarEditorCategories, v3, v4,
		EmotesCategoryModule
	} else {
		config, v5, v2, GetClothingCategoriesModule().avatarEditorCategories, v3,
		v4, EmotesCategoryModule
	}
	
	if FFlagAXDownrankMakeupCustomize then
		table.insert(List, CallbackResult)
	end
	if CallbackResult1 then
		for i, value in List do
			if value == v3 then
				table.insert(List, i + 1, CallbackResult1)
				break
			end
		end
	end
	for Category, value1 in List do
		value1.Category = Category
		value1.Subcategory = nil
		
		if value1.Subcategories then
			for Subcategory, subcategory in value1.Subcategories do
				subcategory.Category = Category
				subcategory.Subcategory = Subcategory
				subcategory.UseGetInventoryV2 = true
			end
		end
	end
	return List
end

local function sanityCheckCat(p1)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNotNil(p1.IconOn, `category {p1.Name} is missing iconOn`)
	ArgCheckModule.isNotNil(p1.IconOff, `category {p1.Name} is missing IconOff`)
	ArgCheckModule.isNotNil(p1.SearchUuid, `category {p1.Name} is missing SearchUuid`)
	ArgCheckModule.isNotNil(p1.Id, "category  " .. p1.Name .. " is missing Id")
end

local function _(Key, p1)
	if Key then
		if p1[Key] then
			error("Duplicate Id found: " .. Key)
			
			return
		end
		p1[Key] = true
	end
end

local function sanityCheck(List)
	-- upvalues: sanityCheckCat (copy)
	local t = {}
	
	for _, value in List do
		sanityCheckCat(value)
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
				sanityCheckCat(subcategory)
				local Id1 = subcategory.Id
				
				if Id1 then
					if t[Id1] then
						error("Duplicate Id found: " .. Id1)
					else
						t[Id1] = true
					end
				end
			end
		end
	end
end

local v6 = nil

return function()
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), v6 (ref), buildSlotBasedEditorCategories (copy), sanityCheck (copy), List (ref), v48 (copy)
	if GetFFlagAXEnableSlotBasedEditorModule() then
		if not v6 then
			v6 = buildSlotBasedEditorCategories()
			sanityCheck(v6)
		end
		return v6
	else
		if not List then
			v48()
			sanityCheck(List)
		end
		return List
	end
end