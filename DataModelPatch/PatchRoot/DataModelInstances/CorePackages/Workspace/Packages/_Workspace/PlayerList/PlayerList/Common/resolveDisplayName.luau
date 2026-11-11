return function(Player: Player)
	return if Player.DisplayName == nil or Player.DisplayName == "" then Player.Name else Player.DisplayName
end