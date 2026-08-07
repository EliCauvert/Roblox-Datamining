local collectionService = game:GetService("CollectionService")
local selfViewNeckCheck = game:DefineFastFlag("SelfViewNeckCheck", false)
local t = {
	Accessory = "Accessory",
	CharacterMesh = "CharacterMesh",
	Decal = "Decal",
	MeshPart = "MeshPart",
	Pants = "Pants",
	Part = "Part",
	Shirt = "Shirt",
	ShirtGraphic = "ShirtGraphic",
	SpecialMesh = "SpecialMesh",
	SurfaceAppearance = "SurfaceAppearance"
}

local function getFaceControls(p0) --[[ line: 24 ]]
	if p0 == nil then
		return
	end
	return p0:FindFirstChildWhichIsA("FaceControls", true)
end

local function getNeck(p1, p2) --[[ line: 31 ]]
	-- upvalues: selfViewNeckCheck (ref)
	if p1 == nil or p2 == nil then
		return nil
	end
	local descendants = p1:GetDescendants()
	
	for i, v in descendants do
		if v:IsA("Motor6D") and (v.Part1 == p2 or v.Name == "Neck") then
			return v
		end
	end
	if selfViewNeckCheck == true then
		for i, v in descendants do
			if v:IsA("AnimationConstraint") and v.Parent == p2 and (v.Attachment0 ~= nil and v.Attachment0.Name == "NeckRigAttachment" or v.Name == "Neck") then
				return v
			end
		end
	else
		for i, v in descendants do
			if v:IsA("AnimationConstraint") and v.Parent == p2 and (v.Attachment0.Name == "NeckRigAttachment" or v.Name == "Neck") then
				return v
			end
		end
	end
	return nil
end

local function findObjectOfNameAndTypeName(p3, p4, p5) --[[ line: 72 ]]
	if p5 == nil then
		return nil
	end
	for i, v in p5:GetDescendants() do
		if v:IsA(p4) and v.Name == p3 then
			return v
		end
	end
	return nil
end

local function getHead(p6) --[[ line: 85 ]]
	-- upvalues: findObjectOfNameAndTypeName (ref)
	if not p6 then
		return nil
	end
	local parent = nil
	local var19 = if p6 == nil then nil else p6:FindFirstChildWhichIsA("FaceControls", true)
	
	if var19 ~= nil and var19.Parent and (var19.Parent.ClassName == "MeshPart" or var19.Parent.ClassName == "Part") then
		parent = var19.Parent
	end
	return parent or findObjectOfNameAndTypeName("Head", "MeshPart", p6) or findObjectOfNameAndTypeName("Head", "Part", p6)
end

local function getAnimator(p7, p8) --[[ line: 118 ]]
	local var22
	local animator = nil
	local _ = nil
	
	if p8 > 0 then
		local humanoid = p7:WaitForChild("Humanoid", p8)
		var22 = if humanoid then if humanoid:IsA("Humanoid") then humanoid else p7:FindFirstChildWhichIsA("Humanoid") else p7:FindFirstChildWhichIsA("Humanoid")
	else
		var22 = p7:FindFirstChildWhichIsA("Humanoid")
	end
	if var22 ~= nil then
		animator = if p8 > 0 then var22:WaitForChild("Animator", p8) else var22:FindFirstChild("Animator")
	end
	if animator == nil then
		animator = p7:FindFirstChildWhichIsA("Animator", true)
	end
	return animator
end

local list = {
	"Head", "UpperTorso", "LowerTorso", "Torso", "LeftFoot", "LeftLowerLeg",
	"LeftUpperLeg", "RightFoot", "RightLowerLeg", "RightUpperLeg", "LeftHand",
	"LeftLowerArm", "LeftUpperArm", "RightHand", "RightLowerArm", "RightUpperArm"
}

local function updateTransparency(p9, p10) --[[ line: 172 ]]
	-- upvalues: list (ref), collectionService (ref)
	for i, v in ipairs(p9:GetDescendants()) do
		if v:IsA("Decal") then
			v.Transparency = 0
		elseif v:IsA("MeshPart") then
			if v.Parent and v.Parent:IsA("Accessory") or table.find(list, v.Name) then
				if table.find(p10, v.MeshId) then
					v.Transparency = p10[v.MeshId]
				else
					p10[v.MeshId] = v.Transparency
				end
			end
		elseif v:IsA("Part") then
			if v.Parent and v.Parent:IsA("Accessory") or table.find(list, v.Name) then
				v.Transparency = 0
			end
			if collectionService:HasTag(v, "__RBX__LOCKED_TRANSPARENT") then
				v.Transparency = 1
			end
		end
	end
end

local function shouldMarkCloneDirtyForDescendant(p11) --[[ line: 201 ]]
	-- upvalues: t (ref)
	if p11:IsA("MeshPart") or p11:IsA("Part") or p11:IsA("Decal") then
		return p11.Transparency < 1
	elseif t[p11.ClassName] then
		return true
	end
