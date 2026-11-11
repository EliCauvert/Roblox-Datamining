return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(CurrentSort)
	return { currentSort = CurrentSort }
end)