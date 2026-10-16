return function(Player: Player) --[[ Line: 1 | Named "resolveDisplayName" ]]
	return if Player.DisplayName == nil or Player.DisplayName == "" then Player.Name else Player.DisplayName
end