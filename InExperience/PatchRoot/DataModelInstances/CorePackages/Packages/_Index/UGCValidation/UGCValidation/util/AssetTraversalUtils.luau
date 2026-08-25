local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local calculateMinMaxModule = require(parent.util.calculateMinMax)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local getPartNamesInHierarchyOrderModule = require(parent.util.getPartNamesInHierarchyOrder)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {
	calculateBounds = function(p0, p1, p2, p3, p4)
		-- upvalues: getExpectedPartSizeModule (ref), calculateMinMaxModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
		if p4 then
			local var9 = getExpectedPartSizeModule(p1, p4)
			local var10, var11 = calculateMinMaxModule(p3.minMeshCorner, p3.maxMeshCorner, p2:PointToWorldSpace(-(var9 / 2)), p2:PointToWorldSpace(-(var9 / 2)))
			p3.minMeshCorner = var10
			p3.maxMeshCorner = var11
			local var12, var13 = calculateMinMaxModule(p3.minMeshCorner, p3.maxMeshCorner, p2:PointToWorldSpace(var9 / 2), p2:PointToWorldSpace(var9 / 2))
			p3.minMeshCorner = var12
			p3.maxMeshCorner = var13
		else
			local var14, var15 = calculateMinMaxModule(p3.minMeshCorner, p3.maxMeshCorner, p2:PointToWorldSpace(-(p1.Size / 2)), p2:PointToWorldSpace(-(p1.Size / 2)))
			p3.minMeshCorner = var14
			p3.maxMeshCorner = var15
			local var16, var17 = calculateMinMaxModule(p3.minMeshCorner, p3.maxMeshCorner, p2:PointToWorldSpace(p1.Size / 2), p2:PointToWorldSpace(p1.Size / 2))
			p3.minMeshCorner = var16
			p3.maxMeshCorner = var17
		end
		for i, v in constantsInterfaceModule.getAttachments(p0, p1.Name) do
			local var22 = p1:FindFirstChild(v, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(var22)
			
			if string.match(var22.Name, "RigAttachment$") ~= nil then
				local var23 = p2 * getAttachmentCFrameInPartSpaceModule(var22)
				local var24, var25 = calculateMinMaxModule(p3.minRigAttachment, p3.maxRigAttachment, var23.Position, var23.Position)
				p3.minRigAttachment = var24
				p3.maxRigAttachment = var25
			end
		end
		local var18, var19 = calculateMinMaxModule(p3.minOverall, p3.maxOverall, p3.minMeshCorner, p3.maxMeshCorner)
		p3.minOverall = var18
		p3.maxOverall = var19
		local var20, var21 = calculateMinMaxModule(p3.minOverall, p3.maxOverall, p3.minRigAttachment, p3.maxRigAttachment)
		p3.minOverall = var20
		p3.maxOverall = var21
	end
}

function t.traverseHierarchy(p5, p6, p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), t (ref)
	local cFrame
	assert(p5 ~= nil ~= ((p6 and p7) ~= nil))
	local var26 = if p5 then p5[p10] else p6:FindFirstChild(p10)
	assert(var26)
	
	if p8 then
		local var28 = if p5 then p5[p8] else p6:FindFirstChild(p8)
		assert(var28)
		local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p7, p10)
		local var30 = var28:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var30)
		local var31 = var26:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var31)
		cFrame = p9 * getAttachmentCFrameInPartSpaceModule(var30) * getAttachmentCFrameInPartSpaceModule(var31):Inverse()
	else
		cFrame = CFrame.new()
	end
	t.calculateBounds(p7, var26, cFrame, p12, p13)
	
	if p11.children then
		for i, v in p11.children do
			t.traverseHierarchy(p5, p6, p7, p10, cFrame, i, v, p12, p13)
		end
	end
end

local var7 = nil

local function initRigParentToChild()
	-- upvalues: var7 (write), getPartNamesInHierarchyOrderModule (ref)
	if var7 then return end
	var7 = {}
	
	for i, v in {
		Enum.AssetType.LeftArm,
		Enum.AssetType.RightArm,
		Enum.AssetType.LeftLeg,
		Enum.AssetType.RightLeg
	} do
		local var32 = getPartNamesInHierarchyOrderModule(v)
		var7[v] = {}
		
		for i_1 = 1, #var32 - 1 do
			var7[v][var32[i_1]] = var32[i_1 + 1]
		end
	end
end

function t.getAssetRigChild(value, p14)
	-- upvalues: initRigParentToChild (ref), var7 (write)
	initRigParentToChild()
	
	return assert(var7[value], "Invalid asset type")[p14]
end

t.assetHierarchy = {
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

return t