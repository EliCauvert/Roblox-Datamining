return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid, Keyword)
	return { searchUuid = SearchUuid, keyword = Keyword }
end)