return require(script.Parent.Parent.Action)("ClientLogUpdateSearchFilter", function(SearchTerm, FilterTypes)
	return { searchTerm = SearchTerm, filterTypes = FilterTypes }
end)