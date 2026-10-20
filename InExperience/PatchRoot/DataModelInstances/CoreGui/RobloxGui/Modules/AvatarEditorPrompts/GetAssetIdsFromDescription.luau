local list = {
	"ClimbAnimation", "Face", "FallAnimation", "GraphicTShirt", "Head",
	"IdleAnimation", "JumpAnimation", "LeftArm", "LeftLeg", "Pants", "RightArm",
	"RightLeg", "RunAnimation", "Shirt", "SwimAnimation", "Torso", "WalkAnimation"
}

return function(Humanoid: Humanoid)
	-- upvalues: list (copy)
	local List = {}
	
	for _, value in ipairs(list) do
		local HumanoidEntry = Humanoid[value]
		
		if typeof(HumanoidEntry) == "number" and HumanoidEntry > 0 then
			table.insert(List, HumanoidEntry)
		elseif typeof(HumanoidEntry) == "string" and HumanoidEntry ~= "" then
			for i in HumanoidEntry:gmatch("([%d]+),?") do
				table.insert(List, (tonumber(i)))
			end
		end
	end
	for _, accessory in ipairs((Humanoid:GetAccessories(true))) do
		table.insert(List, accessory.AssetId)
	end
	for _, MakeupDescription in Humanoid:GetChildren() do
		if MakeupDescription:IsA("MakeupDescription") and MakeupDescription.AssetId > 0 then
			table.insert(List, MakeupDescription.AssetId)
		end
	end
	local Emotes = Humanoid:GetEmotes()
	
	for _, equippedEmote in ipairs((Humanoid:GetEquippedEmotes())) do
		local Emote = Emotes[equippedEmote.Name]
		
		if Emote then
			for _, value1 in ipairs(Emote) do
				table.insert(List, value1)
			end
		end
	end
	return List
end