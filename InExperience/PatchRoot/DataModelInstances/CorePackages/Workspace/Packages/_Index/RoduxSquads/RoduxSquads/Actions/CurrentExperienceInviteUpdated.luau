return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(ExperienceInvite) --[[ Line: 5 ]]
	return { payload = { experienceInvite = ExperienceInvite } }
end)