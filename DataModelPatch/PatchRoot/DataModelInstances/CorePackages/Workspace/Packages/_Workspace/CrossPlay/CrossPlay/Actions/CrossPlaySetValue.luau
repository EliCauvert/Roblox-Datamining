return require(script:FindFirstAncestor("CrossPlay").Parent.Rodux).makeActionCreator(script.Name, function(CrossPlayValue)
	return { crossPlayValue = CrossPlayValue }
end)