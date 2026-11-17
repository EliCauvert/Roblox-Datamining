local UnifiedEventEnumsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.UnifiedEventEnums)

return {
	MarketplaceUnifiedAction = UnifiedEventEnumsModule.MarketplaceUnifiedAction,
	MarketplaceUnifiedActionNumbers = UnifiedEventEnumsModule.MarketplaceUnifiedActionNumbers,
	MarketplaceUnifiedItemType = UnifiedEventEnumsModule.MarketplaceUnifiedItemType,
	MarketplaceLookType = UnifiedEventEnumsModule.MarketplaceLookType,
	MarketplaceTimedOption = UnifiedEventEnumsModule.MarketplaceTimedOption,
	Sort = UnifiedEventEnumsModule.MarketplaceSorts,
	FiltersSalesType = UnifiedEventEnumsModule.MarketplaceFiltersSalesType,
	FiltersCreators = UnifiedEventEnumsModule.MarketplaceFiltersCreators,
	FiltersPrice = UnifiedEventEnumsModule.MarketplaceFiltersPrice,
	FiltersUnavailableItems = UnifiedEventEnumsModule.MarketplaceFiltersUnavailableItems,
	WidgetUiTreatment = UnifiedEventEnumsModule.WidgetUiTreatment
}