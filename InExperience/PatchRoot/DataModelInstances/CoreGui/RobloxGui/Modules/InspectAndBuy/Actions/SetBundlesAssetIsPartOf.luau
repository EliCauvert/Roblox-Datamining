return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetId, BundleIds)
	return { assetId = AssetId, bundleIds = BundleIds }
end)