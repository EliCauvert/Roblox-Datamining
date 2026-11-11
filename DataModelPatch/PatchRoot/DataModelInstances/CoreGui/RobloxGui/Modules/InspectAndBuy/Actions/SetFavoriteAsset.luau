return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Id, IsFavorite)
	return { id = Id, isFavorite = IsFavorite }
end)