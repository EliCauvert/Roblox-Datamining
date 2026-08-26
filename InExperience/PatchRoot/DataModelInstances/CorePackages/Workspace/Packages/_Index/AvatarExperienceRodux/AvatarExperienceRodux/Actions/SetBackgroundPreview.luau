return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { previewKey = p1 }
end)