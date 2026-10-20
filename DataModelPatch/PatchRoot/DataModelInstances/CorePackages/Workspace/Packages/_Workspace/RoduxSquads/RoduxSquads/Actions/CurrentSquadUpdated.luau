return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(Squad)
	return { payload = { squad = Squad } }
end)