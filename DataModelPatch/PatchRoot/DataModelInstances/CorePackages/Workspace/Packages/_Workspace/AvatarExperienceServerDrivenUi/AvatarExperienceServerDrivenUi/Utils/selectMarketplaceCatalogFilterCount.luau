return function(p1): number
	local Catalog = p1 and (p1.AvatarExperience and p1.AvatarExperience.Catalog)
	local SortAndFilters = Catalog and Catalog.SortAndFilters
	
	if not SortAndFilters then
		return 0
	end
	local Count = 0
	local PriceRange = SortAndFilters.PriceRange
	
	if PriceRange and (PriceRange.minPrice ~= 0 or PriceRange.maxPrice ~= 2147483647) then
		Count += 1
	end
	if SortAndFilters.SalesTypeFilter ~= "All" then
		Count += 1
	end
	if SortAndFilters.CreatorFilter ~= "" then
		Count += 1
	end
	if SortAndFilters.UnavailableItemFilter ~= "Hide" then
		Count += 1
	end
	if SortAndFilters.CatalogSort ~= "Relevance" then
		Count += 1
	end
	return Count
end