return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(LookId, AssetIds, BundleIds)
	return {
		lookId = LookId,
		assetIds = AssetIds,
		bundleIds = BundleIds
	}
end)