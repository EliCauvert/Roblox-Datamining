local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local CatalogSDUICategoryIds = AvatarExperienceCommonModule.Enums.CatalogSDUICategoryIds
local CatalogCategoryKeys = AvatarExperienceCommonModule.Enums.CatalogCategoryKeys
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local PhotoboothCategories = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothCategories

return {
	[PhotoboothCategories.All] = {
		Title = "Feature.Avatar.Heading.All",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.All,
		NavigationKey = PhotoboothCategories.All,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = {
			ConstantsModule.AssetTypeIdStrings.EmoteAnimation,
			ConstantsModule.AssetTypeIdStrings.IdleAnimation,
			ConstantsModule.AssetTypeIdStrings.WalkAnimation,
			ConstantsModule.AssetTypeIdStrings.RunAnimation,
			ConstantsModule.AssetTypeIdStrings.JumpAnimation,
			ConstantsModule.AssetTypeIdStrings.FallAnimation,
			ConstantsModule.AssetTypeIdStrings.ClimbAnimation,
			ConstantsModule.AssetTypeIdStrings.SwimAnimation
		},
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Emotes] = {
		Title = "Feature.Avatar.Heading.Emotes",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Emotes,
		NavigationKey = PhotoboothCategories.Emotes,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.EmoteAnimation },
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Idle] = {
		Title = "Feature.Avatar.Label.Idle",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Idle,
		NavigationKey = PhotoboothCategories.Idle,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.IdleAnimation },
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Walk] = {
		Title = "Feature.Avatar.Label.Walk",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Walk,
		NavigationKey = PhotoboothCategories.Walk,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.WalkAnimation },
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Run] = {
		Title = "Feature.Avatar.Label.Run",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Run,
		NavigationKey = PhotoboothCategories.Run,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.RunAnimation },
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Jump] = {
		Title = "Feature.Avatar.Label.Jump",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Jump,
		NavigationKey = PhotoboothCategories.Jump,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.JumpAnimation },
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Fall] = {
		Title = "Feature.Avatar.Label.Fall",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Fall,
		NavigationKey = PhotoboothCategories.Fall,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.FallAnimation },
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Climb] = {
		Title = "Feature.Avatar.Label.Climb",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Climb,
		NavigationKey = PhotoboothCategories.Climb,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.ClimbAnimation },
		SearchUuid = SearchUuidModule()
	},
	[PhotoboothCategories.Swim] = {
		Title = "Feature.Avatar.Label.Swim",
		RenderItemTiles = true,
		CanAnimateCameraBasedMood = false,
		Subcategories = nil,
		Name = PhotoboothCategories.Swim,
		NavigationKey = PhotoboothCategories.Swim,
		CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
		RecommendationsType = ConstantsModule1.RecommendationsType.Asset,
		MatchingCatalogPage = if FFlagAXCatalogCategoriesSDUI then nil else {
			SubcategoryKey = nil,
			CategoryKey = CatalogCategories.AllAnimations
		},
		MatchingCatalogPageIds = if FFlagAXMigrateAllTabToSduiDev then {
			SubcategoryId = nil,
			CategoryId = CatalogCategoryKeys.AllAnimations
		} elseif FFlagAXCatalogCategoriesSDUI then {
			SubcategoryId = nil,
			CategoryId = CatalogSDUICategoryIds.AllAnimations:rawValue()
		} else nil,
		AssetTypeIdStrings = { ConstantsModule.AssetTypeIdStrings.SwimAnimation },
		SearchUuid = SearchUuidModule()
	}
}