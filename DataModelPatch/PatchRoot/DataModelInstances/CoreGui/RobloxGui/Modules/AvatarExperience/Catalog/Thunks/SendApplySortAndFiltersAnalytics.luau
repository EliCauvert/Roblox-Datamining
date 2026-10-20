local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local SortTypeModule = require(Modules.AvatarExperience.Common.Enum.SortType)
local SalesTypeFilterModule = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local UnavailableItemFilterModule = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local AddAnalyticsMetadataFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.AddAnalyticsMetadata
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local AXUpdateAnalyticsFiltersEnums = game:DefineFastFlag("AXUpdateAnalyticsFiltersEnums", false)
local AXDeprecateAnalyticsFiltersEnums = game:DefineFastFlag("AXDeprecateAnalyticsFiltersEnums", false)
local config = {
	Relevance = UnifiedEventLogEnums.Sort.RELEVANCE,
	PriceLowToHigh = UnifiedEventLogEnums.Sort.PRICE_LOW_TO_HIGH,
	PriceHighToLow = UnifiedEventLogEnums.Sort.PRICE_HIGH_TO_LOW,
	RecentlyCreated = UnifiedEventLogEnums.Sort.RECENTLY_CREATED,
	BestsellingAllTime = UnifiedEventLogEnums.Sort.BEST_SELLING_ALL_TIME,
	BestsellingPastWeek = UnifiedEventLogEnums.Sort.BEST_SELLING_PAST_WEEK,
	BestsellingPastDay = UnifiedEventLogEnums.Sort.BEST_SELLING_PAST_DAY,
	MostFavoritedAllTime = UnifiedEventLogEnums.Sort.MOST_FAVORITED_ALL_TIME,
	MostFavoritedPastWeek = UnifiedEventLogEnums.Sort.MOST_FAVORITED_PAST_WEEK,
	MostFavoritedPastDay = UnifiedEventLogEnums.Sort.MOST_FAVORITED_PAST_DAY
}

local function _(Text, Text1: string)
	-- upvalues: config (copy)
	if not Text1 then
		Text1 = ""
	end
	return config[Text .. Text1]
end

