local t = {
	CharacterPartNames = {
		R6 = {
			HumanoidRootPart = true,
			Head = true,
			Torso = true,
			["Left Arm"] = true,
			["Left Leg"] = true,
			["Right Arm"] = true,
			["Right Leg"] = true,
			CharacterMesh = true
		},
		R15 = {
			HumanoidRootPart = true,
			Head = true,
			UpperTorso = true,
			LowerTorso = true,
			LeftUpperLeg = true,
			LeftLowerLeg = true,
			LeftFoot = true,
			RightUpperLeg = true,
			RightLowerLeg = true,
			RightFoot = true,
			LeftUpperArm = true,
			LeftLowerArm = true,
			LeftHand = true,
			RightUpperArm = true,
			RightLowerArm = true,
			RightHand = true
		}
	},
	R15PartNameToEnum = {
		Head = Enum.BodyPartR15.Head,
		UpperTorso = Enum.BodyPartR15.UpperTorso,
		LowerTorso = Enum.BodyPartR15.LowerTorso,
		LeftUpperLeg = Enum.BodyPartR15.LeftUpperLeg,
		LeftLowerLeg = Enum.BodyPartR15.LeftLowerLeg,
		LeftFoot = Enum.BodyPartR15.LeftFoot,
		RightUpperLeg = Enum.BodyPartR15.RightUpperLeg,
		RightLowerLeg = Enum.BodyPartR15.RightLowerLeg,
		RightFoot = Enum.BodyPartR15.RightFoot,
		LeftUpperArm = Enum.BodyPartR15.LeftUpperArm,
		LeftLowerArm = Enum.BodyPartR15.LeftLowerArm,
		LeftHand = Enum.BodyPartR15.LeftHand,
		RightUpperArm = Enum.BodyPartR15.RightUpperArm,
		RightLowerArm = Enum.BodyPartR15.RightLowerArm,
		RightHand = Enum.BodyPartR15.RightHand
	}
}
local insertService = game:GetService("InsertService")
local t_1 = { R6 = true, R15 = true, R15ArtistIntent = true }
t.CharacterPartNames.All = {}

for i, v in pairs(t.CharacterPartNames.R6) do
	t.CharacterPartNames.All[i] = true
end
for i_1, v in pairs(t.CharacterPartNames.R15) do
	t.CharacterPartNames.All[i_1] = true
end
local function _(p0, p1)
	-- upvalues: insertService (ref)
	if p1 == nil then
		p1 = true
	end
	local var3 = insertService:LoadLocalAsset(p0)
	local humanoid = var3:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if p1 then
		var3.Parent = workspace
	end
	return var3
end

function t.LoadR15Mannequin(p2)
	-- upvalues: insertService (ref)
	local var5 = p2
	
	if var5 == nil then
		var5 = true
	end
	local var6 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15.rbxm")
	local humanoid = var6:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if var5 then
		var6.Parent = workspace
	end
	return var6
end

function t.LoadR6Mannequin(p3)
	-- upvalues: insertService (ref)
	local var8 = p3
	
	if var8 == nil then
		var8 = true
	end
	local var9 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R6.rbxm")
	local humanoid = var9:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if var8 then
		var9.Parent = workspace
	end
	return var9
end

function t.LoadRthroMannequin(p4)
	-- upvalues: insertService (ref)
	local var11 = p4
	
	if var11 == nil then
		var11 = true
	end
	local var12 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/Rthro.rbxm")
	local humanoid = var12:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if var11 then
		var12.Parent = workspace
	end
	return var12
end

function t.LoadR15PlusMannequin(p5)
	-- upvalues: insertService (ref)
	if game:GetEngineFeature("R15PlusMannequinContent") then
		local var14 = p5
		
		if var14 == nil then
			var14 = true
		end
		local var15 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15-plus.rbxm")
		local humanoid = var15:FindFirstChild("Humanoid")
		assert(humanoid, "Assert Humanoid is not nil to silence type checker")
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
		if var14 then
			var15.Parent = workspace
		end
		return var15
	else
		local var17 = p5
		
		if var17 == nil then
			var17 = true
		end
		local var18 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15.rbxm")
		local humanoid = var18:FindFirstChild("Humanoid")
		assert(humanoid, "Assert Humanoid is not nil to silence type checker")
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
		if var17 then
			var18.Parent = workspace
		end
		return var18
	end
end

function t.LoadMannequinForScaleType(p6, p7)
	-- upvalues: t (ref)
	return if p6 == "Classic" then t.LoadR15Mannequin(p7) else t.LoadRthroMannequin(p7)
