local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local CalculateMinMaxModule = require(Parent.util.calculateMinMax)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local GetPartNamesInHierarchyOrderModule = require(Parent.util.getPartNamesInHierarchyOrder)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
local AssetTraversalUtils = {
	calculateBounds = function(p1, Child, CF, p2, p3)
		-- upvalues: GetExpectedPartSizeModule (copy), CalculateMinMaxModule (copy), ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy)
		if p3 then
			local ExpectedPartSizeModule: number = GetExpectedPartSizeModule(Child, p3)
			p2.minMeshCorner, p2.maxMeshCorner = CalculateMinMaxModule(p2.minMeshCorner, p2.maxMeshCorner, CF:PointToWorldSpace(-(ExpectedPartSizeModule / 2)), CF:PointToWorldSpace(-(ExpectedPartSizeModule / 2)))
			p2.minMeshCorner, p2.maxMeshCorner = CalculateMinMaxModule(p2.minMeshCorner, p2.maxMeshCorner, CF:PointToWorldSpace(ExpectedPartSizeModule / 2), CF:PointToWorldSpace(ExpectedPartSizeModule / 2))
		else
			p2.minMeshCorner, p2.maxMeshCorner = CalculateMinMaxModule(p2.minMeshCorner, p2.maxMeshCorner, CF:PointToWorldSpace(-(Child.Size / 2)), CF:PointToWorldSpace(-(Child.Size / 2)))
			p2.minMeshCorner, p2.maxMeshCorner = CalculateMinMaxModule(p2.minMeshCorner, p2.maxMeshCorner, CF:PointToWorldSpace(Child.Size / 2), CF:PointToWorldSpace(Child.Size / 2))
		end
		for _, ChildName in ConstantsInterfaceModule.getAttachments(p1, Child.Name) do
			local Child1 = Child:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(Child1)
			
			if string.match(Child1.Name, "RigAttachment$") ~= nil then
				local ScaledCF = CF * GetAttachmentCFrameInPartSpaceModule(Child1)
				p2.minRigAttachment, p2.maxRigAttachment = CalculateMinMaxModule(p2.minRigAttachment, p2.maxRigAttachment, ScaledCF.Position, ScaledCF.Position)
			end
		end
		p2.minOverall, p2.maxOverall = CalculateMinMaxModule(p2.minOverall, p2.maxOverall, p2.minMeshCorner, p2.maxMeshCorner)
		p2.minOverall, p2.maxOverall = CalculateMinMaxModule(p2.minOverall, p2.maxOverall, p2.minRigAttachment, p2.maxRigAttachment)
	end
}

function AssetTraversalUtils.traverseHierarchy(p4, Object, p5, ChildName, ScaledInverted, ChildName1, p6, p7, p8)
	-- upvalues: ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), AssetTraversalUtils (copy)
	assert(p4 ~= nil ~= ((Object and p5) ~= nil))
	local ChildName2 = if p4 then p4[ChildName1] else Object:FindFirstChild(ChildName1)
	assert(ChildName2)
	local ScaledScaledInverted = nil
	
	if ChildName then
		local ChildName3 = if p4 then p4[ChildName] else Object:FindFirstChild(ChildName)
		assert(ChildName3)
		local RigAttachmentToParent = ConstantsInterfaceModule.getRigAttachmentToParent(p5, ChildName1)
		local RigAttachmentToParent1 = ChildName3:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(RigAttachmentToParent1)
		local RigAttachmentToParent2 = ChildName2:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(RigAttachmentToParent2)
		ScaledScaledInverted = ScaledInverted * GetAttachmentCFrameInPartSpaceModule(RigAttachmentToParent1) * GetAttachmentCFrameInPartSpaceModule(RigAttachmentToParent2):Inverse()
	else
		ScaledScaledInverted = CFrame.new()
	end
	AssetTraversalUtils.calculateBounds(p5, ChildName2, ScaledScaledInverted, p7, p8)
	
	if p6.children then
		for i, child in p6.children do
			AssetTraversalUtils.traverseHierarchy(p4, Object, p5, ChildName1, ScaledScaledInverted, i, child, p7, p8)
		end
	end
end

local T = nil

local function initRigParentToChild()
	-- upvalues: T (ref), GetPartNamesInHierarchyOrderModule (copy)
	if T then return end
	T = {}
	
	for _, value in {
		Enum.AssetType.LeftArm,
		Enum.AssetType.RightArm,
		Enum.AssetType.LeftLeg,
		Enum.AssetType.RightLeg
	} do
		local PartNamesInHierarchyOrderModule = GetPartNamesInHierarchyOrderModule(value)
		T[value] = {}
		
		for i = 1, #PartNamesInHierarchyOrderModule - 1 do
			T[value][PartNamesInHierarchyOrderModule[i]] = PartNamesInHierarchyOrderModule[i + 1]
		end
	end
end

function AssetTraversalUtils.getAssetRigChild(p9, p10)
	-- upvalues: initRigParentToChild (copy), T (ref)
	initRigParentToChild()
	
	return assert(T[p9], "Invalid asset type")[p10]
end

AssetTraversalUtils.assetHierarchy = {
	[Enum.AssetType.DynamicHead] = { root = "Head" },
	[Enum.AssetType.Torso] = { root = "LowerTorso", children = { UpperTorso = {} } },
	[Enum.AssetType.LeftArm] = {
		root = "LeftUpperArm",
		children = { LeftLowerArm = { children = { LeftHand = {} } } }
	},
	[Enum.AssetType.RightArm] = {
		root = "RightUpperArm",
		children = { RightLowerArm = { children = { RightHand = {} } } }
	},
	[Enum.AssetType.LeftLeg] = {
		root = "LeftUpperLeg",
		children = { LeftLowerLeg = { children = { LeftFoot = {} } } }
	},
	[Enum.AssetType.RightLeg] = {
		root = "RightUpperLeg",
		children = { RightLowerLeg = { children = { RightFoot = {} } } }
	}
}

return AssetTraversalUtils