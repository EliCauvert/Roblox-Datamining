return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(SearchUuid, Status)
	return { searchUuid = SearchUuid, status = Status }
end)