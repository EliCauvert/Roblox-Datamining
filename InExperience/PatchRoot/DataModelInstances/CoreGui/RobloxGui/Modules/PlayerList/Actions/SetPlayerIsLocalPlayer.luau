return require(script.Parent.Parent.ActionCreator)("SetPlayerIsLocalPlayer", function(Player: Player, IsLocalPlayer)
	return {
		player = Player,
		userId = Player.UserId,
		isLocalPlayer = IsLocalPlayer
	}
end)