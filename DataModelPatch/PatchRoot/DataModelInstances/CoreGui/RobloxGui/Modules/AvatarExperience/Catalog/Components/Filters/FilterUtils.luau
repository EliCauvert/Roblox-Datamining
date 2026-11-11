local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local SortTypeModule = require(Modules.AvatarExperience.Common.Enum.SortType)
local _ = require(Modules.AvatarExperience.Common.Enum.SortAggregation)
local _ = require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)
local _ = require(Modules.AvatarExperience.Common.Types)
local FilterUtils = {
	mapHeightToSize = function(YOffset): UDim2
		return UDim2.new(1, 0, 0, YOffset)
	end,
	selectCatalogSort = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.CatalogSort
	end,
	selectCatalogSortAggregation = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation
	end,
	selectSalesTypeFilter = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter
	end,
	selectCreatorFilter = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.CreatorFilter
	end,
	selectWearTimeFilter = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter
	end,
	selectUnavailableItemFilter = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter
	end,
	selectMinPrice = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice
	end,
	selectMaxPrice = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice
	end,
	selectSortAndFilters = function(p1)
		return p1.AvatarExperience.Catalog.SortAndFilters
	end
}
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(Bestselling, p1, p2, Text, Text1, Text2, List, p3): string
	-- upvalues: SortTypeModule (copy)
	local IsBestsellingMatch: boolean = Bestselling == SortTypeModule.MostFavorited or Bestselling == SortTypeModule.Bestselling
	
	return Bestselling .. "," .. (if IsBestsellingMatch then p1 else "") .. "," .. p2.minPrice .. "," .. p2.maxPrice .. "," .. Text .. "," .. Text1 .. "," .. Text2 .. "," .. table.concat(List, "-") .. "," .. (p3 or "")
end)

function FilterUtils.selectSortAndFiltersKey(p1)
	-- upvalues: FilterUtils (copy)
	return FilterUtils.buildSortAndFiltersKeyFromSortAndFilters(p1.AvatarExperience.Catalog.SortAndFilters)
end

function FilterUtils.buildSortAndFiltersKeyFromSortAndFilters(SortAndFilters)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(SortAndFilters.CatalogSort, SortAndFilters.CatalogSortAggregation, SortAndFilters.PriceRange, SortAndFilters.SalesTypeFilter, SortAndFilters.CreatorFilter, SortAndFilters.UnavailableItemFilter, SortAndFilters.SelectedTopics, SortAndFilters.WearTimeFilter)
end

function FilterUtils.areSortAndFiltersEqual(p1, p2): boolean
	-- upvalues: FilterUtils (copy)
	return FilterUtils.buildSortAndFiltersKeyFromSortAndFilters(p1) == FilterUtils.buildSortAndFiltersKeyFromSortAndFilters(p2)
end

return FilterUtils