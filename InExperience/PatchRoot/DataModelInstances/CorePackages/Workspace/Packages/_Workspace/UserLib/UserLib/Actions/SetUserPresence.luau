return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { userId = tostring(p0), presence = p1, lastLocation = p2 }
end)