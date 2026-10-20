return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(BundleId, BundleInfo)
	return { bundleId = BundleId, bundleInfo = BundleInfo }
end)