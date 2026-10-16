local CollectionService = game:GetService("CollectionService")
local config = {
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

local function findObjectOfNameAndTypeName(Name, ClassName, Object) --[[ Line: 62 ]]
	if Object == nil then
		return nil
	end
	for _, descendant in Object:GetDescendants() do
		if descendant:IsA(ClassName) and descendant.Name == Name then
			return descendant
		end
	end
	return nil
end

local function getHead(Object) --[[ Line: 75 ]]
	-- upvalues: findObjectOfNameAndTypeName (copy)
	if not Object then
		return nil
	end
	local Head = nil
	local FaceControls = if Object == nil then nil else Object:FindFirstChildWhichIsA("FaceControls", true)
	
	if FaceControls ~= nil and FaceControls.Parent and (FaceControls.Parent.ClassName == "MeshPart" or FaceControls.Parent.ClassName == "Part") then
		Head = FaceControls.Parent
	end
	if not Head then
		Head = findObjectOfNameAndTypeName("Head", "MeshPart", Object)
	end
	if not Head then
		Head = findObjectOfNameAndTypeName("Head", "Part", Object)
	end
	return Head
end

local function getAnimator(Object, Timeout: number) --[[ Line: 108 ]]
	local Animator = nil
	local Humanoid1 = nil
	
	if Timeout > 0 then
		local Humanoid = Object:WaitForChild("Humanoid", Timeout)
		Humanoid1 = if Humanoid and Humanoid:IsA("Humanoid") then Humanoid else Object:FindFirstChildWhichIsA("Humanoid")
	else
		Humanoid1 = Object:FindFirstChildWhichIsA("Humanoid")
	end
	if Humanoid1 ~= nil then
		Animator = if Timeout > 0 then Humanoid1:WaitForChild("Animator", Timeout) else Humanoid1:FindFirstChild("Animator")
	end
	if Animator == nil then
		Animator = Object:FindFirstChildWhichIsA("Animator", true)
	end
	return Animator
end

local List = {
	"Head", "UpperTorso", "LowerTorso", "Torso", "LeftFoot", "LeftLowerLeg",
	"LeftUpperLeg", "RightFoot", "RightLowerLeg", "RightUpperLeg", "LeftHand",
	"LeftLowerArm", "LeftUpperArm", "RightHand", "RightLowerArm", "RightUpperArm"
}

local function _(Object, ChildName) --[[ Line: 213 | Named "removeChild" ]]
	local ChildName1 = Object:FindFirstChild(ChildName)
	
	if ChildName1 then
		ChildName1:Destroy()
	end
end

local config1 = {
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

local function disableScripts(ScriptObject) --[[ Line: 288 ]]
	-- upvalues: disableScripts (copy)
	for _, ScriptObject1 in ScriptObject:GetChildren() do
		if ScriptObject1:IsA("Script") then
			ScriptObject1.Disabled = true
			ScriptObject1.Parent = nil
		end
		disableScripts(ScriptObject1)
	end
end

local function removeUI(Object) --[[ Line: 298 ]]
	-- upvalues: removeUI (copy)
	for _, child in Object:GetChildren() do
		if child:IsA("GuiObject") or child:IsA("ScreenGui") or child:IsA("BillboardGui") or child:IsA("AdGui") or child:IsA("SurfaceGui") then
			child.Parent = nil
		end
		removeUI(child)
	end
end

local function removeInstancesStrict(Object) --[[ Line: 313 ]]
	-- upvalues: config1 (copy), removeInstancesStrict (copy)
	for _, child in Object:GetChildren() do
		if not config1[child.ClassName] then
			child.Parent = nil
		end
		removeInstancesStrict(child)
	end
end

return {
	getFaceControls = function(Object) --[[ Line: 23 ]]
		if Object == nil then return end
		return (Object:FindFirstChildWhichIsA("FaceControls", true))
	end,
	getNeck = function(Object, Parent) --[[ Line: 30 ]]
		if Object == nil or Parent == nil then
			return nil
		end
		local Descendants = Object:GetDescendants()
		
		for _, Motor in Descendants do
			if Motor:IsA("Motor6D") and (Motor.Part1 == Parent or Motor.Name == "Neck") then
				return Motor
			end
		end
		for _, AnimationConstraint in Descendants do
			if AnimationConstraint:IsA("AnimationConstraint") and AnimationConstraint.Parent == Parent and (AnimationConstraint.Attachment0 ~= nil and AnimationConstraint.Attachment0.Name == "NeckRigAttachment" or AnimationConstraint.Name == "Neck") then
				return AnimationConstraint
			end
		end
		return nil
	end,
	getHead = getHead,
	getAnimator = getAnimator,
	updateTransparency = function(Object, List1) --[[ Line: 162 ]]
		-- upvalues: List (copy), CollectionService (copy)
		for _, descendant in ipairs(Object:GetDescendants()) do
			if descendant:IsA("Decal") then
				descendant.Transparency = 0
			elseif not descendant:IsA("MeshPart") then
				if descendant:IsA("Part") then
					if descendant.Parent and descendant.Parent:IsA("Accessory") or table.find(List, descendant.Name) then
						descendant.Transparency = 0
					end
					if CollectionService:HasTag(descendant, "__RBX__LOCKED_TRANSPARENT") then
						descendant.Transparency = 1
					end
				end
			elseif descendant.Parent and descendant.Parent:IsA("Accessory") or table.find(List, descendant.Name) then
				if table.find(List1, descendant.MeshId) then
					descendant.Transparency = List1[descendant.MeshId]
				else
					List1[descendant.MeshId] = descendant.Transparency
				end
			end
		end
	end,
	shouldMarkCloneDirtyForDescendant = function(Object): boolean --[[ Line: 191 ]]
		-- upvalues: config (copy)
		if Object:IsA("MeshPart") or Object:IsA("Part") or Object:IsA("Decal") then
			if Object.Transparency < 1 then
				return true
			end
		elseif config[Object.ClassName] then
			return true
		end
		return false
	end,
	resetPartOrientation = function(Object) --[[ Line: 204 ]]
		for _, Motor in ipairs(Object:GetDescendants()) do
			if Motor:IsA("Motor6D") then
				Motor.C0 = CFrame.new(Motor.C0.Position)
				Motor.C1 = CFrame.new(Motor.C1.Position)
			end
		end
	end,
	removeScripts = function(Object) --[[ Line: 219 ]]
		local Animate = Object:FindFirstChild("Animate")
		
		if Animate then
			Animate:Destroy()
		end
		local Health = Object:FindFirstChild("Health")
		
		if Health then
			Health:Destroy()
		end
		for _, ScriptObject in pairs(Object:GetDescendants()) do
			if ScriptObject:IsA("BaseScript") then
				ScriptObject:Destroy()
			end
		end
	end,
	removeTags = function(Object) --[[ Line: 230 ]]
		-- upvalues: CollectionService (copy)
		for _, tag in ipairs((CollectionService:GetTags(Object))) do
			if tag ~= "NoFace" then
				CollectionService:RemoveTag(Object, tag)
			end
		end
		for _, descendant in ipairs(Object:GetDescendants()) do
			for _, tag1 in ipairs((CollectionService:GetTags(descendant))) do
				if tag1 ~= "NoFace" then
					CollectionService:RemoveTag(descendant, tag1)
				end
			end
		end
		local _ = CollectionService:GetTags(Object)
	end,
	sanitizeCharacter = function(p1) --[[ Line: 322 ]]
		-- upvalues: removeInstancesStrict (copy)
		if p1 then
			removeInstancesStrict(p1)
			
			return
		end
	end,
	isValidAvatar = function(p1): boolean --[[ Line: 330 ]]
		-- upvalues: getAnimator (copy), getHead (copy)
		return if getAnimator(p1, 10) and getHead(p1) then true else false
	end,
	hasDynamicHead = function(Object): boolean --[[ Line: 344 ]]
		return (if Object == nil then nil else Object:FindFirstChildWhichIsA("FaceControls", true)) ~= nil
	end
}