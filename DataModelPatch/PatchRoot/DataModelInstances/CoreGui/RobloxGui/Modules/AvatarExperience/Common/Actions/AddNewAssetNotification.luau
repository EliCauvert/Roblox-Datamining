return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetTypeId)
	return { assetTypeId = AssetTypeId }
end)