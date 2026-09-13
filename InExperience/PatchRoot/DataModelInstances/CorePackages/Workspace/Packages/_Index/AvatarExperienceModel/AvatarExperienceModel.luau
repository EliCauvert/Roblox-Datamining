local avatarEditorSubcategoriesModule = require(script.Enums.AvatarEditorSubcategories)
local catalogCategoryTaxonomyUUIDsModule = require(script.Enums.CatalogCategoryTaxonomyUUIDs)
local constantsModule = require(script.Constants)
local focusTypeModule = require(script.Enums.FocusType)
local headShapeModule = require(script.Enums.HeadShape)
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
		AvatarEditorSubcategories = avatarEditorSubcategoriesModule,
		CatalogCategoryTaxonomyUUIDs = catalogCategoryTaxonomyUUIDsModule,
		FocusType = focusTypeModule,
		HeadShape = headShapeModule,
		RecommendationsType = recommendationsTypeModule
	}
}