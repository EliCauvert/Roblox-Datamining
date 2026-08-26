return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { payload = { id = p1 } }
end)