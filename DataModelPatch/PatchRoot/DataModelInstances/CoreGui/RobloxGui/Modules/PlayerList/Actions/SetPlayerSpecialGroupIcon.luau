return require(script.Parent.Parent.ActionCreator)("SetPlayerSpecialGroupIcon", function(Player: Player, SpecialGroupIcon)
	return {
		player = Player,
		userId = Player.UserId,
		specialGroupIcon = SpecialGroupIcon
	}
end)