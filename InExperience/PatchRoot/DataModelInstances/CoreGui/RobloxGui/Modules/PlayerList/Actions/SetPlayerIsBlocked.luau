return require(script.Parent.Parent.ActionCreator)("SetPlayerIsBlocked", function(Player: Player, IsBlocked) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		isBlocked = IsBlocked
	}
end)