end

function t.AssertObjectsFormat(p8)
	-- upvalues: t_1 (ref), t (ref)
	local var20 = false
	
	for i, v in p8 do
		assert(v:IsA("Folder"), "object should always be a Folder")
		
		if t_1[v.Name] then
			var20 = true
			
			for i_1, v_1 in v:GetChildren() do
				assert(t.CharacterPartNames.All[v_1.Name], string.format("Name of %s of Folder %s does not exist in CharacterParts", v_1.Name, v.Name))
			end
		end
	end
	assert(var20, "objects does not have at least one of R15ArtistIntent, R15, and R6 folders")
end

function t.CreateBodyPartMannequin(p9, p10)
	-- upvalues: t (ref)
	local var21 = false
	local var22 = false
	local var23 = "Classic"
	t.AssertObjectsFormat(p9)
	
	for i, v in p9 do
		if v.Name == "R15" or v.Name == "R15ArtistIntent" then
			var21 = true
			local avatarPartScaleType = v:FindFirstChild("AvatarPartScaleType", true)
			
			if not avatarPartScaleType then break end
			var23 = avatarPartScaleType.Value
			break
		end
	end
	for i_1, v in p9 do
		if v.Name == "R15ArtistIntent" then
			var22 = true
			break
		end
	end
	local var25 = if var21 then t.LoadMannequinForScaleType(var23, p10) else t.LoadR6Mannequin(p10)
	local humanoid = var25:FindFirstChildOfClass("Humanoid")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local bodyTypeScale_1 = humanoid:FindFirstChild("BodyTypeScale")
	
	if bodyTypeScale_1 == nil then
		bodyTypeScale_1 = Instance.new("NumberValue")
		bodyTypeScale_1.Name = "BodyTypeScale"
		bodyTypeScale_1.Value = 0
		bodyTypeScale_1.Parent = humanoid
	end
	local bodyProportionScale_1 = humanoid:FindFirstChild("BodyProportionScale")
	
	if bodyProportionScale_1 == nil then
		bodyProportionScale_1 = Instance.new("NumberValue")
		bodyProportionScale_1.Name = "BodyProportionScale"
		bodyProportionScale_1.Value = 0
		bodyProportionScale_1.Parent = humanoid
	end
	if var23 == "ProportionsNormal" then
		bodyTypeScale_1.Value = 1
		bodyProportionScale_1.Value = 0
	elseif var23 == "ProportionsSlender" then
		bodyTypeScale_1.Value = 1
		bodyProportionScale_1.Value = 1
	end
	return var21, var22, var25
end

function t.SetupBodyPartMannequin(value, p11, p12, p13, p14)
	-- upvalues: t (ref)
	t.AssertObjectsFormat(p13)
	local var29 = false
	
	if p14 then
		game:GetObjects(p14)[1].Parent = p12
	end
	local function addFolderChildren(p15, p16, p17)
		-- upvalues: var29 (write), p12 (ref), t (copy)
		for i, v in pairs(p15:GetChildren()) do
			assert(v:IsA("BasePart"), "Only BaseParts should be in Folders")
			
			if string.find(v.Name, "Right") then
				var29 = true
			end
			p12:FindFirstChild("Humanoid"):ReplaceBodyPartR15(t.R15PartNameToEnum[v.Name], v)
			table.insert(p16, v.Name)
			table.insert(p17, v)
		end
	end
	
	local var31 = if value and p11 then "R15ArtistIntent" else "R15"
	local t_1 = {}
	local t_2 = {}
	
	for i, v in pairs(p13) do
		if value and v.Name == var31 or not value and v.Name == "R6" then
			addFolderChildren(v, t_2, t_1)
		elseif not string.find(v.Name, "R15") then
			v.Parent = p12
		end
	end
	if value then
		local humanoidRootPart = p12:FindFirstChild("HumanoidRootPart")
		p12.PrimaryPart = humanoidRootPart
		humanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 5, 0)) * CFrame.Angles(0, 3.14159265359, 0)
		humanoidRootPart.Anchored = true
		p12:FindFirstChildOfClass("Humanoid"):BuildRigFromAttachments()
	end
	return var29, t_2
end

function t.CreateHeadModel(head)
	local model = Instance.new("Model")
	head.Name = "Head"
	head.Parent = model
	local humanoid = Instance.new("Humanoid")
	humanoid.RigType = Enum.HumanoidRigType.R15
	humanoid.Parent = model
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	return model
end

return t