return function(p1, p2)
	return if p2 then Enum.FriendStatus.FriendRequestReceived else p1 or Enum.FriendStatus.NotFriend
end