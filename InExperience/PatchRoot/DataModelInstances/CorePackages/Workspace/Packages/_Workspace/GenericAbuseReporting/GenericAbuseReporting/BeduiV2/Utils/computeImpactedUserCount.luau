local Players = game:GetService("Players")

return function(p1, p2): number --[[ Line: 11 | Named "computeImpactedUserCount" ]]
	-- upvalues: Players (copy)
	if not p1 or not p1.participants then
		return 0
	end
	local Player = Players:GetPlayerByUserId((tonumber(p2)))
	
	if not Player or not Player.Character or not Player.Character.PrimaryPart then
		return 0
	end
	local Position = Player.Character.PrimaryPart.Position
	local Count = 0
	
	for participant in pairs(p1.participants) do
		local Number: number? = tonumber(participant)
		
		if Number and Number ~= Player.UserId then
			local Player1 = Players:GetPlayerByUserId(Number)
			
			if Player1 and Player1.Character and Player1.Character.PrimaryPart and (Player1.Character.PrimaryPart.Position - Position).Magnitude <= 160 then
				Count += 1
			end
		end
	end
	return Count
end