local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local calculateMinMaxModule = require(parent.util.calculateMinMax)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local getPartNamesInHierarchyOrderModule = require(parent.util.getPartNamesInHierarchyOrder)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {
	calculateBounds = function(p1, p2, p3, p4, p5)
		-- upvalues: getExpectedPartSizeModule (ref), calculateMinMaxModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
		if p5 then
			local var1 = getExpectedPartSizeModule(p2, p5)
			local var2, var3 = calculateMinMaxModule(p4.minMeshCorner, p4.maxMeshCorner, p3:PointToWorldSpace(-(var1 / 2)), p3:PointToWorldSpace(-(var1 / 2)))
			p4.minMeshCorner = var2
			p4.maxMeshCorner = var3
			local var4, var5 = calculateMinMaxModule(p4.minMeshCorner, p4.maxMeshCorner, p3:PointToWorldSpace(var1 / 2), p3:PointToWorldSpace(var1 / 2))
			p4.minMeshCorner = var4
			p4.maxMeshCorner = var5
		else
			local var6, var7 = calculateMinMaxModule(p4.minMeshCorner, p4.maxMeshCorner, p3:PointToWorldSpace(-(p2.Size / 2)), p3:PointToWorldSpace(-(p2.Size / 2)))
			p4.minMeshCorner = var6
			p4.maxMeshCorner = var7
			local var8, var9 = calculateMinMaxModule(p4.minMeshCorner, p4.maxMeshCorner, p3:PointToWorldSpace(p2.Size / 2), p3:PointToWorldSpace(p2.Size / 2))
			p4.minMeshCorner = var8
			p4.maxMeshCorner = var9
		end
		for i, v in constantsInterfaceModule.getAttachments(p1, p2.Name) do
			local var10 = p2:FindFirstChild(v, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(var10)
			
			if string.match(var10.Name, "RigAttachment$") ~= nil then
				local var11 = p3 * getAttachmentCFrameInPartSpaceModule(var10)
				local var12, var13 = calculateMinMaxModule(p4.minRigAttachment, p4.maxRigAttachment, var11.Position, var11.Position)
				p4.minRigAttachment = var12
				p4.maxRigAttachment = var13
			end
		end
		local var14, var15 = calculateMinMaxModule(p4.minOverall, p4.maxOverall, p4.minMeshCorner, p4.maxMeshCorner)
		p4.minOverall = var14
		p4.maxOverall = var15
		local var16, var17 = calculateMinMaxModule(p4.minOverall, p4.maxOverall, p4.minRigAttachment, p4.maxRigAttachment)
		p4.minOverall = var16
		p4.maxOverall = var17
	end
}

function t.traverseHierarchy(p6, p7, p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), t (ref)
	local cFrame
	assert(p6 ~= nil ~= ((p7 and p8) ~= nil))
	local var18 = if p6 then p6[p11] else p7:FindFirstChild(p11)
	assert(var18)
	
	if p9 then
		local var19 = if p6 then p6[p9] else p7:FindFirstChild(p9)
		assert(var19)
		local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p8, p11)
		local var20 = var19:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var20)
		local var21 = var18:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var21)
		cFrame = p10 * getAttachmentCFrameInPartSpaceModule(var20) * getAttachmentCFrameInPartSpaceModule(var21):Inverse()
	else
		cFrame = CFrame.new()
	end
	t.calculateBounds(p8, var18, cFrame, p13, p14)
	
	if p12.children then
		for i, v in p12.children do
			t.traverseHierarchy(p6, p7, p8, p11, cFrame, i, v, p13, p14)
		end
	end
end

local var22 = nil

local function initRigParentToChild()
	-- upvalues: var22 (write), getPartNamesInHierarchyOrderModule (ref)
	if var22 then return end
	var22 = {}
	
	for i, v in {
		Enum.AssetType.LeftArm,
		Enum.AssetType.RightArm,
		Enum.AssetType.LeftLeg,
		Enum.AssetType.RightLeg
	} do
		local var23 = getPartNamesInHierarchyOrderModule(v)
		var22[v] = {}
		
		for i_1 = 1, #var23 - 1 do
			var22[v][var23[i_1]] = var23[i_1 + 1]
		end
	end
end

function t.getAssetRigChild(value, p15)
	-- upvalues: initRigParentToChild (ref), var22 (write)
	initRigParentToChild()
	
	return assert(var22[value], "Invalid asset type")[p15]
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