return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(ExperienceInvite)
	return { payload = { experienceInvite = ExperienceInvite } }
end)