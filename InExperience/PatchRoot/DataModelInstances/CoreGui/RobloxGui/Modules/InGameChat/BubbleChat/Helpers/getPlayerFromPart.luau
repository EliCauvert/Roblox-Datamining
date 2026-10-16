local Players = game:GetService("Players")

return function(Object) --[[ Line: 4 | Named "getPlayerFromPart" ]]
	-- upvalues: Players (copy)
	if not Object then
		return nil
	end
	for _, player in pairs(Players:GetPlayers()) do
		local Character = player.Character
		
		if Character and Object:IsDescendantOf(Character) then
			return player
		end
	end
	return nil
end