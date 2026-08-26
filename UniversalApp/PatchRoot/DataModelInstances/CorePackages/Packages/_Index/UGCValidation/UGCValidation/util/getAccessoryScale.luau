local playersService = game:GetService("Players")
local humanoidParentNil = game:DefineFastFlag("HumanoidParentNil", false)
local t = {}
local var1 = nil
local humanoid = nil

if not humanoidParentNil then
	var1 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else playersService:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	humanoid = var1:FindFirstChildOfClass("Humanoid")
	assert(humanoid, "Humanoid must exist in character model")
	local bodyProportionScale = humanoid:FindFirstChild("BodyProportionScale")
	humanoid:FindFirstChild("BodyTypeScale").Value = 0
	bodyProportionScale.Value = 0
	
	for i, v in pairs(var1:GetDescendants()) do
		if v:IsA("BasePart") then
			for i_1, v_1 in v:GetChildren() do
				if v_1:IsA("Attachment") then
					t[v_1.Name] = humanoid:GetBodyPartR15(v)
				end
			end
		end
	end
end
return function(p1, p2)
	-- upvalues: humanoidParentNil (ref), var1 (write), playersService (ref), humanoid (write), t (ref)
	if humanoidParentNil and var1 == nil then
		var1 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else playersService:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
		humanoid = var1:FindFirstChildOfClass("Humanoid")
		assert(humanoid, "Humanoid must exist in character model")
		local bodyProportionScale = humanoid:FindFirstChild("BodyProportionScale")
		humanoid:FindFirstChild("BodyTypeScale").Value = 0
		bodyProportionScale.Value = 0
		
		for i, v in pairs(var1:GetDescendants()) do
			if v:IsA("BasePart") then
				for i_1, v_1 in v:GetChildren() do
					if v_1:IsA("Attachment") then
						t[v_1.Name] = humanoid:GetBodyPartR15(v)
					end
				end
			end
		end
	end
	return if humanoid == nil then Vector3.new(1, 1, 1) else humanoid:GetAccessoryHandleScale(p1, t[p2.Name])
end