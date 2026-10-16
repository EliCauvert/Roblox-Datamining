return require(script.Parent.Parent.ActionCreator)("RemovePlayerFromTeam", function(Player: Player, Team) --[[ Line: 4 ]]
	return { player = Player, userId = Player.UserId, team = Team }
end)