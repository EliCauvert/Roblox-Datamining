return require(script.Parent.Parent.ActionCreator)("SetPlayerFriendStatus", function(Player: Player, FriendStatus) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		friendStatus = FriendStatus
	}
end)