local playersService = game:GetService("Players")

return function(p1)
	-- upvalues: playersService (ref)
	if not p1 then
		return nil
	end
	for i, v in pairs(playersService:GetPlayers()) do
		local character = v.Character
		
		if character and p1:IsDescendantOf(character) then
			return v
		end
	end
	return nil
end