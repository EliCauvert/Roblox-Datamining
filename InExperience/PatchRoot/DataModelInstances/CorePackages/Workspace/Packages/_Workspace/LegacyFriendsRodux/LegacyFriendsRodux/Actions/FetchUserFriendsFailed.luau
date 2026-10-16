return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(UserId, Response) --[[ Line: 6 ]]
	return { userId = UserId, response = Response }
end)