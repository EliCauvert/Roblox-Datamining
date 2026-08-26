return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { lookId = p1 }
end)