return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetId, BundleIds) --[[ Line: 4 ]]
	return { assetId = AssetId, bundleIds = BundleIds }
end)