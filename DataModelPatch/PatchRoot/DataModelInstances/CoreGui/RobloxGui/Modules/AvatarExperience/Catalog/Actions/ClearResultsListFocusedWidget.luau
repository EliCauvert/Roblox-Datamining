return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid)
	return { searchUuid = SearchUuid }
end)