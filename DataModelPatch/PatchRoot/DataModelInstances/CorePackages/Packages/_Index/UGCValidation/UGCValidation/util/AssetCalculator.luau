local Parent = script.Parent.Parent
local CryoModule = require(Parent.Parent.Cryo)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.Types)
local CanBeNormalizedModule = require(Parent.util.canBeNormalized)
local GetPartNamesInHierarchyOrderModule = require(Parent.util.getPartNamesInHierarchyOrder)
local AssetTraversalUtilsModule = require(Parent.util.AssetTraversalUtils)
local GetMeshScalesModule = require(Parent.util.getMeshScales)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
local LowerTorso = {
	root = "LowerTorso",
	children = {
		UpperTorso = {
			children = {
				Head = AssetTraversalUtilsModule.assetHierarchy[Enum.AssetType.DynamicHead],
				LeftUpperArm = AssetTraversalUtilsModule.assetHierarchy[Enum.AssetType.LeftArm],
				RightUpperArm = AssetTraversalUtilsModule.assetHierarchy[Enum.AssetType.RightArm]
			}
		},
		LeftUpperLeg = AssetTraversalUtilsModule.assetHierarchy[Enum.AssetType.LeftLeg],
		RightUpperLeg = AssetTraversalUtilsModule.assetHierarchy[Enum.AssetType.RightLeg]
	}
}
local config = {
	root = "HumanoidRootPart",
	children = { LowerTorso = LowerTorso }
}

local function calculateCFrame(Position, Position1): CFrame?
	-- upvalues: CanBeNormalizedModule (copy)
	local PositionDelta = Position - Position1
	
	if not CanBeNormalizedModule(PositionDelta) then return end
	local Direction = PositionDelta.Unit
	local Direction1 = Direction:Cross(vector.create(0, 0, 1)).Unit
	
	if not CanBeNormalizedModule(Direction1) then
		Direction1 = Direction:Cross(if Direction.Z < 0 then vector.create(0, 1, 0) else vector.create(-0, -1, -0)).Unit
	end
	return CFrame.fromMatrix(Position, Direction1, Direction, Direction1:Cross(Direction).Unit)
end

local function calculatePartTransformInHierarchy(Object, p1, p2, Callback, p3)
	-- upvalues: ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy)
	local _CFrame = if p3 and p3[Object.Name] then p3[Object.Name] else CFrame.new()
	
	if p1 then
		local CallbackResult = Callback(p1)
		assert(CallbackResult)
		local RigAttachmentToParent = ConstantsInterfaceModule.getRigAttachmentToParent(nil, Object.Name)
		local RigAttachmentToParent1 = CallbackResult:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(RigAttachmentToParent1)
		local RigAttachmentToParent2 = Object:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(RigAttachmentToParent2)
		
		return p2 * GetAttachmentCFrameInPartSpaceModule(RigAttachmentToParent1) * _CFrame * GetAttachmentCFrameInPartSpaceModule(RigAttachmentToParent2):Inverse()
	else
		return _CFrame
	end
end

local function calculateHierarchyTransforms(AssetHierarchyEntry, Callback, p1)
	-- upvalues: calculatePartTransformInHierarchy (copy)
	local t = {}
	
	local function calculateAllTransformsInternal(Root, p2, p3, p4)
		-- upvalues: Callback (copy), calculatePartTransformInHierarchy (upval), p1 (copy), t (copy), calculateAllTransformsInternal (copy)
		local CallbackResult = Callback(Root)
		assert(CallbackResult)
		local PartTransformInHierarchy = calculatePartTransformInHierarchy(CallbackResult, p2, p4, Callback, p1)
		t[CallbackResult.Name] = PartTransformInHierarchy
		
		if not p3.children then return end
		for i, child in p3.children do
			calculateAllTransformsInternal(i, Root, child, PartTransformInHierarchy)
		end
	end
	
	calculateAllTransformsInternal(AssetHierarchyEntry.root, nil, AssetHierarchyEntry, CFrame.new())
	
	return t
end

local function _(p2, p3): CFrame
	return CFrame.new(p2.Rotation:Inverse() * (p3.Position - p2.Position)) * (p2.Rotation:Inverse() * p3.Rotation)
end

local function calculateAssetCFrameFromPartsCFrames(AssetType, AllTransformsForAsset)
	-- upvalues: GetPartNamesInHierarchyOrderModule (copy), calculateCFrame (copy)
	local PartNamesInHierarchyOrderModule = GetPartNamesInHierarchyOrderModule(AssetType)
	
	return calculateCFrame(AllTransformsForAsset[PartNamesInHierarchyOrderModule[1]].Position, AllTransformsForAsset[PartNamesInHierarchyOrderModule[3]].Position)
