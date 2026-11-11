return function(p1)
	return if p1 == "NotFriends" then Enum.FriendStatus.NotFriend elseif p1 == "Friends" then Enum.FriendStatus.Friend elseif p1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif p1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
end