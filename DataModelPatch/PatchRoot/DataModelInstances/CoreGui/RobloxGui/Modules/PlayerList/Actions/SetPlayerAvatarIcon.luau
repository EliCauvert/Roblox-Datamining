return require(script.Parent.Parent.ActionCreator)("SetPlayerAvatarIcon", function(Player: Player, AvatarIcon)
	return {
		player = Player,
		userId = Player.UserId,
		avatarIcon = AvatarIcon
	}
end)