return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ViewingDetails, AssetId)
	return { viewingDetails = ViewingDetails, assetId = AssetId }
end)