local playersService = game:GetService("Players")

return function(p0) --[[ line: 4 | named "getPlayerFromPart" ]]
	-- upvalues: playersService (ref)
	if not p0 then
		return nil
	end
	for i, v in pairs(playersService:GetPlayers()) do
		local character = v.Character
		
		if character and p0:IsDescendantOf(character) then
			return v
		end
	end
	return nil
end