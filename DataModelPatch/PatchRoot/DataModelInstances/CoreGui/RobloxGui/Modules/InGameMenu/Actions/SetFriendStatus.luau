return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_FRIEND_STATUS", function(UserId, FriendStatus)
	return { userId = UserId, friendStatus = FriendStatus }
end)