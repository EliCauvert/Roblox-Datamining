return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetId, BundleInfo)
	return { assetId = AssetId, bundleInfo = BundleInfo }
end)