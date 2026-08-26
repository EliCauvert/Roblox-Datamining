return require(script:FindFirstAncestor("SquadsCore").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { arguments = p1 }
end)