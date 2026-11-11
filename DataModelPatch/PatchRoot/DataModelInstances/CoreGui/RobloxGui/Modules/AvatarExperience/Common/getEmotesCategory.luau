local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local CatalogSubcategories = AvatarExperienceCommonModule.Enums.CatalogSubcategories
local CatalogSDUICategoryIds = AvatarExperienceCommonModule.Enums.CatalogSDUICategoryIds
local CatalogCategoryKeys = AvatarExperienceCommonModule.Enums.CatalogCategoryKeys
local CatalogSubcategoryKeys = AvatarExperienceCommonModule.Enums.CatalogSubcategoryKeys
local AvatarEditorCategories = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local config = {
	Title = "Feature.Avatar.Heading.Emotes",
	IconOn = "icons/menu/clothing/emotes_on",
	IconOff = "icons/menu/clothing/emotes_off",
	EquipSlotsCount = 8,
	RenderItemTiles = true,
	CanAnimateCameraBasedMood = false,
	Id = "Emotes",
	ShowName = true,
	Name = ConstantsModule.AssetCategories.Emotes,
	CameraZoomRadius = ConstantsModule.AnimationCategoryCameraZoomRadius,
	NavigationKey = if require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)() then AvatarEditorCategories.Emotes else nil,
	PageType = ConstantsModule.PageType.Emotes,
	RecommendationsType = require(Modules.AvatarExperience.AvatarEditor.Constants).RecommendationsType.Asset,
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
	SearchUuid = require(Modules.LuaApp.SearchUuid)()
}

return function()
	-- upvalues: config (copy)
	return config
end