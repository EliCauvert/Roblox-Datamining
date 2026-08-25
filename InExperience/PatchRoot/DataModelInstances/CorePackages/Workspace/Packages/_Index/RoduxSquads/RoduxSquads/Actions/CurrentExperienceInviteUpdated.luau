return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { payload = { experienceInvite = p0 } }
end)