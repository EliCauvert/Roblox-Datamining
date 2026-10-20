return require(script.Parent.Parent.ActionCreator)("SetPlayerIsCreator", function(Player: Player, IsCreator)
	return {
		player = Player,
		userId = Player.UserId,
		isCreator = IsCreator
	}
end)