end

local _ = function(AssetType)
	assert(AssetType == Enum.AssetType.LeftArm or (AssetType == Enum.AssetType.RightArm or (AssetType == Enum.AssetType.LeftLeg or AssetType == Enum.AssetType.RightLeg)))
end

local _ = function(Object, ChildName, p2)
	-- upvalues: R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy)
	local ChildName1 = Object:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(ChildName1)
	
	return p2 * GetAttachmentCFrameInPartSpaceModule(ChildName1)
end

local AssetCalculatorModule = {
	calculatePartCFrameFromRigAttachments = function(AssetType, Object, p2)
		-- upvalues: ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), AssetTraversalUtilsModule (copy), calculateCFrame (copy)
		assert(AssetType == Enum.AssetType.LeftArm or (AssetType == Enum.AssetType.RightArm or (AssetType == Enum.AssetType.LeftLeg or AssetType == Enum.AssetType.RightLeg)))
		local RigAttachmentToParent = ConstantsInterfaceModule.getRigAttachmentToParent(AssetType, Object.Name)
		
		if RigAttachmentToParent == "" then return end
		local RigAttachmentToParent1 = Object:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(RigAttachmentToParent1)
		local ScaledAttachmentCFrameInPartSpaceModule = p2 * GetAttachmentCFrameInPartSpaceModule(RigAttachmentToParent1)
		local AssetRigChild = AssetTraversalUtilsModule.getAssetRigChild(AssetType, Object.Name)
		
		if not AssetRigChild then return end
		local Child = Object:FindFirstChild(ConstantsInterfaceModule.getRigAttachmentToParent(AssetType, AssetRigChild), R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(Child)
		
		return calculateCFrame(ScaledAttachmentCFrameInPartSpaceModule.Position, (p2 * GetAttachmentCFrameInPartSpaceModule(Child)).Position)
	end
}

