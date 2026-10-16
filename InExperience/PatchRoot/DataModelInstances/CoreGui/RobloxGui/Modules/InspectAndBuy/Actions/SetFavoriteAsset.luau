return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Id, IsFavorite) --[[ Line: 4 ]]
	return { id = Id, isFavorite = IsFavorite }
end)