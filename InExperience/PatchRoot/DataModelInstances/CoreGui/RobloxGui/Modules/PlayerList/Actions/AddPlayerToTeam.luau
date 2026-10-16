return require(script.Parent.Parent.ActionCreator)("AddPlayerToTeam", function(Player: Player, Team) --[[ Line: 4 ]]
	return { player = Player, userId = Player.UserId, team = Team }
end)