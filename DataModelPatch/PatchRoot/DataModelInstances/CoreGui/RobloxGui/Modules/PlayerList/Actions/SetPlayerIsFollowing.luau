return require(script.Parent.Parent.ActionCreator)("SetPlayerIsFollowing", function(Player: Player, IsFollowing)
	return {
		player = Player,
		userId = Player.UserId,
		isFollowing = IsFollowing
	}
end)