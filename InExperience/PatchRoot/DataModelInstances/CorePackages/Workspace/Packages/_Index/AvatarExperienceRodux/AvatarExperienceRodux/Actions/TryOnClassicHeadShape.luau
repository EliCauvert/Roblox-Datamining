return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(HeadShape)
	return { headShape = HeadShape }
end)