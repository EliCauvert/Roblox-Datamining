return require(script.Parent.Parent.Action)("ServerJobsUpdateSearchFilter", function(SearchTerm, FilterTypes)
	return { searchTerm = SearchTerm, filterTypes = FilterTypes }
end)