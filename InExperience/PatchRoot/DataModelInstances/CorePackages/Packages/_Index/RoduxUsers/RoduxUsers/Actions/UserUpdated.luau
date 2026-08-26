return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { payload = p1 }
end)