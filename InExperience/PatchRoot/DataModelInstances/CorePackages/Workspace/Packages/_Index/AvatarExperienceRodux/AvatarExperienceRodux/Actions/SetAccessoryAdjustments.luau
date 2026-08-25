return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3)
	return { position = p0, rotation = p1, scale = p2, itemId = p3 }
end)