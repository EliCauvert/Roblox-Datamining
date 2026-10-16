local Players = game:GetService("Players")
local HumanoidParentNil = game:DefineFastFlag("HumanoidParentNil", false)
local BodyPartRs = {}
local HumanoidModelFromDescriptionAsync = nil
local Humanoid = nil

if not HumanoidParentNil then
	HumanoidModelFromDescriptionAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	Humanoid = HumanoidModelFromDescriptionAsync:FindFirstChildOfClass("Humanoid")
	assert(Humanoid, "Humanoid must exist in character model")
	Humanoid:FindFirstChild("BodyTypeScale").Value = 0
	Humanoid:FindFirstChild("BodyProportionScale").Value = 0
	
	for _, Part in pairs(HumanoidModelFromDescriptionAsync:GetDescendants()) do
		if Part:IsA("BasePart") then
			for _, Attachment in Part:GetChildren() do
				if Attachment:IsA("Attachment") then
					BodyPartRs[Attachment.Name] = Humanoid:GetBodyPartR15(Part)
				end
			end
		end
	end
end
return function(p1, p2) --[[ Line: 43 ]]
	-- upvalues: HumanoidParentNil (copy), HumanoidModelFromDescriptionAsync (ref), Players (copy), Humanoid (ref), BodyPartRs (copy)
	if HumanoidParentNil and HumanoidModelFromDescriptionAsync == nil then
		HumanoidModelFromDescriptionAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
		Humanoid = HumanoidModelFromDescriptionAsync:FindFirstChildOfClass("Humanoid")
		assert(Humanoid, "Humanoid must exist in character model")
		Humanoid:FindFirstChild("BodyTypeScale").Value = 0
		Humanoid:FindFirstChild("BodyProportionScale").Value = 0
		
		for _, Part in pairs(HumanoidModelFromDescriptionAsync:GetDescendants()) do
			if Part:IsA("BasePart") then
				for _, Attachment in Part:GetChildren() do
					if Attachment:IsA("Attachment") then
						BodyPartRs[Attachment.Name] = Humanoid:GetBodyPartR15(Part)
					end
				end
			end
		end
	end
	return if Humanoid == nil then vector.create(1, 1, 1) else Humanoid:GetAccessoryHandleScale(p1, BodyPartRs[p2.Name])
end