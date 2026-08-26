return require(script:FindFirstAncestor("RoduxCall").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { payload = { call = p1 } }
end)