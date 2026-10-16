return require(script.Parent.Parent.ActionCreator)("AddPlayer", function(Player: Player) --[[ Line: 4 ]]
	return { player = Player, userId = Player.UserId }
end)