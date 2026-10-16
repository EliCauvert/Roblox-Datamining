local Players = game:GetService("Players")

return function(Callback) --[[ Line: 9 | Named "respawnAvatar" ]]
	-- upvalues: Players (copy)
	local CallbackResult, CallbackResult2 = Callback()
	
	if not CallbackResult then return end
	if CallbackResult2 then
		CallbackResult2:Fire()
		
		return
	end
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		local Character = LocalPlayer.Character
		
		if Character then
			local Humanoid = Character:FindFirstChild("Humanoid")
			
			if Humanoid and Humanoid:IsA("Humanoid") then
				Humanoid.Health = 0
			end
		end
	end
end