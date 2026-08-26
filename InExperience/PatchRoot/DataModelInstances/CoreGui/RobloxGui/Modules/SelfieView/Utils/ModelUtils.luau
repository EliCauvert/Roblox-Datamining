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

local function getFaceControls(p1)
	if p1 == nil then
		return
	end
	return p1:FindFirstChildWhichIsA("FaceControls", true)
end

local function getNeck(p1, p2)
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

local function findObjectOfNameAndTypeName(p3, p4, p5)
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

local function getHead(p6)
	-- upvalues: findObjectOfNameAndTypeName (ref)
	if not p6 then
		return nil
	end
	local parent = nil
	local var1 = if p6 == nil then nil else p6:FindFirstChildWhichIsA("FaceControls", true)
	
	if var1 ~= nil and var1.Parent and (var1.Parent.ClassName == "MeshPart" or var1.Parent.ClassName == "Part") then
		parent = var1.Parent
	end
	return parent or findObjectOfNameAndTypeName("Head", "MeshPart", p6) or findObjectOfNameAndTypeName("Head", "Part", p6)
end

local function getAnimator(p6, p7)
	local var1
	local animator = nil
	local _ = nil
	
	if p7 > 0 then
		local humanoid = p6:WaitForChild("Humanoid", p7)
		var1 = if humanoid then if humanoid:IsA("Humanoid") then humanoid else p6:FindFirstChildWhichIsA("Humanoid") else p6:FindFirstChildWhichIsA("Humanoid")
	else
		var1 = p6:FindFirstChildWhichIsA("Humanoid")
	end
	if var1 ~= nil then
		animator = if p7 > 0 then var1:WaitForChild("Animator", p7) else var1:FindFirstChild("Animator")
	end
	if animator == nil then
		animator = p6:FindFirstChildWhichIsA("Animator", true)
	end
	return animator
end

local list = {
	"Head", "UpperTorso", "LowerTorso", "Torso", "LeftFoot", "LeftLowerLeg",
	"LeftUpperLeg", "RightFoot", "RightLowerLeg", "RightUpperLeg", "LeftHand",
	"LeftLowerArm", "LeftUpperArm", "RightHand", "RightLowerArm", "RightUpperArm"
}

local function updateTransparency(p6, p7)
	-- upvalues: list (ref), collectionService (ref)
	for i, v in ipairs(p6:GetDescendants()) do
		if v:IsA("Decal") then
			v.Transparency = 0
		elseif v:IsA("MeshPart") then
			if v.Parent and v.Parent:IsA("Accessory") or table.find(list, v.Name) then
				if table.find(p7, v.MeshId) then
					v.Transparency = p7[v.MeshId]
				else
					p7[v.MeshId] = v.Transparency
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

local function shouldMarkCloneDirtyForDescendant(p8)
	-- upvalues: t (ref)
	if p8:IsA("MeshPart") or p8:IsA("Part") or p8:IsA("Decal") then
		return p8.Transparency < 1
	elseif t[p8.ClassName] then
		return true
	end
end

local function resetPartOrientation(value)
	for i, v in ipairs(value:GetDescendants()) do
		if v:IsA("Motor6D") then
			v.C0 = CFrame.new(v.C0.Position)
			v.C1 = CFrame.new(v.C1.Position)
		end
	end
end

local function _(p8, p9)
	local var1 = p8:FindFirstChild(p9)
	
	if var1 then
		var1:Destroy()
	end
end

local function removeScripts(p8)
	local animate = p8:FindFirstChild("Animate")
	
	if animate then
		animate:Destroy()
	end
	local health = p8:FindFirstChild("Health")
	
	if health then
		health:Destroy()
	end
	for i, v in pairs(p8:GetDescendants()) do
		if v:IsA("BaseScript") then
			v:Destroy()
		end
	end
end

local function removeTags(p9)
	-- upvalues: collectionService (ref)
	for i, v in ipairs(collectionService:GetTags(p9)) do
		if v ~= "NoFace" then
			collectionService:RemoveTag(p9, v)
		end
	end
	for i, v_1 in ipairs(p9:GetDescendants()) do
		for i_2, v_2 in ipairs(collectionService:GetTags(v_1)) do
			if v_2 ~= "NoFace" then
				collectionService:RemoveTag(v_1, v_2)
			end
		end
	end
	local _ = collectionService:GetTags(p9)
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

local function disableScripts(p10)
	-- upvalues: disableScripts (ref)
	for i, v in p10:GetChildren() do
		if v:IsA("Script") then
			v.Disabled = true
			v.Parent = nil
		end
		disableScripts(v)
	end
end

local function removeUI(p11)
	-- upvalues: removeUI (ref)
	for i, v in p11:GetChildren() do
		if v:IsA("GuiObject") or v:IsA("ScreenGui") or (v:IsA("BillboardGui") or v:IsA("AdGui")) or v:IsA("SurfaceGui") then
			v.Parent = nil
		end
		removeUI(v)
	end
end

local function removeInstancesStrict(p12)
	-- upvalues: t_1 (ref), removeInstancesStrict (ref)
	for i, v in p12:GetChildren() do
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
	sanitizeCharacter = function(p13)
		-- upvalues: removeInstancesStrict (ref)
		if p13 then
			removeInstancesStrict(p13)
			
			return
		end
	end,
	isValidAvatar = function(p13)
		-- upvalues: getAnimator (ref), getHead (ref)
		return if getAnimator(p13, 10) then getHead(p13) else false
	end,
	hasDynamicHead = function(p13)
		return (if p13 == nil then nil else p13:FindFirstChildWhichIsA("FaceControls", true)) ~= nil
	end
}