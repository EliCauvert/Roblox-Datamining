return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return { position = p1, rotation = p2, scale = p3, itemId = p4 }
end)