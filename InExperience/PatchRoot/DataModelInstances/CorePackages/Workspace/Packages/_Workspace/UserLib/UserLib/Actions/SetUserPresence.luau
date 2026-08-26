return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { userId = tostring(p1), presence = p2, lastLocation = p3 }
end)