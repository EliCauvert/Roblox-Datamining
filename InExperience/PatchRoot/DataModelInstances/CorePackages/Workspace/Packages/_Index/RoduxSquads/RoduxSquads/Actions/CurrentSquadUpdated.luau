return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(Squad) --[[ Line: 5 ]]
	return { payload = { squad = Squad } }
end)