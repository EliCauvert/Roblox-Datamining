return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { itemId = p1, outfitId = p2 }
end)