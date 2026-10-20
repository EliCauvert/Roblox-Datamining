return require(script.Parent.Parent.ActionCreator)("SetPlayerFollowRelationship", function(Player: Player, IsFollower, IsFollowing)
	return {
		player = Player,
		userId = Player.UserId,
		isFollower = IsFollower,
		isFollowing = IsFollowing
	}
end)