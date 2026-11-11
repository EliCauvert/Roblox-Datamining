return require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		hydratedBundles = p1.hydratedBundles,
		assetsInBundle = p1.assetsInBundle,
		hydratedAssets = p1.hydratedAssets
	}
end)