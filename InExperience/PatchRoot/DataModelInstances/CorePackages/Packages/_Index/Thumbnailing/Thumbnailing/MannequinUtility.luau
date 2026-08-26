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
local function _(p1, p2)
	-- upvalues: insertService (ref)
	if p2 == nil then
		p2 = true
	end
	local var1 = insertService:LoadLocalAsset(p1)
	local humanoid = var1:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if p2 then
		var1.Parent = workspace
	end
	return var1
end

function t.LoadR15Mannequin(p1)
	-- upvalues: insertService (ref)
	local var1 = p1
	
	if var1 == nil then
		var1 = true
	end
	local var2 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15.rbxm")
	local humanoid = var2:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if var1 then
		var2.Parent = workspace
	end
	return var2
end

function t.LoadR6Mannequin(p1)
	-- upvalues: insertService (ref)
	local var1 = p1
	
	if var1 == nil then
		var1 = true
	end
	local var2 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R6.rbxm")
	local humanoid = var2:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if var1 then
		var2.Parent = workspace
	end
	return var2
end

function t.LoadRthroMannequin(p1)
	-- upvalues: insertService (ref)
	local var1 = p1
	
	if var1 == nil then
		var1 = true
	end
	local var2 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/Rthro.rbxm")
	local humanoid = var2:FindFirstChild("Humanoid")
	assert(humanoid, "Assert Humanoid is not nil to silence type checker")
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if var1 then
		var2.Parent = workspace
	end
	return var2
end

function t.LoadR15PlusMannequin(p1)
	-- upvalues: insertService (ref)
	if game:GetEngineFeature("R15PlusMannequinContent") then
		local var1 = p1
		
		if var1 == nil then
			var1 = true
		end
		local var2 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15-plus.rbxm")
		local humanoid = var2:FindFirstChild("Humanoid")
		assert(humanoid, "Assert Humanoid is not nil to silence type checker")
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
		if var1 then
			var2.Parent = workspace
		end
		return var2
	else
		local var3 = p1
		
		if var3 == nil then
			var3 = true
		end
		local var4 = insertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15.rbxm")
		local humanoid = var4:FindFirstChild("Humanoid")
		assert(humanoid, "Assert Humanoid is not nil to silence type checker")
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
		if var3 then
			var4.Parent = workspace
		end
		return var4
	end
end

function t.LoadMannequinForScaleType(p1, p2)
	-- upvalues: t (ref)
	return if p1 == "Classic" then t.LoadR15Mannequin(p2) else t.LoadRthroMannequin(p2)
end

function t.AssertObjectsFormat(p1)
	-- upvalues: t_1 (ref), t (ref)
	local var1 = false
	
	for i, v in p1 do
		assert(v:IsA("Folder"), "object should always be a Folder")
		
		if t_1[v.Name] then
			var1 = true
			
			for i_1, v_1 in v:GetChildren() do
				assert(t.CharacterPartNames.All[v_1.Name], string.format("Name of %s of Folder %s does not exist in CharacterParts", v_1.Name, v.Name))
			end
		end
	end
	assert(var1, "objects does not have at least one of R15ArtistIntent, R15, and R6 folders")
end

function t.CreateBodyPartMannequin(p2, p3)
	-- upvalues: t (ref)
	local var2 = false
	local var3 = false
	local var4 = "Classic"
	t.AssertObjectsFormat(p2)
	
	for i, v in p2 do
		if v.Name == "R15" or v.Name == "R15ArtistIntent" then
			var2 = true
			local avatarPartScaleType = v:FindFirstChild("AvatarPartScaleType", true)
			
			if not avatarPartScaleType then break end
			var4 = avatarPartScaleType.Value
			break
		end
	end
	for i_1, v in p2 do
		if v.Name == "R15ArtistIntent" then
			var3 = true
			break
		end
	end
	local var5 = if var2 then t.LoadMannequinForScaleType(var4, p3) else t.LoadR6Mannequin(p3)
	local humanoid = var5:FindFirstChildOfClass("Humanoid")
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
	if var4 == "ProportionsNormal" then
		bodyTypeScale_1.Value = 1
		bodyProportionScale_1.Value = 0
	elseif var4 == "ProportionsSlender" then
		bodyTypeScale_1.Value = 1
		bodyProportionScale_1.Value = 1
	end
	return var2, var3, var5
end

function t.SetupBodyPartMannequin(value, p4, p5, p6, p7)
	-- upvalues: t (ref)
	t.AssertObjectsFormat(p6)
	local var6 = false
	
	if p7 then
		game:GetObjects(p7)[1].Parent = p5
	end
	local function addFolderChildren(p8, p9, p10)
		-- upvalues: var6 (write), p5 (ref), t (copy)
		for i, v in pairs(p8:GetChildren()) do
			assert(v:IsA("BasePart"), "Only BaseParts should be in Folders")
			
			if string.find(v.Name, "Right") then
				var6 = true
			end
			p5:FindFirstChild("Humanoid"):ReplaceBodyPartR15(t.R15PartNameToEnum[v.Name], v)
			table.insert(p9, v.Name)
			table.insert(p10, v)
		end
	end
	
	local var7 = if value and p4 then "R15ArtistIntent" else "R15"
	local t_1 = {}
	local t_2 = {}
	
	for i, v in pairs(p6) do
		if value and v.Name == var7 or not value and v.Name == "R6" then
			addFolderChildren(v, t_2, t_1)
		elseif not string.find(v.Name, "R15") then
			v.Parent = p5
		end
	end
	if value then
		local humanoidRootPart = p5:FindFirstChild("HumanoidRootPart")
		p5.PrimaryPart = humanoidRootPart
		humanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 5, 0)) * CFrame.Angles(0, 3.14159265359, 0)
		humanoidRootPart.Anchored = true
		p5:FindFirstChildOfClass("Humanoid"):BuildRigFromAttachments()
	end
	return var6, t_2
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