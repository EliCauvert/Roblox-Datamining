return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid, Status)
	return { searchUuid = SearchUuid, status = Status }
end)