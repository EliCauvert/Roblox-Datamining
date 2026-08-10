local playersService = game:GetService("Players")

return {
	createDefaultCharacter = function(p0) --[[ line: 5 ]]
		-- upvalues: playersService (ref)
		local var1 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
		
		for i, v in var1:GetDescendants() do
			if v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("MeshPart") then
				v.Transparency = 0
				v.CanCollide = false
			elseif v:IsA("Motor6D") and p0 then
				v:Destroy()
			end
		end
		return var1
	end
}