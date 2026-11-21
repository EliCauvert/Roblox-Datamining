local Players = game:GetService("Players")

return function(Callback)
	-- upvalues: Players (copy)
	local CallbackResult, CallbackResult2 = Callback()
	
	if not CallbackResult then return end
	if CallbackResult2 then
		CallbackResult2:Fire()
		
		return
	end
	local LocalPlayer = Players.LocalPlayer
	local Character = if LocalPlayer then LocalPlayer.Character else nil
	
	if Character then
		local Humanoid = Character:FindFirstChild("Humanoid")
		
		if Humanoid and Humanoid:IsA("Humanoid") then
			Humanoid.Health = 0
		end
	end
end