local playersService = game:GetService("Players")

return function(p1, p2)
	-- upvalues: playersService (ref)
	if not p1 or not p1.participants then
		return 0
	end
	local var1 = playersService:GetPlayerByUserId(tonumber(p2))
	
	if not var1 or not var1.Character or not var1.Character.PrimaryPart then
		return 0
	end
	local position = var1.Character.PrimaryPart.Position
	local var2 = 0
	
	for i in pairs(p1.participants) do
		local var3 = tonumber(i)
		
		if var3 and var3 ~= var1.UserId then
			local var4 = playersService:GetPlayerByUserId(var3)
			
			if var4 and var4.Character and (var4.Character.PrimaryPart and (var4.Character.PrimaryPart.Position - position).Magnitude <= 160) then
				var2 += 1
			end
		end
	end
	return var2
end