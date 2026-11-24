local FFlagPYMKViewProfileAfterAcceptModule = require(script.Parent.Parent.Flags.FFlagPYMKViewProfileAfterAccept)

return function(FriendStatus, p1)
	-- upvalues: FFlagPYMKViewProfileAfterAcceptModule (copy)
	return if FFlagPYMKViewProfileAfterAcceptModule and FriendStatus == Enum.FriendStatus.Friend then Enum.FriendStatus.Friend elseif p1 then Enum.FriendStatus.FriendRequestReceived elseif FriendStatus then FriendStatus else Enum.FriendStatus.NotFriend
end