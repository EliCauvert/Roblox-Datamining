return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(UserId, Response)
	return { userId = UserId, response = Response }
end)