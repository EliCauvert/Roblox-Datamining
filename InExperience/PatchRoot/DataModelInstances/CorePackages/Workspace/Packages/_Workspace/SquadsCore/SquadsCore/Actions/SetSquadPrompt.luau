return require(script:FindFirstAncestor("SquadsCore").Parent.Rodux).makeActionCreator(script.Name, function(Arguments)
	return { arguments = Arguments }
end)