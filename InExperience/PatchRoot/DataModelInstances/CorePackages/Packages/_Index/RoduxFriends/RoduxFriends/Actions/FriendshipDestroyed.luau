return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 5 ]]
	return { payload = { userId1 = p0, userId2 = p1 } }
end)