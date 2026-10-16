return require(script.Parent.Parent.ActionCreator)("SetPlayerSpecialGroupIcon", function(Player: Player, SpecialGroupIcon) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		specialGroupIcon = SpecialGroupIcon
	}
end)