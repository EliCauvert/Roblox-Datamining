return function(p1, p2) --[[ Line: 1 ]]
	return if p2 then Enum.FriendStatus.FriendRequestReceived elseif p1 then p1 else Enum.FriendStatus.NotFriend
end