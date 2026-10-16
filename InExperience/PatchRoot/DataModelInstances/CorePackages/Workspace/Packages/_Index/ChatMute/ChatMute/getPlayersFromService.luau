return function(Text: string) --[[ Line: 7 | Named "getPlayersFromService" ]]
	local Players = game:GetService("Players")
	
	if not Text then
		return {}
	end
	local Lowered = string.lower(Text)
	
	if string.sub(Lowered, 1, 1) == "@" then
		local Segment = string.sub(Lowered, 2)
		
		for _, player in Players:GetPlayers() do
			if string.lower(player.Name) == Segment then
				return {
					{
						userId = tostring(player.UserId),
						username = player.Name,
						displayName = player.DisplayName
					}
				}
			end
		end
		return {}
	else
		local List = {}
		
		for _, player1 in Players:GetPlayers() do
			if string.lower(player1.DisplayName) == Lowered then
				table.insert(List, {
					userId = tostring(player1.UserId),
					username = player1.Name,
					displayName = player1.DisplayName
				})
			end
		end
		return List
	end
end