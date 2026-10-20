return require(script.Parent.Parent.ActionCreator)("SetPlayerFriendStatus", function(Player: Player, FriendStatus)
	return {
		player = Player,
		userId = Player.UserId,
		friendStatus = FriendStatus
	}
end)