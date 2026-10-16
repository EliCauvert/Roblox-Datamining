return require(script.Parent.Parent.ActionCreator)("SetPlayerIsFollowing", function(Player: Player, IsFollowing) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		isFollowing = IsFollowing
	}
end)