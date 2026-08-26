return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { userId = p1, isFriend = p2 }
end)