return require(script.Parent.Parent.ActionCreator)("SetPlayerLeaderstat", function(Player: Player, Leaderstat, Value) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		leaderstat = Leaderstat,
		value = Value
	}
end)