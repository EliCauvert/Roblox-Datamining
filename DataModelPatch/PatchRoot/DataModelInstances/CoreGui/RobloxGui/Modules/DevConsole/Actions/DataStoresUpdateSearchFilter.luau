return require(script.Parent.Parent.Action)("DataStoresUpdateSearchFilter", function(SearchTerm, FilterTypes)
	return { searchTerm = SearchTerm, filterTypes = FilterTypes }
end)