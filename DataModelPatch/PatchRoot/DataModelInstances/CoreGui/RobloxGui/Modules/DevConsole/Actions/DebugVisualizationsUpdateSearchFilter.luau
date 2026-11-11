return require(script.Parent.Parent.Action)("DebugVisualizationsUpdateSearchFilter", function(SearchTerm, FilterTypes)
	return { searchTerm = SearchTerm, filterTypes = FilterTypes }
end)