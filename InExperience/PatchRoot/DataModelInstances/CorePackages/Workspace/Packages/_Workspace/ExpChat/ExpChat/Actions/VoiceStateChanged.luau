return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { userId = tostring(p1), newState = p2 }
end)