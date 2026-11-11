return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SearchText)
	return { searchText = SearchText }
end)