return require(script.Parent.Parent.ActionCreator)("RemovePlayer", function(Player: Player)
	return { player = Player, userId = Player.UserId }
end)