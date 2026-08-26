local parent = script.Parent.Parent
local cryoModule = require(parent.Parent.Cryo)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local _ = require(parent.util.Types)
local canBeNormalizedModule = require(parent.util.canBeNormalized)
local getPartNamesInHierarchyOrderModule = require(parent.util.getPartNamesInHierarchyOrder)
local assetTraversalUtilsModule = require(parent.util.AssetTraversalUtils)
local getMeshScalesModule = require(parent.util.getMeshScales)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {
	root = "LowerTorso",
	children = {
		UpperTorso = {
			children = {
				Head = assetTraversalUtilsModule.assetHierarchy[Enum.AssetType.DynamicHead],
				LeftUpperArm = assetTraversalUtilsModule.assetHierarchy[Enum.AssetType.LeftArm],
				RightUpperArm = assetTraversalUtilsModule.assetHierarchy[Enum.AssetType.RightArm]
			}
		},
		LeftUpperLeg = assetTraversalUtilsModule.assetHierarchy[Enum.AssetType.LeftLeg],
		RightUpperLeg = assetTraversalUtilsModule.assetHierarchy[Enum.AssetType.RightLeg]
	}
}
local t_1 = { root = "HumanoidRootPart", children = { LowerTorso = t } }
local t_2 = {}

local function calculateCFrame(p1, p2)
	-- upvalues: canBeNormalizedModule (ref)
	local var1 = p1 - p2
	
	if not canBeNormalizedModule(var1) then return end
	var1 = var1.Unit
	local unit = var1:Cross(Vector3.new(0, 0, 1)).Unit
	
	if not canBeNormalizedModule(unit) then
		unit = var1:Cross(if var1.Z < 0 then Vector3.new(0, 1, 0) else Vector3.new(0, -1, 0)).Unit
	end
	return CFrame.fromMatrix(p1, unit, var1, unit:Cross(var1).Unit)
end

local function calculatePartTransformInHierarchy(a, b, p1, p2, p3)
	-- upvalues: constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local var1 = if p3 and p3[a.Name] then p3[a.Name] else CFrame.new()
	local var2 = p1
	
	if b then
		local var3 = p2(b)
		assert(var3)
		local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(nil, a.Name)
		local var4 = var3:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var4)
		local var5 = a:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var5)
		
		return var2 * getAttachmentCFrameInPartSpaceModule(var4) * var1 * getAttachmentCFrameInPartSpaceModule(var5):Inverse()
	end
	return var1
end

local function calculateHierarchyTransforms(p1, p2, p3)
	-- upvalues: calculatePartTransformInHierarchy (ref)
	local t = {}
	
	local function calculateAllTransformsInternal(p4, p5, p6, p7)
		-- upvalues: p2 (ref), calculatePartTransformInHierarchy (copy), p3 (ref), t (ref), calculateAllTransformsInternal (ref)
		local var1 = p2(p4)
		assert(var1)
		local var2 = calculatePartTransformInHierarchy(var1, p5, p7, p2, p3)
		t[var1.Name] = var2
		
		if not p6.children then return end
		for i, v in p6.children do
			calculateAllTransformsInternal(i, p4, v, var2)
		end
	end
	
	calculateAllTransformsInternal(p1.root, nil, p1, CFrame.new())
	
	return t
end

local function _(p4, p5)
	return CFrame.new(p4.Rotation:Inverse() * (p5.Position - p4.Position)) * (p4.Rotation:Inverse() * p5.Rotation)
end

local function calculateAssetCFrameFromPartsCFrames(value, p4)
	-- upvalues: getPartNamesInHierarchyOrderModule (ref), calculateCFrame (ref)
	local var1 = getPartNamesInHierarchyOrderModule(value)
	
	return calculateCFrame(p4[var1[1]].Position, p4[var1[3]].Position)
end

local _ = function(p4)
	assert(if p4 ~= Enum.AssetType.LeftArm then if p4 ~= Enum.AssetType.RightArm then if p4 ~= Enum.AssetType.LeftLeg then p4 == Enum.AssetType.RightLeg else true else true else true)
end

local _ = function(p4, p5, p6)
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local var1 = p4:FindFirstChild(p5, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(var1)
	
	return p6 * getAttachmentCFrameInPartSpaceModule(var1)
end

function t_2.calculatePartCFrameFromRigAttachments(p4, p5, p6)
	-- upvalues: constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), assetTraversalUtilsModule (ref), calculateCFrame (ref)
	assert(if p4 ~= Enum.AssetType.LeftArm then if p4 ~= Enum.AssetType.RightArm then if p4 ~= Enum.AssetType.LeftLeg then p4 == Enum.AssetType.RightLeg else true else true else true)
	local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p4, p5.Name)
	
	if rigAttachmentToParent == "" then return end
	local var1 = p5:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(var1)
	local var2 = p6 * getAttachmentCFrameInPartSpaceModule(var1)
	local assetRigChild = assetTraversalUtilsModule.getAssetRigChild(p4, p5.Name)
	
	if assetRigChild then
		local var3 = p5:FindFirstChild(constantsInterfaceModule.getRigAttachmentToParent(p4, assetRigChild), r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var3)
		
		return calculateCFrame(var2.Position, (p6 * getAttachmentCFrameInPartSpaceModule(var3)).Position)
	end
end

