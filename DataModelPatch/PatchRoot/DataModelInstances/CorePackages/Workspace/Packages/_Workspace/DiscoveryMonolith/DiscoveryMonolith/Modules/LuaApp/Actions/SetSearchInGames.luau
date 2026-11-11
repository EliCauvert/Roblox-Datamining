return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(SearchUuid, SearchInGames)
	return { searchUuid = SearchUuid, searchInGames = SearchInGames }
end)