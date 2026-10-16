return require(script.Parent.Parent.ActionCreator)("SetPlayerIsCreator", function(Player: Player, IsCreator) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		isCreator = IsCreator
	}
end)