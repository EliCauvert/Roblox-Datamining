return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { itemId = p0, outfitId = p1 }
end)