return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { userId = p0, membershipType = p1 }
end)