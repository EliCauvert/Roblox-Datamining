return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetTypeId, AssetId)
	return { assetTypeId = AssetTypeId, assetId = AssetId }
end)