return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { payload = p0 }
end)