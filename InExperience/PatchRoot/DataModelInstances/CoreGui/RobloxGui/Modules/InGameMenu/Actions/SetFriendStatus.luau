return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_FRIEND_STATUS", function(UserId, FriendStatus) --[[ Line: 5 ]]
	return { userId = UserId, friendStatus = FriendStatus }
end)