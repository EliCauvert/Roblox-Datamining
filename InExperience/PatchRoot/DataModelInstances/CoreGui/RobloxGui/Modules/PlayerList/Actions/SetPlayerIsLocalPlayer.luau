return require(script.Parent.Parent.ActionCreator)("SetPlayerIsLocalPlayer", function(Player: Player, IsLocalPlayer) --[[ Line: 4 ]]
	return {
		player = Player,
		userId = Player.UserId,
		isLocalPlayer = IsLocalPlayer
	}
end)