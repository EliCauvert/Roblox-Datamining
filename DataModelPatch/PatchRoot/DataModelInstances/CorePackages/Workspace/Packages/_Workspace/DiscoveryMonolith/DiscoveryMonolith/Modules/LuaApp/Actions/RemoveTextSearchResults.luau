return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(SearchUuid)
	return { searchUuid = SearchUuid }
end)