end

local function resetPartOrientation(value) --[[ line: 214 ]]
	for i, v in ipairs(value:GetDescendants()) do
		if v:IsA("Motor6D") then
			v.C0 = CFrame.new(v.C0.Position)
			v.C1 = CFrame.new(v.C1.Position)
		end
	end
end

local function _(p12, p13) --[[ line: 223 | named "removeChild" ]]
	local var23 = p12:FindFirstChild(p13)
	
	if var23 then
		var23:Destroy()
	end
end

local function removeScripts(p14) --[[ line: 229 ]]
	local animate = p14:FindFirstChild("Animate")
	
	if animate then
		animate:Destroy()
	end
	local health = p14:FindFirstChild("Health")
	
	if health then
		health:Destroy()
	end
	for i, v in pairs(p14:GetDescendants()) do
		if v:IsA("BaseScript") then
			v:Destroy()
		end
	end
end

local function removeTags(p15) --[[ line: 240 ]]
	-- upvalues: collectionService (ref)
	for i, v in ipairs(collectionService:GetTags(p15)) do
		if v ~= "NoFace" then
			collectionService:RemoveTag(p15, v)
		end
	end
	for i, v_1 in ipairs(p15:GetDescendants()) do
		for i_2, v_2 in ipairs(collectionService:GetTags(v_1)) do
			if v_2 ~= "NoFace" then
				collectionService:RemoveTag(v_1, v_2)
			end
		end
	end
	local _ = collectionService:GetTags(p15)
end

local t_1 = {
	Accessory = "Accessory",
	Animator = "Animator",
	Attachment = "Attachment",
	AnimationConstraint = "AnimationConstraint",
	BallSocketConstraint = "BallSocketConstraint",
	BodyColors = "BodyColors",
	Bone = "Bone",
	CharacterMesh = "CharacterMesh",
	Decal = "Decal",
	DigitsRigDescription = "DigitsRigDescription",
	FaceControls = "FaceControls",
	Humanoid = "Humanoid",
	HumanoidDescription = "HumanoidDescription",
	HumanoidRigDescription = "HumanoidRigDescription",
	MeshPart = "MeshPart",
	Motor6D = "Motor6D",
	NumberValue = "NumberValue",
	Pants = "Pants",
	Part = "Part",
	Shirt = "Shirt",
	ShirtGraphic = "ShirtGraphic",
	SpecialMesh = "SpecialMesh",
	StringValue = "StringValue",
	SurfaceAppearance = "SurfaceAppearance",
	Vector3Value = "Vector3Value",
	WrapTarget = "WrapTarget",
	Weld = "Weld",
	WrapLayer = "WrapLayer",
	WeldConstraint = "WeldConstraint",
	AccessoryWeld = "AccessoryWeld",
	PackageLink = "PackageLink",
	Folder = "Folder",
	RigidConstraint = "RigidConstraint",
	WrapTextureTransfer = "WrapTextureTransfer"
}

local function disableScripts(p16) --[[ line: 298 ]]
	-- upvalues: disableScripts (ref)
	for i, v in p16:GetChildren() do
		if v:IsA("Script") then
			v.Disabled = true
			v.Parent = nil
		end
		disableScripts(v)
	end
end

local function removeUI(p17) --[[ line: 308 ]]
	-- upvalues: removeUI (ref)
	for i, v in p17:GetChildren() do
		if v:IsA("GuiObject") or v:IsA("ScreenGui") or (v:IsA("BillboardGui") or v:IsA("AdGui")) or v:IsA("SurfaceGui") then
			v.Parent = nil
		end
		removeUI(v)
	end
end

local function removeInstancesStrict(p18) --[[ line: 323 ]]
	-- upvalues: t_1 (ref), removeInstancesStrict (ref)
	for i, v in p18:GetChildren() do
		if not t_1[v.ClassName] then
			v.Parent = nil
		end
		removeInstancesStrict(v)
	end
end

return {
	getFaceControls = getFaceControls,
	getNeck = getNeck,
	getHead = getHead,
	getAnimator = getAnimator,
	updateTransparency = updateTransparency,
	shouldMarkCloneDirtyForDescendant = shouldMarkCloneDirtyForDescendant,
	resetPartOrientation = resetPartOrientation,
	removeScripts = removeScripts,
	removeTags = removeTags,
	sanitizeCharacter = function(p19) --[[ line: 332 ]]
		-- upvalues: removeInstancesStrict (ref)
		if p19 then
			removeInstancesStrict(p19)
			
			return
		end
	end,
	isValidAvatar = function(p20) --[[ line: 340 ]]
		-- upvalues: getAnimator (ref), getHead (ref)
		return if getAnimator(p20, 10) then getHead(p20) else false
	end,
	hasDynamicHead = function(p21) --[[ line: 354 ]]
		return (if p21 == nil then nil else p21:FindFirstChildWhichIsA("FaceControls", true)) ~= nil
	end
}