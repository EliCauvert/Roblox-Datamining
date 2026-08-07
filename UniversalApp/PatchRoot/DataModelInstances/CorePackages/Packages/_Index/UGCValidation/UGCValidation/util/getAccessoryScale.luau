local playersService = game:GetService("Players")
local humanoidParentNil = game:DefineFastFlag("HumanoidParentNil", false)
local t = {}
local var3 = nil
local humanoid = nil

if not humanoidParentNil then
	var3 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else playersService:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	humanoid = var3:FindFirstChildOfClass("Humanoid")
	assert(humanoid, "Humanoid must exist in character model")
	local bodyProportionScale = humanoid:FindFirstChild("BodyProportionScale")
	humanoid:FindFirstChild("BodyTypeScale").Value = 0
	bodyProportionScale.Value = 0
	
	for i, v in pairs(var3:GetDescendants()) do
		if v:IsA("BasePart") then
			for i_1, v_1 in v:GetChildren() do
				if v_1:IsA("Attachment") then
					t[v_1.Name] = humanoid:GetBodyPartR15(v)
				end
			end
		end
	end
end
return function(p0, p1) --[[ line: 43 ]]
	-- upvalues: humanoidParentNil (ref), var3 (write), playersService (ref), humanoid (write), t (ref)
	if humanoidParentNil and var3 == nil then
		var3 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else playersService:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
		humanoid = var3:FindFirstChildOfClass("Humanoid")
		assert(humanoid, "Humanoid must exist in character model")
		local bodyProportionScale = humanoid:FindFirstChild("BodyProportionScale")
		humanoid:FindFirstChild("BodyTypeScale").Value = 0
		bodyProportionScale.Value = 0
		
		for i, v in pairs(var3:GetDescendants()) do
			if v:IsA("BasePart") then
				for i_1, v_1 in v:GetChildren() do
					if v_1:IsA("Attachment") then
						t[v_1.Name] = humanoid:GetBodyPartR15(v)
					end
				end
			end
		end
	end
	return if humanoid == nil then Vector3.new(1, 1, 1) else humanoid:GetAccessoryHandleScale(p0, t[p1.Name])
end