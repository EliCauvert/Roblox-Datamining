local list = {
	"ClimbAnimation", "Face", "FallAnimation", "GraphicTShirt", "Head",
	"IdleAnimation", "JumpAnimation", "LeftArm", "LeftLeg", "Pants", "RightArm",
	"RightLeg", "RunAnimation", "Shirt", "SwimAnimation", "Torso", "WalkAnimation"
}

return function(p0)
	-- upvalues: list (ref)
	local v_1
	local t = {}
	
	for i, v in ipairs(list) do
		v_1 = p0[v]
		
		if typeof(v_1) == "number" and v_1 > 0 then
			table.insert(t, v_1)
		elseif typeof(v_1) == "string" and v_1 ~= "" then
			for i_1 in v_1:gmatch("([%d]+),?") do
				table.insert(t, tonumber(i_1))
			end
		end
	end
	for i_1, v_1 in ipairs(p0:GetAccessories(true)) do
		table.insert(t, v_1.AssetId)
	end
	for v_1, v_2 in p0:GetChildren() do
		if v_2:IsA("MakeupDescription") and v_2.AssetId > 0 then
			table.insert(t, v_2.AssetId)
		end
	end
	local emotes = p0:GetEmotes()
	
	for i_3, v_3 in ipairs(p0:GetEquippedEmotes()) do
		local name = emotes[v_3.Name]
		
		if name then
			for i_4, v_4 in ipairs(name) do
				table.insert(t, v_4)
			end
		end
	end
	return t
end