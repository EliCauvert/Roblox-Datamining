local avatarEditorCategoriesModule = require(script.Enums.AvatarEditorCategories)
local avatarEditorSubcategoriesModule = require(script.Enums.AvatarEditorSubcategories)
local catalogCategoryTaxonomyUUIDsModule = require(script.Enums.CatalogCategoryTaxonomyUUIDs)
local constantsModule = require(script.Constants)
local focusTypeModule = require(script.Enums.FocusType)
local headShapeModule = require(script.Enums.HeadShape)
local inventoryOutfitTypeModule = require(script.Enums.InventoryOutfitType)
local itemLicenseTypeModule = require(script.Enums.ItemLicenseType)
local recommendationsTypeModule = require(script.Enums.RecommendationsType)
local _ = require(script.Types.CommonTypes)
local _ = require(script.Types.DiscountType)
local _ = require(script.Types.TimedOptionType)
local _ = require(script.Types.IncludedItem)
local _ = require(script.Types.ItemExperienceData)
local _ = require(script.Types.AXItemInfo)
local _ = require(script.Types.AXCollectibleItemInfo)
local _ = require(script.Types.AXCollectibleInstance)

return {
	Constants = constantsModule,
	Enums = {
		AvatarEditorCategories = avatarEditorCategoriesModule,
		AvatarEditorSubcategories = avatarEditorSubcategoriesModule,
		CatalogCategoryTaxonomyUUIDs = catalogCategoryTaxonomyUUIDsModule,
		FocusType = focusTypeModule,
		HeadShape = headShapeModule,
		InventoryOutfitType = inventoryOutfitTypeModule,
		ItemLicenseType = itemLicenseTypeModule,
		RecommendationsType = recommendationsTypeModule
	}
}