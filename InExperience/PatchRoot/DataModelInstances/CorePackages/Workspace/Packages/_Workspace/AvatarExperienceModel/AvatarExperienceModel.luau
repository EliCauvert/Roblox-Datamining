local _ = require(script.Types.CommonTypes)
local _ = require(script.Types.DiscountType)
local _ = require(script.Types.TimedOptionType)
local _ = require(script.Types.IncludedItem)
local _ = require(script.Types.ItemExperienceData)
local _ = require(script.Types.AXItemInfo)
local _ = require(script.Types.AXCollectibleItemInfo)
local _ = require(script.Types.AXCollectibleInstance)
local _ = require(script.Types.WidgetContentTypes)
local _ = require(script.Stores.AvatarSettingsStore.createAvatarSettingsStore)

return {
	["jest.config"] = script["jest.config"],
	Constants = require(script.Constants),
	Enums = {
		AvatarEditorCategories = require(script.Enums.AvatarEditorCategories),
		AvatarEditorSubcategories = require(script.Enums.AvatarEditorSubcategories),
		CatalogCategories = require(script.Enums.CatalogCategories),
		CatalogCategoryTaxonomyUUIDs = require(script.Enums.CatalogCategoryTaxonomyUUIDs),
		FocusType = require(script.Enums.FocusType),
		HeadShape = require(script.Enums.HeadShape),
		InventoryOutfitType = require(script.Enums.InventoryOutfitType),
		ItemTypeEnum = require(script.Enums.ItemTypeEnum),
		ItemLicenseType = require(script.Enums.ItemLicenseType),
		RecommendationsType = require(script.Enums.RecommendationsType)
	},
	Stores = {
		getAvatarSettingsStore = require(script.Stores.AvatarSettingsStore.getAvatarSettingsStore),
		getLayeredClothingEntryPageStore = require(script.Stores.LayeredClothingEntryPageStore.getLayeredClothingEntryPageStore),
		getLayeredClothingLastSavedSortStore = require(script.Stores.LayeredClothingLastSavedSortStore.getLayeredClothingLastSavedSortStore)
	}
}