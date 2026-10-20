return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(OutfitId)
	return { outfitId = OutfitId }
end)