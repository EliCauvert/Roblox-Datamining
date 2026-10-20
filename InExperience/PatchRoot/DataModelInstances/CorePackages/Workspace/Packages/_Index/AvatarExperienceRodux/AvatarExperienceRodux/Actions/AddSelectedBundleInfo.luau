return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(BundleId, BundleInfo)
	return { bundleId = BundleId, bundleInfo = BundleInfo }
end)