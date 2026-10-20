return require(script.Parent.Parent.ActionCreator)("RemovePlayerFromTeam", function(Player: Player, Team)
	return { player = Player, userId = Player.UserId, team = Team }
end)