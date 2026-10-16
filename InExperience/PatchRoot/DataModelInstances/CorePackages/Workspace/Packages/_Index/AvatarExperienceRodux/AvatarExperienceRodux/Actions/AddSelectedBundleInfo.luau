return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(BundleId, BundleInfo) --[[ Line: 13 ]]
	return { bundleId = BundleId, bundleInfo = BundleInfo }
end)