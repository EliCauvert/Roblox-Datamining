return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(UserId1, UserId2) --[[ Line: 5 ]]
	return { payload = { userId1 = UserId1, userId2 = UserId2 } }
end)