local playersService = game:GetService("Players")

return function(p0)
	-- upvalues: playersService (ref)
	local var1, var2 = p0()
	
	if not var1 then return end
	if var2 then
		var2:Fire()
		
		return
	end
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local character = localPlayer.Character
		
		if character then
			local humanoid = character:FindFirstChild("Humanoid")
			
			if humanoid and humanoid:IsA("Humanoid") then
				humanoid.Health = 0
			end
		end
	end
end