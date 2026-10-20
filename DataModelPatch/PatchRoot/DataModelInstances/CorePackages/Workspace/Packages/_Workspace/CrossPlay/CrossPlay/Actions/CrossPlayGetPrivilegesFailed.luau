return require(script:FindFirstAncestor("CrossPlay").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { error = p1 }
end)