return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid, SearchInCatalog)
	return {
		searchUuid = SearchUuid,
		searchInCatalog = SearchInCatalog
	}
end)