function t_2.calculateStraightenedLimb(p4, p5, p6)
	-- upvalues: cryoModule (ref), getPartNamesInHierarchyOrderModule (ref), assetTraversalUtilsModule (ref), t_2 (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	assert(if p4 ~= Enum.AssetType.LeftArm then if p4 ~= Enum.AssetType.RightArm then if p4 ~= Enum.AssetType.LeftLeg then p4 == Enum.AssetType.RightLeg else true else true else true)
	local var1 = cryoModule.Dictionary.join(p5)
	local position = nil
	local cFrame = CFrame.new()
	
	for i, v in getPartNamesInHierarchyOrderModule(p4) do
		local var2 = p6(v)
		local var3 = cFrame
		local assetRigChild = assetTraversalUtilsModule.getAssetRigChild(p4, v)
		local var4 = assetRigChild == nil
		
		if not var4 then
			var3 = t_2.calculatePartCFrameFromRigAttachments(p4, var2, p5[v]) or var3
		end
		local var5 = var3
		local var6 = p5[v]
		var1[v] = CFrame.new(var5.Rotation:Inverse() * (var6.Position - var5.Position)) * (var5.Rotation:Inverse() * var6.Rotation)
		
		if position then
			local var7 = var1[v]
			local var8 = var2:FindFirstChild(constantsInterfaceModule.getRigAttachmentToParent(p4, v), r15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(var8)
			var1[v] = CFrame.new(var1[v].Position + (position - (var7 * getAttachmentCFrameInPartSpaceModule(var8)).Position)) * var1[v].Rotation
		end
		if not var4 then
			cFrame = var3
			local var9 = var1[v]
			local var10 = var2:FindFirstChild(constantsInterfaceModule.getRigAttachmentToParent(p4, assetRigChild), r15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(var10)
			position = (var9 * getAttachmentCFrameInPartSpaceModule(var10)).Position
		end
	end
	return var1
end

function t_2.calculateAssetCFrame(value, p7)
	-- upvalues: t_2 (ref), calculateAssetCFrameFromPartsCFrames (ref)
	local var11 = t_2.calculateAllTransformsForAsset(value, p7)
	
	return if Enum.AssetType.DynamicHead == value then var11.Head elseif Enum.AssetType.Torso == value then var11.LowerTorso else calculateAssetCFrameFromPartsCFrames(value, var11)
end

function t_2.calculateAllTransformsForAsset(value, p7)
	-- upvalues: calculateHierarchyTransforms (ref), assetTraversalUtilsModule (ref)
	return if Enum.AssetType.DynamicHead == value then { Head = CFrame.new() } else calculateHierarchyTransforms(assetTraversalUtilsModule.assetHierarchy[value], function(p8)
		-- upvalues: p7 (ref)
		return p7:FindFirstChild(p8)
	end)
end

function t_2.calculateAllTransformsForFullBody(p7, p8)
	-- upvalues: t_1 (ref), t (ref), calculateHierarchyTransforms (ref)
	return calculateHierarchyTransforms(if p8 then t_1 else t, function(p9)
		-- upvalues: p7 (ref)
		return p7[p9]
	end, p8)
end

function t_2.calculatePartsLocalToAsset(value, p7)
	-- upvalues: getPartNamesInHierarchyOrderModule (ref), calculateCFrame (ref)
	assert(if value ~= Enum.AssetType.LeftArm then if value ~= Enum.AssetType.RightArm then if value ~= Enum.AssetType.LeftLeg then value == Enum.AssetType.RightLeg else true else true else true)
	local var11 = getPartNamesInHierarchyOrderModule(value)
	local var12 = calculateCFrame(p7[var11[1]].Position, p7[var11[3]].Position)
	local t = {}
	
	for i, v in getPartNamesInHierarchyOrderModule(value) do
		local var13
		if var12 then
			local var14 = p7[v]
			var13 = CFrame.new(var12.Rotation:Inverse() * (var14.Position - var12.Position)) * (var12.Rotation:Inverse() * var14.Rotation)
		else
			var13 = p7[v]
		end
		t[v] = var13
	end
	return t
end

function t_2.getBodyPartsToParents()
	-- upvalues: t (ref)
	local t_1 = {}
	
	local function calculateAllTransformsInternal(p8, p9, p10)
		-- upvalues: t_1 (ref), calculateAllTransformsInternal (ref)
		t_1[p8] = p9 or "HumanoidRootPart"
		
		if not p10.children then return end
		for i, v in p10.children do
			calculateAllTransformsInternal(i, p8, v)
		end
	end
	
	local root = t.root
	t_1[root] = "HumanoidRootPart"
	
	if not t.children then
		return t_1
	end
	for i, v in t.children do
		calculateAllTransformsInternal(i, root, v)
	end
	return t_1
end

function t_2.getAssetMeshesValidationSpaceTransforms(value, p11)
	-- upvalues: t_2 (ref), getMeshScalesModule (ref)
	local assetTypeEnum = p11.assetTypeEnum
	assert(assetTypeEnum)
	local t = {}
	
	if assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(t, value.Name)
	else
		for i, v in value:GetChildren() do
			if v:IsA("MeshPart") then
				table.insert(t, v.Name)
			end
		end
	end
	local var15 = t_2.calculateAllTransformsForAsset(assetTypeEnum, value)
	
	local function findMeshHandle(p12)
		-- upvalues: assetTypeEnum (ref), value (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then value else value:FindFirstChild(p12)
	end
	
	if assetTypeEnum ~= Enum.AssetType.DynamicHead and assetTypeEnum ~= Enum.AssetType.Torso then
		for i, v in t_2.calculateStraightenedLimb(assetTypeEnum, var15, findMeshHandle) do
			var15[i] = v
		end
	end
	local var16 = getMeshScalesModule(t, findMeshHandle, p11)
	local t_1 = {}
	
	for i, v in t do
		t_1[v] = { CFrame = var15[v], scale = var16[v] }
	end
	return t_1
end

return t_2