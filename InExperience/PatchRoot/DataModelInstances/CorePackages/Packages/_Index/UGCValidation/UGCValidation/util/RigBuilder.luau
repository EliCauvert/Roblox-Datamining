local Players = game:GetService("Players")

return {
	createDefaultCharacter = function(p1) --[[ Line: 5 ]]
		-- upvalues: Players (copy)
		local HumanoidModelFromDescriptionAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
		for _, descendant in HumanoidModelFromDescriptionAsync:GetDescendants() do
			if descendant:IsA("Decal") then
				descendant.Transparency = 1
			elseif descendant:IsA("MeshPart") then
				descendant.Transparency = 0
				descendant.CanCollide = false
			elseif descendant:IsA("Motor6D") and p1 then
				descendant:Destroy()
			end
		end
		return HumanoidModelFromDescriptionAsync
	end
}