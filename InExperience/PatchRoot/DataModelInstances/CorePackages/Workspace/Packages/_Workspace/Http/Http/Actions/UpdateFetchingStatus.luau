return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { key = p0, status = p1 }
end)