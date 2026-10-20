local CorePackages = game:GetService("CorePackages")
local ResetSortAndFiltersModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters)
local AddAnalyticsMetadataFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.AddAnalyticsMetadata
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local config = {
	filterPriceMin = "",
	filterPriceMax = "",
	filterCreatorsName = "",
	sort = UnifiedEventLogEnums.Sort.RELEVANCE,
	filterSalesType = UnifiedEventLogEnums.FiltersSalesType.SALES_TYPE_ALL,
	filterCreatorsType = UnifiedEventLogEnums.FiltersCreators.CREATORS_ALL,
	filterPrice = UnifiedEventLogEnums.FiltersPrice.PRICE_ANY,
	filterUnavailableItems = UnifiedEventLogEnums.FiltersUnavailableItems.UNAVAILABLE_ITEMS_HIDE
}

return function()
	-- upvalues: ResetSortAndFiltersModule (copy), AddAnalyticsMetadataFunction (copy), config (copy)
	return function(p1)
		-- upvalues: ResetSortAndFiltersModule (upval), AddAnalyticsMetadataFunction (upval), config (upval)
		p1:dispatch(ResetSortAndFiltersModule())
		p1:dispatch(AddAnalyticsMetadataFunction(config))
	end
end