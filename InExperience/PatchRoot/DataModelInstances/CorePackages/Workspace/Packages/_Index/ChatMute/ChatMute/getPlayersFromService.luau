return function(p0)
	local playersService = game:GetService("Players")
	
	if not p0 then
		return {}
	end
	local substring
	local lowerText = string.lower(p0)
	
	if string.sub(lowerText, 1, 1) == "@" then
		substring = string.sub(lowerText, 2)
		
		for i, v in playersService:GetPlayers() do
			if string.lower(v.Name) == substring then
				return {
					{
						userId = tostring(v.UserId),
						username = v.Name,
						displayName = v.DisplayName
					}
				}
			end
		end
		return {}
	else
		substring = {}
		
		for i, v in playersService:GetPlayers() do
			if string.lower(v.DisplayName) == lowerText then
				table.insert(substring, {
					userId = tostring(v.UserId),
					username = v.Name,
					displayName = v.DisplayName
				})
			end
		end
		return substring
	end
end