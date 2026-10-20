return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SavedAccessories)
	return { savedAccessories = SavedAccessories }
end)