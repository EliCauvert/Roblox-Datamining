return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { id = p1, isLeaving = p2 }
end)