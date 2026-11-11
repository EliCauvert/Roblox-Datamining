return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(EquippedAssets)
	return { equippedAssets = EquippedAssets }
end)