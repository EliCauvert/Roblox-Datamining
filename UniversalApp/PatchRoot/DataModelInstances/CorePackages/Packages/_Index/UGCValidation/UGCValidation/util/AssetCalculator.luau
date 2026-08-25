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

local function calculateCFrame(p0, p1)
	-- upvalues: canBeNormalizedModule (ref)
	local var15 = p0 - p1
	
	if not canBeNormalizedModule(var15) then return end
	var15 = var15.Unit
	local unit = var15:Cross(Vector3.new(0, 0, 1)).Unit
	
	if not canBeNormalizedModule(unit) then
		unit = var15:Cross(if var15.Z < 0 then Vector3.new(0, 1, 0) else Vector3.new(0, -1, 0)).Unit
	end
	return CFrame.fromMatrix(p0, unit, var15, unit:Cross(var15).Unit)
end

local function calculatePartTransformInHierarchy(a, b, p2, p3, p4)
	-- upvalues: constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local var16 = if p4 and p4[a.Name] then p4[a.Name] else CFrame.new()
	local var17 = p2
	
	if b then
		local var18 = p3(b)
		assert(var18)
		local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(nil, a.Name)
		local var20 = var18:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var20)
		local var21 = a:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var21)
		
		return var17 * getAttachmentCFrameInPartSpaceModule(var20) * var16 * getAttachmentCFrameInPartSpaceModule(var21):Inverse()
	end
	return var16
end

local function calculateHierarchyTransforms(p5, p6, p7)
	-- upvalues: calculatePartTransformInHierarchy (ref)
	local t = {}
	
	local function calculateAllTransformsInternal(p8, p9, p10, p11)
		-- upvalues: p6 (ref), calculatePartTransformInHierarchy (copy), p7 (ref), t (ref), calculateAllTransformsInternal (ref)
		local var24 = p6(p8)
		assert(var24)
		local var25 = calculatePartTransformInHierarchy(var24, p9, p11, p6, p7)
		t[var24.Name] = var25
		
		if not p10.children then return end
		for i, v in p10.children do
			calculateAllTransformsInternal(i, p8, v, var25)
		end
	end
	
	calculateAllTransformsInternal(p5.root, nil, p5, CFrame.new())
	
	return t
end

local function _(p12, p13)
	return CFrame.new(p12.Rotation:Inverse() * (p13.Position - p12.Position)) * (p12.Rotation:Inverse() * p13.Rotation)
end

local function calculateAssetCFrameFromPartsCFrames(value, p14)
	-- upvalues: getPartNamesInHierarchyOrderModule (ref), calculateCFrame (ref)
	local var26 = getPartNamesInHierarchyOrderModule(value)
	
	return calculateCFrame(p14[var26[1]].Position, p14[var26[3]].Position)
end

local _ = function(p15)
	assert(if p15 ~= Enum.AssetType.LeftArm then if p15 ~= Enum.AssetType.RightArm then if p15 ~= Enum.AssetType.LeftLeg then p15 == Enum.AssetType.RightLeg else true else true else true)
end

local _ = function(p16, p17, p18)
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local var27 = p16:FindFirstChild(p17, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(var27)
	
	return p18 * getAttachmentCFrameInPartSpaceModule(var27)
end

function t_2.calculatePartCFrameFromRigAttachments(p19, p20, p21)
	-- upvalues: constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), assetTraversalUtilsModule (ref), calculateCFrame (ref)
	assert(if p19 ~= Enum.AssetType.LeftArm then if p19 ~= Enum.AssetType.RightArm then if p19 ~= Enum.AssetType.LeftLeg then p19 == Enum.AssetType.RightLeg else true else true else true)
	local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p19, p20.Name)
	
	if rigAttachmentToParent == "" then return end
	local var29 = p20:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(var29)
	local var30 = p21 * getAttachmentCFrameInPartSpaceModule(var29)
	local assetRigChild = assetTraversalUtilsModule.getAssetRigChild(p19, p20.Name)
	
	if assetRigChild then
		local var32 = p20:FindFirstChild(constantsInterfaceModule.getRigAttachmentToParent(p19, assetRigChild), r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var32)
		
		return calculateCFrame(var30.Position, (p21 * getAttachmentCFrameInPartSpaceModule(var32)).Position)
	end
end

