return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2) --[[ line: 6 ]]
	return { userId = tostring(p0), presence = p1, lastLocation = p2 }
end)