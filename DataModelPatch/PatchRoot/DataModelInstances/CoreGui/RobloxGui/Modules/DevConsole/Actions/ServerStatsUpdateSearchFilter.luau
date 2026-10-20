return require(script.Parent.Parent.Action)("ServerStatsUpdateSearchFilter", function(SearchTerm, FilterTypes)
	return { searchTerm = SearchTerm, filterTypes = FilterTypes }
end)