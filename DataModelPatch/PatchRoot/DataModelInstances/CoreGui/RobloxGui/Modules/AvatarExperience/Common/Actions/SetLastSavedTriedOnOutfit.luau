return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SavedOutfit)
	return { savedOutfit = SavedOutfit }
end)