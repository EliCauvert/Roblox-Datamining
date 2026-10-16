local InsertService = game:GetService("InsertService")
local config = { R6 = true, R15 = true, R15ArtistIntent = true }
local MannequinUtilityModule = {
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
MannequinUtilityModule.CharacterPartNames.All = {}

for i, _ in pairs(MannequinUtilityModule.CharacterPartNames.R6) do
	MannequinUtilityModule.CharacterPartNames.All[i] = true
end
for i1, _ in pairs(MannequinUtilityModule.CharacterPartNames.R15) do
	MannequinUtilityModule.CharacterPartNames.All[i1] = true
end
local function _(AssetPath, p1: boolean) --[[ Line: 95 | Named "loadMannequin" ]]
	-- upvalues: InsertService (copy)
	if p1 == nil then
		p1 = true
	end
	local LocalAsset = InsertService:LoadLocalAsset(AssetPath)
	local Humanoid = LocalAsset:FindFirstChild("Humanoid")
	assert(Humanoid, "Assert Humanoid is not nil to silence type checker")
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if p1 then
		LocalAsset.Parent = workspace
	end
	return LocalAsset
end

function MannequinUtilityModule.LoadR15Mannequin(p1) --[[ Line: 112 ]]
	-- upvalues: InsertService (copy)
	local Flag: boolean = p1
	
	if Flag == nil then
		Flag = true
	end
	local R15Rbxm = InsertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15.rbxm")
	local Humanoid = R15Rbxm:FindFirstChild("Humanoid")
	assert(Humanoid, "Assert Humanoid is not nil to silence type checker")
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if Flag then
		R15Rbxm.Parent = workspace
	end
	return R15Rbxm
end

function MannequinUtilityModule.LoadR6Mannequin(p1) --[[ Line: 116 ]]
	-- upvalues: InsertService (copy)
	local Flag: boolean = p1
	
	if Flag == nil then
		Flag = true
	end
	local R6Rbxm = InsertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R6.rbxm")
	local Humanoid = R6Rbxm:FindFirstChild("Humanoid")
	assert(Humanoid, "Assert Humanoid is not nil to silence type checker")
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if Flag then
		R6Rbxm.Parent = workspace
	end
	return R6Rbxm
end

function MannequinUtilityModule.LoadRthroMannequin(p1) --[[ Line: 120 ]]
	-- upvalues: InsertService (copy)
	local Flag: boolean = p1
	
	if Flag == nil then
		Flag = true
	end
	local RthroRbxm = InsertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/Rthro.rbxm")
	local Humanoid = RthroRbxm:FindFirstChild("Humanoid")
	assert(Humanoid, "Assert Humanoid is not nil to silence type checker")
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	if Flag then
		RthroRbxm.Parent = workspace
	end
	return RthroRbxm
end

function MannequinUtilityModule.LoadR15PlusMannequin(p1) --[[ Line: 124 ]]
	-- upvalues: InsertService (copy)
	if game:GetEngineFeature("R15PlusMannequinContent") then
		local Flag: boolean = p1
		
		if Flag == nil then
			Flag = true
		end
		local R15PlusRbxm = InsertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15-plus.rbxm")
		local Humanoid = R15PlusRbxm:FindFirstChild("Humanoid")
		assert(Humanoid, "Assert Humanoid is not nil to silence type checker")
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
		if Flag then
			R15PlusRbxm.Parent = workspace
		end
		return R15PlusRbxm
	else
		local Flag1: boolean = p1
		
		if Flag1 == nil then
			Flag1 = true
		end
		local R15Rbxm = InsertService:LoadLocalAsset("rbxasset://models/Thumbnails/Mannequins/R15.rbxm")
		local Humanoid = R15Rbxm:FindFirstChild("Humanoid")
		assert(Humanoid, "Assert Humanoid is not nil to silence type checker")
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
		if Flag1 then
			R15Rbxm.Parent = workspace
		end
		return R15Rbxm
	end
end

function MannequinUtilityModule.LoadMannequinForScaleType(p1, p2) --[[ Line: 131 ]]
	-- upvalues: MannequinUtilityModule (copy)
	return if p1 == "Classic" then MannequinUtilityModule.LoadR15Mannequin(p2) else MannequinUtilityModule.LoadRthroMannequin(p2)
end

function MannequinUtilityModule.AssertObjectsFormat(Folders) --[[ Line: 144 ]]
	-- upvalues: config (copy), MannequinUtilityModule (copy)
	local Flag = false
	
	for _, folder in Folders do
		assert(folder:IsA("Folder"), "object should always be a Folder")
		
		if config[folder.Name] then
			Flag = true
			
			for _, child in folder:GetChildren() do
				assert(MannequinUtilityModule.CharacterPartNames.All[child.Name], string.format("Name of %s of Folder %s does not exist in CharacterParts", child.Name, folder.Name))
			end
		end
	end
	assert(Flag, "objects does not have at least one of R15ArtistIntent, R15, and R6 folders")
end

function MannequinUtilityModule.CreateBodyPartMannequin(List, p1) --[[ Line: 175 ]]
	-- upvalues: MannequinUtilityModule (copy)
	local Flag = false
	local Flag1 = false
	local v1 = "Classic"
	MannequinUtilityModule.AssertObjectsFormat(List)
	
	for _, value in List do
		if value.Name == "R15" or value.Name == "R15ArtistIntent" then
			Flag = true
			local AvatarPartScaleType = value:FindFirstChild("AvatarPartScaleType", true)
			
			if not AvatarPartScaleType then break end
			v1 = AvatarPartScaleType.Value
			break
		end
	end
	for _, value1 in List do
		if value1.Name == "R15ArtistIntent" then
			Flag1 = true
			break
		end
	end
	local MannequinForScaleType = if Flag then MannequinUtilityModule.LoadMannequinForScaleType(v1, p1) else MannequinUtilityModule.LoadR6Mannequin(p1)
	local Humanoid = MannequinForScaleType:FindFirstChildOfClass("Humanoid")
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local BodyTypeScale = Humanoid:FindFirstChild("BodyTypeScale")
	
	if BodyTypeScale == nil then
		BodyTypeScale = Instance.new("NumberValue")
		BodyTypeScale.Name = "BodyTypeScale"
		BodyTypeScale.Value = 0
		BodyTypeScale.Parent = Humanoid
	end
	local BodyProportionScale = Humanoid:FindFirstChild("BodyProportionScale")
	
	if BodyProportionScale == nil then
		BodyProportionScale = Instance.new("NumberValue")
		BodyProportionScale.Name = "BodyProportionScale"
		BodyProportionScale.Value = 0
		BodyProportionScale.Parent = Humanoid
	end
	if v1 == "ProportionsNormal" then
		BodyTypeScale.Value = 1
		BodyProportionScale.Value = 0
	elseif v1 == "ProportionsSlender" then
		BodyTypeScale.Value = 1
		BodyProportionScale.Value = 1
	end
	return Flag, Flag1, MannequinForScaleType
end

function MannequinUtilityModule.SetupBodyPartMannequin(p2, p3, Parent, List, Url) --[[ Line: 257 ]]
	-- upvalues: MannequinUtilityModule (copy)
	MannequinUtilityModule.AssertObjectsFormat(List)
	local Flag = false
	
	if Url then
		game:GetObjects(Url)[1].Parent = Parent
	end
	local function addFolderChildren(Object, List, List1) --[[ Line: 272 ]]
		-- upvalues: Flag (ref), Parent (copy), MannequinUtilityModule (upval)
		for _, Part in pairs(Object:GetChildren()) do
			assert(Part:IsA("BasePart"), "Only BaseParts should be in Folders")
			
			if string.find(Part.Name, "Right") then
				Flag = true
			end
			Parent:FindFirstChild("Humanoid"):ReplaceBodyPartR15(MannequinUtilityModule.R15PartNameToEnum[Part.Name], Part)
			table.insert(List, Part.Name)
			table.insert(List1, Part)
		end
	end
	
	local R15ArtistIntent: string = if p2 and p3 then "R15ArtistIntent" else "R15"
	local t = {}
	local t1 = {}
	
	for _, value in pairs(List) do
		if p2 and value.Name == R15ArtistIntent or not p2 and value.Name == "R6" then
			addFolderChildren(value, t1, t)
		elseif not string.find(value.Name, "R15") then
			value.Parent = Parent
		end
	end
	if p2 then
		local HumanoidRootPart = Parent:FindFirstChild("HumanoidRootPart")
		Parent.PrimaryPart = HumanoidRootPart
		HumanoidRootPart.CFrame = CFrame.new(vector.create(0, 5, 0)) * CFrame.Angles(0, 3.141592653589793, 0)
		HumanoidRootPart.Anchored = true
		Parent:FindFirstChildOfClass("Humanoid"):BuildRigFromAttachments()
	end
	return Flag, t1
end

function MannequinUtilityModule.CreateHeadModel(p4) --[[ Line: 322 ]]
	local Model = Instance.new("Model")
	p4.Name = "Head"
	p4.Parent = Model
	local Humanoid = Instance.new("Humanoid")
	Humanoid.RigType = Enum.HumanoidRigType.R15
	Humanoid.Parent = Model
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	
	return Model
end

return MannequinUtilityModule