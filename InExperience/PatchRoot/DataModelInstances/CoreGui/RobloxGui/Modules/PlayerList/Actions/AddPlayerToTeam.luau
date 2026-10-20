return require(script.Parent.Parent.ActionCreator)("AddPlayerToTeam", function(Player: Player, Team)
	return { player = Player, userId = Player.UserId, team = Team }
end)