local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local DefaultFilters = require(Modules.AvatarExperience.Catalog.CatalogConstants).DefaultFilters

return function(p1): number
	-- upvalues: DefaultFilters (copy)
	local SortAndFilters = p1.AvatarExperience.Catalog.SortAndFilters
	local Count = 0
	
	if SortAndFilters.PriceRange.minPrice ~= DefaultFilters.PriceRange.minPrice or SortAndFilters.PriceRange.maxPrice ~= DefaultFilters.PriceRange.maxPrice then
		Count += 1
	end
	if SortAndFilters.SalesTypeFilter ~= DefaultFilters.SalesTypeFilter then
		Count += 1
	end
	if SortAndFilters.CreatorFilter ~= DefaultFilters.CreatorFilter then
		Count += 1
	end
	if SortAndFilters.UnavailableItemFilter ~= DefaultFilters.UnavailableItemFilter then
		Count += 1
	end
	if SortAndFilters.CatalogSort ~= DefaultFilters.CatalogSort then
		Count += 1
	end
	return Count
end