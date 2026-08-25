return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { bundleId = p0, bundleInfo = p1 }
end)