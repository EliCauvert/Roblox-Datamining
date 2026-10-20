return require(script.Parent.Parent.ActionCreator)("SetPlayerIsBlocked", function(Player: Player, IsBlocked)
	return {
		player = Player,
		userId = Player.UserId,
		isBlocked = IsBlocked
	}
end)