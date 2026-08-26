return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { payload = { experienceInvite = p1 } }
end)