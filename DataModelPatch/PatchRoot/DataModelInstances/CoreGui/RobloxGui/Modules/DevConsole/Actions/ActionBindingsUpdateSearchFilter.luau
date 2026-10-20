return require(script.Parent.Parent.Action)("ActionBindingsUpdateSearchFilter", function(SearchTerm)
	return { searchTerm = SearchTerm }
end)