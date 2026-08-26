return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { userId = p1, membershipType = p2 }
end)