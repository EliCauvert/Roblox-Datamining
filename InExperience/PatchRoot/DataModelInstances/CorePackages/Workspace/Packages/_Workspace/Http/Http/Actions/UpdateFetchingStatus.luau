return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { key = p1, status = p2 }
end)