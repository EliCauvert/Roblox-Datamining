return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { lookId = p0, assetIds = p1, bundleIds = p2 }
end)