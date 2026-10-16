return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetId, BundleInfo) --[[ Line: 4 ]]
	return { assetId = AssetId, bundleInfo = BundleInfo }
end)