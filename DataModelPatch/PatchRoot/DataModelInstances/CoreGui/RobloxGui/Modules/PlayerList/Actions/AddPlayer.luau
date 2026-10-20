return require(script.Parent.Parent.ActionCreator)("AddPlayer", function(Player: Player)
	return { player = Player, userId = Player.UserId }
end)