return require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 16 ]]
	return {
		hydratedBundles = p0.hydratedBundles,
		assetsInBundle = p0.assetsInBundle,
		hydratedAssets = p0.hydratedAssets
	}
end)