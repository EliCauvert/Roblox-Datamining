return require(script:FindFirstAncestor("RoduxCall").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { payload = { call = p0 } }
end)