return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { payload = { userId1 = p1, userId2 = p2 } }
end)