return require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(UserId1, UserId2)
	return { payload = { userId1 = UserId1, userId2 = UserId2 } }
end)