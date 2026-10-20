return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(UserId)
	return { userId = UserId }
end)