function AssetCalculatorModule.calculateStraightenedLimb(AssetType, AllTransformsForAsset, Callback)
	-- upvalues: CryoModule (copy), GetPartNamesInHierarchyOrderModule (copy), AssetTraversalUtilsModule (copy), AssetCalculatorModule (copy), ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy)
	assert(AssetType == Enum.AssetType.LeftArm or (AssetType == Enum.AssetType.RightArm or (AssetType == Enum.AssetType.LeftLeg or AssetType == Enum.AssetType.RightLeg)))
	local JoinResult = CryoModule.Dictionary.join(AllTransformsForAsset)
	local Position = nil
	local _CFrame = CFrame.new()
	
	for _, value in GetPartNamesInHierarchyOrderModule(AssetType) do
		local CallbackResult = Callback(value)
		local PartCFrameFromRigAttachments = _CFrame
		local AssetRigChild = AssetTraversalUtilsModule.getAssetRigChild(AssetType, value)
		local NoAssetRigChild = AssetRigChild == nil
		
		if not NoAssetRigChild then
			PartCFrameFromRigAttachments = AssetCalculatorModule.calculatePartCFrameFromRigAttachments(AssetType, CallbackResult, AllTransformsForAsset[value]) or PartCFrameFromRigAttachments
		end
		local AllTransformsForAssetEntry = AllTransformsForAsset[value]
		JoinResult[value] = CFrame.new(PartCFrameFromRigAttachments.Rotation:Inverse() * (AllTransformsForAssetEntry.Position - PartCFrameFromRigAttachments.Position)) * (PartCFrameFromRigAttachments.Rotation:Inverse() * AllTransformsForAssetEntry.Rotation)
		
		if Position then
			local JoinResultEntry = JoinResult[value]
			local Child = CallbackResult:FindFirstChild(ConstantsInterfaceModule.getRigAttachmentToParent(AssetType, value), R15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(Child)
			JoinResult[value] = CFrame.new(JoinResult[value].Position + (Position - (JoinResultEntry * GetAttachmentCFrameInPartSpaceModule(Child)).Position)) * JoinResult[value].Rotation
		end
		if not NoAssetRigChild then
			_CFrame = PartCFrameFromRigAttachments
			local JoinResultEntry = JoinResult[value]
			local Child = CallbackResult:FindFirstChild(ConstantsInterfaceModule.getRigAttachmentToParent(AssetType, AssetRigChild), R15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(Child)
			Position = (JoinResultEntry * GetAttachmentCFrameInPartSpaceModule(Child)).Position
		end
	end
	return JoinResult
end

function AssetCalculatorModule.calculateAssetCFrame(AssetType, p2)
	-- upvalues: AssetCalculatorModule (copy), calculateAssetCFrameFromPartsCFrames (copy)
	local AllTransformsForAsset = AssetCalculatorModule.calculateAllTransformsForAsset(AssetType, p2)
	
	return if Enum.AssetType.DynamicHead == AssetType then AllTransformsForAsset.Head elseif Enum.AssetType.Torso == AssetType then AllTransformsForAsset.LowerTorso else calculateAssetCFrameFromPartsCFrames(AssetType, AllTransformsForAsset)
end

function AssetCalculatorModule.calculateAllTransformsForAsset(AssetType, Object)
	-- upvalues: calculateHierarchyTransforms (copy), AssetTraversalUtilsModule (copy)
	return if Enum.AssetType.DynamicHead == AssetType then { Head = CFrame.new() } else calculateHierarchyTransforms(AssetTraversalUtilsModule.assetHierarchy[AssetType], function(ChildName)
		-- upvalues: Object (copy)
		return (Object:FindFirstChild(ChildName))
	end)
end

function AssetCalculatorModule.calculateAllTransformsForFullBody(p2, p3)
	-- upvalues: config (copy), LowerTorso (copy), calculateHierarchyTransforms (copy)
	return (calculateHierarchyTransforms(if p3 then config else LowerTorso, function(p4)
		-- upvalues: p2 (copy)
		return p2[p4]
	end, p3))
end

function AssetCalculatorModule.calculatePartsLocalToAsset(AssetType, p2)
	-- upvalues: GetPartNamesInHierarchyOrderModule (copy), calculateCFrame (copy)
	assert(AssetType == Enum.AssetType.LeftArm or (AssetType == Enum.AssetType.RightArm or (AssetType == Enum.AssetType.LeftLeg or AssetType == Enum.AssetType.RightLeg)))
	local PartNamesInHierarchyOrderModule = GetPartNamesInHierarchyOrderModule(AssetType)
	local CalculateCFrameResult = calculateCFrame(p2[PartNamesInHierarchyOrderModule[1]].Position, p2[PartNamesInHierarchyOrderModule[3]].Position)
	local t = {}
	
	for _, value in GetPartNamesInHierarchyOrderModule(AssetType) do
		local ScaledInverted = nil
		if CalculateCFrameResult then
			local v1 = p2[value]
			ScaledInverted = CFrame.new(CalculateCFrameResult.Rotation:Inverse() * (v1.Position - CalculateCFrameResult.Position)) * (CalculateCFrameResult.Rotation:Inverse() * v1.Rotation)
		else
			ScaledInverted = p2[value]
		end
		t[value] = ScaledInverted
	end
	return t
end

function AssetCalculatorModule.getBodyPartsToParents()
	-- upvalues: LowerTorso (copy)
	local t = {}
	
	local function calculateAllTransformsInternal(Key, Key1, p3)
		-- upvalues: t (copy), calculateAllTransformsInternal (copy)
		t[Key] = Key1 or "HumanoidRootPart"
		
		if not p3.children then return end
		for i, child in p3.children do
			calculateAllTransformsInternal(i, Key, child)
		end
	end
	
	local Root = LowerTorso.root
	t[Root] = "HumanoidRootPart"
	
	if not LowerTorso.children then
		return t
	end
	for i, child in LowerTorso.children do
		calculateAllTransformsInternal(i, Root, child)
	end
	return t
end

function AssetCalculatorModule.getAssetMeshesValidationSpaceTransforms(Object, p4)
	-- upvalues: AssetCalculatorModule (copy), GetMeshScalesModule (copy)
	local AssetTypeEnum = p4.assetTypeEnum
	assert(AssetTypeEnum)
	local List = {}
	
	if AssetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(List, Object.Name)
	else
		for _, Part in Object:GetChildren() do
			if Part:IsA("MeshPart") then
				table.insert(List, Part.Name)
			end
		end
	end
	local AllTransformsForAsset = AssetCalculatorModule.calculateAllTransformsForAsset(AssetTypeEnum, Object)
	
	local function findMeshHandle(ChildName)
		-- upvalues: AssetTypeEnum (copy), Object (copy)
		return if AssetTypeEnum == Enum.AssetType.DynamicHead then Object else Object:FindFirstChild(ChildName)
	end
	
	if AssetTypeEnum ~= Enum.AssetType.DynamicHead and AssetTypeEnum ~= Enum.AssetType.Torso then
		for i, value in AssetCalculatorModule.calculateStraightenedLimb(AssetTypeEnum, AllTransformsForAsset, findMeshHandle) do
			AllTransformsForAsset[i] = value
		end
	end
	local MeshScalesModule = GetMeshScalesModule(List, findMeshHandle, p4)
	local t = {}
	
	for _, value1 in List do
		t[value1] = {
			CFrame = AllTransformsForAsset[value1],
			scale = MeshScalesModule[value1]
		}
	end
	return t
end

return AssetCalculatorModule