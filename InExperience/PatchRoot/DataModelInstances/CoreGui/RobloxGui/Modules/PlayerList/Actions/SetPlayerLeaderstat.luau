return require(script.Parent.Parent.ActionCreator)("SetPlayerLeaderstat", function(Player: Player, Leaderstat, Value)
	return {
		player = Player,
		userId = Player.UserId,
		leaderstat = Leaderstat,
		value = Value
	}
end)