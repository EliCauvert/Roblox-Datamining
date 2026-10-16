return require(script.Parent.Parent.ActionCreator)("SetPlayerAvatarIcon", function(Player: Player, AvatarIcon) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		avatarIcon = AvatarIcon
	}
end)