return function(p1)
	-- upvalues: FilterUtilsModule (copy), CatalogConstantsModule (copy), SortTypeModule (copy), SalesTypeFilterModule (copy), UnavailableItemFilterModule (copy), AddAnalyticsMetadataFunction (copy), AXDeprecateAnalyticsFiltersEnums (copy), config (copy), AXUpdateAnalyticsFiltersEnums (copy), UnifiedEventLogEnums (copy)
	return function(p2)
		-- upvalues: FilterUtilsModule (upval), CatalogConstantsModule (upval), SortTypeModule (upval), SalesTypeFilterModule (upval), UnavailableItemFilterModule (upval), AddAnalyticsMetadataFunction (upval), AXDeprecateAnalyticsFiltersEnums (upval), config (upval), AXUpdateAnalyticsFiltersEnums (upval), UnifiedEventLogEnums (upval), p1 (copy)
		local State = p2:getState()
		local SelectMinPriceResult = FilterUtilsModule.selectMinPrice(State)
		
		if SelectMinPriceResult == CatalogConstantsModule.MinPriceFilter then
			SelectMinPriceResult = nil
		end
		local SelectMaxPriceResult = FilterUtilsModule.selectMaxPrice(State)
		
		if SelectMaxPriceResult == CatalogConstantsModule.MaxPriceFilter then
			SelectMaxPriceResult = nil
		end
		local SelectCatalogSortResult = FilterUtilsModule.selectCatalogSort(State)
		local SelectCatalogSortAggregationResult = if SelectCatalogSortResult == SortTypeModule.MostFavorited or SelectCatalogSortResult == SortTypeModule.Bestselling then FilterUtilsModule.selectCatalogSortAggregation(State) else nil
		local SelectSalesTypeFilterResult = FilterUtilsModule.selectSalesTypeFilter(State)
		
		if SelectSalesTypeFilterResult == SalesTypeFilterModule.All then
			SelectSalesTypeFilterResult = nil
		end
		local SelectCreatorFilterResult = FilterUtilsModule.selectCreatorFilter(State)
		
		if SelectCreatorFilterResult == "" then
			SelectCreatorFilterResult = nil
		end
		local IsSelectUnavailableItemFilterResultMatch = FilterUtilsModule.selectUnavailableItemFilter(State) == UnavailableItemFilterModule.Show or nil
		
		if SelectCatalogSortResult then
			p2:dispatch(AddAnalyticsMetadataFunction({
				sortEnumValue = if AXDeprecateAnalyticsFiltersEnums then nil else config[SelectCatalogSortResult .. (SelectCatalogSortAggregationResult or "")],
				sort = if AXUpdateAnalyticsFiltersEnums then config[SelectCatalogSortResult .. (SelectCatalogSortAggregationResult or "")] else nil
			}))
		end
		p2:dispatch(AddAnalyticsMetadataFunction({
			filterSalesTypeEnumValue = if AXDeprecateAnalyticsFiltersEnums then nil elseif SelectSalesTypeFilterResult == SalesTypeFilterModule.Collectibles then UnifiedEventLogEnums.FiltersSalesType.SALES_TYPE_LIMITED else UnifiedEventLogEnums.FiltersSalesType.SALES_TYPE_ALL,
			filterCreatorsTypeEnumValue = if AXDeprecateAnalyticsFiltersEnums then nil elseif SelectCreatorFilterResult then UnifiedEventLogEnums.FiltersCreators.CREATORS_BY_USERNAME else UnifiedEventLogEnums.FiltersCreators.CREATORS_ALL,
			filterPriceEnumValue = if AXDeprecateAnalyticsFiltersEnums then nil elseif SelectMinPriceResult or SelectMaxPriceResult then UnifiedEventLogEnums.FiltersPrice.PRICE_RANGE else UnifiedEventLogEnums.FiltersPrice.PRICE_ANY,
			filterUnavailableItemsEnumValue = if AXDeprecateAnalyticsFiltersEnums then nil elseif IsSelectUnavailableItemFilterResultMatch then UnifiedEventLogEnums.FiltersUnavailableItems.UNAVAILABLE_ITEMS_SHOW else UnifiedEventLogEnums.FiltersUnavailableItems.UNAVAILABLE_ITEMS_HIDE,
			filterSalesType = if AXUpdateAnalyticsFiltersEnums then if SelectSalesTypeFilterResult == SalesTypeFilterModule.Collectibles then UnifiedEventLogEnums.FiltersSalesType.SALES_TYPE_LIMITED else UnifiedEventLogEnums.FiltersSalesType.SALES_TYPE_ALL else nil,
			filterCreatorsType = if AXUpdateAnalyticsFiltersEnums then if SelectCreatorFilterResult then UnifiedEventLogEnums.FiltersCreators.CREATORS_BY_USERNAME else UnifiedEventLogEnums.FiltersCreators.CREATORS_ALL else nil,
			filterPrice = if AXUpdateAnalyticsFiltersEnums then if SelectMinPriceResult or SelectMaxPriceResult then UnifiedEventLogEnums.FiltersPrice.PRICE_RANGE else UnifiedEventLogEnums.FiltersPrice.PRICE_ANY else nil,
			filterUnavailableItems = if AXUpdateAnalyticsFiltersEnums then if IsSelectUnavailableItemFilterResultMatch then UnifiedEventLogEnums.FiltersUnavailableItems.UNAVAILABLE_ITEMS_SHOW else UnifiedEventLogEnums.FiltersUnavailableItems.UNAVAILABLE_ITEMS_HIDE else nil,
			filterCreatorsName = SelectCreatorFilterResult or "",
			filterPriceMin = if SelectMinPriceResult then tostring(SelectMinPriceResult) else "",
			filterPriceMax = if SelectMaxPriceResult then tostring(SelectMaxPriceResult) else ""
		}))
		p1.applySortAndFilters({
			minPrice = SelectMinPriceResult,
			maxPrice = SelectMaxPriceResult,
			sortType = SelectCatalogSortResult,
			sortAggregation = SelectCatalogSortAggregationResult,
			salesTypeFilter = SelectSalesTypeFilterResult,
			creatorFilter = SelectCreatorFilterResult,
			includeOffSale = IsSelectUnavailableItemFilterResultMatch
		})
	end
end