local function v0(Character): boolean
	local Humanoid = Character.Humanoid
	
	if not Humanoid then
		return false
	end
	for _, accessory in Humanoid:GetAccessories() do
		local MeshPart = accessory:FindFirstChildWhichIsA("MeshPart")
		
		if MeshPart and MeshPart:FindFirstChild("HairAttachment") and MeshPart:FindFirstChildWhichIsA("WrapLayer") then
			return true
		end
	end
	return false
end

return function(p1)
	-- upvalues: v0 (copy)
	local CurrentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter
	
	return if CurrentCharacter then v0(CurrentCharacter) else false
end