return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { lookId = p1, assetIds = p2, bundleIds = p3 }
end)