function t_2.calculateStraightenedLimb(p22, p23, p24)
	-- upvalues: cryoModule (ref), getPartNamesInHierarchyOrderModule (ref), assetTraversalUtilsModule (ref), t_2 (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	assert(if p22 ~= Enum.AssetType.LeftArm then if p22 ~= Enum.AssetType.RightArm then if p22 ~= Enum.AssetType.LeftLeg then p22 == Enum.AssetType.RightLeg else true else true else true)
	local var33 = cryoModule.Dictionary.join(p23)
	local position = nil
	local cFrame = CFrame.new()
	
	for i, v in getPartNamesInHierarchyOrderModule(p22) do
		local var35 = p24(v)
		local var36 = cFrame
		local assetRigChild = assetTraversalUtilsModule.getAssetRigChild(p22, v)
		local var38 = assetRigChild == nil
		
		if not var38 then
			var36 = t_2.calculatePartCFrameFromRigAttachments(p22, var35, p23[v]) or var36
		end
		local var39 = var36
		local var40 = p23[v]
		var33[v] = CFrame.new(var39.Rotation:Inverse() * (var40.Position - var39.Position)) * (var39.Rotation:Inverse() * var40.Rotation)
		
		if position then
			local var41 = var33[v]
			local var42 = var35:FindFirstChild(constantsInterfaceModule.getRigAttachmentToParent(p22, v), r15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(var42)
			var33[v] = CFrame.new(var33[v].Position + (position - (var41 * getAttachmentCFrameInPartSpaceModule(var42)).Position)) * var33[v].Rotation
		end
		if not var38 then
			cFrame = var36
			local var43 = var33[v]
			local var44 = var35:FindFirstChild(constantsInterfaceModule.getRigAttachmentToParent(p22, assetRigChild), r15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(var44)
			position = (var43 * getAttachmentCFrameInPartSpaceModule(var44)).Position
		end
	end
	return var33
end

function t_2.calculateAssetCFrame(value, p25)
	-- upvalues: t_2 (ref), calculateAssetCFrameFromPartsCFrames (ref)
	local var45 = t_2.calculateAllTransformsForAsset(value, p25)
	
	return if Enum.AssetType.DynamicHead == value then var45.Head elseif Enum.AssetType.Torso == value then var45.LowerTorso else calculateAssetCFrameFromPartsCFrames(value, var45)
end

function t_2.calculateAllTransformsForAsset(value, p26)
	-- upvalues: calculateHierarchyTransforms (ref), assetTraversalUtilsModule (ref)
	return if Enum.AssetType.DynamicHead == value then { Head = CFrame.new() } else calculateHierarchyTransforms(assetTraversalUtilsModule.assetHierarchy[value], function(p27)
		-- upvalues: p26 (ref)
		return p26:FindFirstChild(p27)
	end)
end

function t_2.calculateAllTransformsForFullBody(p28, p29)
	-- upvalues: t_1 (ref), t (ref), calculateHierarchyTransforms (ref)
	return calculateHierarchyTransforms(if p29 then t_1 else t, function(p30)
		-- upvalues: p28 (ref)
		return p28[p30]
	end, p29)
end

function t_2.calculatePartsLocalToAsset(value, p31)
	-- upvalues: getPartNamesInHierarchyOrderModule (ref), calculateCFrame (ref)
	assert(if value ~= Enum.AssetType.LeftArm then if value ~= Enum.AssetType.RightArm then if value ~= Enum.AssetType.LeftLeg then value == Enum.AssetType.RightLeg else true else true else true)
	local var46 = getPartNamesInHierarchyOrderModule(value)
	local var47 = calculateCFrame(p31[var46[1]].Position, p31[var46[3]].Position)
	local t = {}
	
	for i, v in getPartNamesInHierarchyOrderModule(value) do
		local var50
		if var47 then
			local var49 = p31[v]
			var50 = CFrame.new(var47.Rotation:Inverse() * (var49.Position - var47.Position)) * (var47.Rotation:Inverse() * var49.Rotation)
		else
			var50 = p31[v]
		end
		t[v] = var50
	end
	return t
end

function t_2.getBodyPartsToParents()
	-- upvalues: t (ref)
	local t_1 = {}
	
	local function calculateAllTransformsInternal(p32, p33, p34)
		-- upvalues: t_1 (ref), calculateAllTransformsInternal (ref)
		t_1[p32] = p33 or "HumanoidRootPart"
		
		if not p34.children then return end
		for i, v in p34.children do
			calculateAllTransformsInternal(i, p32, v)
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

function t_2.getAssetMeshesValidationSpaceTransforms(value, p35)
	-- upvalues: t_2 (ref), getMeshScalesModule (ref)
	local assetTypeEnum = p35.assetTypeEnum
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
	local var54 = t_2.calculateAllTransformsForAsset(assetTypeEnum, value)
	
	local function findMeshHandle(p36)
		-- upvalues: assetTypeEnum (ref), value (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then value else value:FindFirstChild(p36)
	end
	
	if assetTypeEnum ~= Enum.AssetType.DynamicHead and assetTypeEnum ~= Enum.AssetType.Torso then
		for i, v in t_2.calculateStraightenedLimb(assetTypeEnum, var54, findMeshHandle) do
			var54[i] = v
		end
	end
	local var56 = getMeshScalesModule(t, findMeshHandle, p35)
	local t_1 = {}
	
	for i, v in t do
		t_1[v] = { CFrame = var54[v], scale = var56[v] }
	end
	return t_1
end

return t_2