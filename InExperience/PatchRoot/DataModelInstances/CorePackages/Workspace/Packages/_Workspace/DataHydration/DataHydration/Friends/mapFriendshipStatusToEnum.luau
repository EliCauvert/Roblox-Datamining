return function(p0)
	return if p0 == "NotFriends" then Enum.FriendStatus.NotFriend elseif p0 == "Friends" then Enum.FriendStatus.Friend elseif p0 == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif p0 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
end