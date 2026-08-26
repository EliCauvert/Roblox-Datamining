return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { bundleId = p1, bundleInfo = p2 }
end)