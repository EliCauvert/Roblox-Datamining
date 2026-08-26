local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local getPartNamesInHierarchyOrderModule = require(parent.util.getPartNamesInHierarchyOrder)
local getMeshVertsModule = require(parent.util.getMeshVerts)
local getMeshInfoModule = require(parent.util.getMeshInfo)
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local getFFlagUGCValidateLegFullBodySeparationModule = require(parent.flags.getFFlagUGCValidateLegFullBodySeparation)
local getFFlagUGCValidateMigrateBodyPartBoundsModule = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {}

local function orientSingleAssetToWorldAxes(value, p1, p2)
	-- upvalues: assetCalculatorModule (ref)
	if p1 ~= Enum.AssetType.LeftArm and p1 ~= Enum.AssetType.RightArm and (p1 ~= Enum.AssetType.LeftLeg and p1 ~= Enum.AssetType.RightLeg) then return end
	for i, v in assetCalculatorModule.calculateStraightenedLimb(p1, value, p2) do
		value[i] = v
	end
end

local function orientFullBodyArmsLegsToWorldAxes(p3, p4)
	-- upvalues: orientSingleAssetToWorldAxes (ref), getPartNamesInHierarchyOrderModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local function orientAndMoveParts(p5, p6)
		-- upvalues: orientSingleAssetToWorldAxes (copy), p3 (ref), p4 (ref), getPartNamesInHierarchyOrderModule (copy), constantsInterfaceModule (copy), r15plusUtilsModule (copy), getAttachmentCFrameInPartSpaceModule (copy)
		orientSingleAssetToWorldAxes(p3, p5, p4)
		local var1 = getPartNamesInHierarchyOrderModule(p5)
		local var2 = p4(var1[1])
		local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p5, var2.Name)
		local var3 = var2:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var3)
		local var4 = p3[var2.Name] * getAttachmentCFrameInPartSpaceModule(var3)
		local var5 = p4(p6)
		assert(var5)
		local var6 = var5:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var6)
		local var7 = (p3[var5.Name] * getAttachmentCFrameInPartSpaceModule(var6)).Position - var4.Position
		
		for i, v in var1 do
			p3[v] = CFrame.new(p3[v].Position + var7) * p3[v].Rotation
		end
	end
	
	orientAndMoveParts(Enum.AssetType.LeftArm, "UpperTorso")
	orientAndMoveParts(Enum.AssetType.RightArm, "UpperTorso")
	orientAndMoveParts(Enum.AssetType.LeftLeg, "LowerTorso")
	orientAndMoveParts(Enum.AssetType.RightLeg, "LowerTorso")
end

local function calculateBoundsDataForPart(p5, p6, p7, p8, p9)
	-- upvalues: getExpectedPartSizeModule (ref), getMeshVertsModule (ref), boundsDataUtilsModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	assert(p5 ~= nil ~= (p9 ~= nil))
	local var1 = getExpectedPartSizeModule(p6, p8) / p6.MeshSize
	local var2 = nil
	
	if p9 then
		if p9.meshData and p9.meshData[p6.MeshId] then
			local verts = p9.meshData[p6.MeshId].verts
			
			if verts then
				var2 = verts
			end
		end
		if not var2 then
			return false, { "Verts not found in data cache" }
		elseif not var2 then
			local var3, var4, var5 = getMeshVertsModule(p5, p8)
			
			if not var3 then
				return var3, var4
			end
			var2 = var5
		end
		local t = {}
		
		for i, v in var2 do
			boundsDataUtilsModule.expandMeshBounds(t, p7:PointToWorldSpace(v * var1))
		end
		for i, v_1 in constantsInterfaceModule.getAttachments(nil, p6.Name) do
			if string.match(v_1, "RigAttachment$") ~= nil then
				local var6 = p6:FindFirstChild(v_1, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
				assert(var6)
				boundsDataUtilsModule.expandRigAttachmentBounds(t, (p7 * getAttachmentCFrameInPartSpaceModule(var6)).Position)
			end
		end
		boundsDataUtilsModule.setOverallBounds(t)
		
		return true, nil, t
	end
end

local function buildValidationContextFromRenderMeshes(p10, p11, p12)
	local t = {}
	local descendants = p10:GetDescendants()
	table.insert(descendants, p10)
	
	for i, v in descendants do
		local name = p12[v.Name]
		
		if name and name.editable then
			t[v] = {
				MeshId = {
					instance = name.editable,
					created = name.createdInValidation or false
				}
			}
		end
	end
	return { assetTypeEnum = p11, editableMeshes = t }
end

local function calculateAllPartsBoundsData(p13, p14, p15, p16)
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), calculateBoundsDataForPart (ref)
	local t = {}
	
	for i, v in p13 do
		local var7
		local var8 = p14(i)
		local var9 = nil
		
		if not p16 then
			var7 = nil
			local _ = nil
			local _ = nil
			local var10, var11, var12 = getMeshInfoModule(var8, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p15)
			var7 = var10
			local var13 = var11
			local var14 = var12
			
			if var7 then
				var9 = var14
			end
			return var7, var13
		end
		var7, var47, var48 = calculateBoundsDataForPart(var9, var8, v, p15, p16)
		
		if var7 then
			t[i] = var48
			continue
		end
		return var7, var47
	end
	return true, nil, t
end

local function calculateTotalBoundsForAsset(value, p17, p18)
	-- upvalues: calculateAllPartsBoundsData (ref), boundsDataUtilsModule (ref)
	local var15, var16, var17 = calculateAllPartsBoundsData(value, p17, p18)
	
	if not var15 then
		return var15, var16
	end
	local t = {}
	
	for i, v in var17 do
		t = boundsDataUtilsModule.combineBounds(t, v)
	end
	return true, nil, t
end

local function calculatePartBounds(p19, p20)
	-- upvalues: calculateTotalBoundsForAsset (ref)
	local var18, var19, var20 = calculateTotalBoundsForAsset({ [p19.Name] = CFrame.new() }, function(p21)
		-- upvalues: p19 (ref)
		assert(p21 == p19.Name)
		
		return p19
	end, p20)
	
	if var18 then
		return true, nil, var20
	end
	return var18, var19
end

function t.calculateAssetBounds(value, p19)
	-- upvalues: calculatePartBounds (ref), assetCalculatorModule (ref), orientSingleAssetToWorldAxes (ref), calculateTotalBoundsForAsset (ref)
	local assetTypeEnum = p19.assetTypeEnum
	assert(assetTypeEnum)
	
	if assetTypeEnum == Enum.AssetType.DynamicHead then
		return calculatePartBounds(value, p19)
	end
	local var18 = assetCalculatorModule.calculateAllTransformsForAsset(assetTypeEnum, value)
	
	local function findMeshHandle(p20)
		-- upvalues: value (ref)
		return value:FindFirstChild(p20)
	end
	
	orientSingleAssetToWorldAxes(var18, assetTypeEnum, findMeshHandle)
	local var19, var20, var21 = calculateTotalBoundsForAsset(var18, findMeshHandle, p19)
	
	if var19 then
		return true, nil, var21
	end
	return var19, var20
end

function t.calculateIndividualAssetPartsData(value, p19)
	-- upvalues: assetCalculatorModule (ref), orientSingleAssetToWorldAxes (ref), calculateAllPartsBoundsData (ref)
	local assetTypeEnum = p19.assetTypeEnum
	assert(assetTypeEnum)
	local var18 = assetCalculatorModule.calculateAllTransformsForAsset(assetTypeEnum, value)
	
	local function findMeshHandle(p20)
		-- upvalues: assetTypeEnum (ref), value (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then value else value:FindFirstChild(p20)
	end
	
	orientSingleAssetToWorldAxes(var18, assetTypeEnum, findMeshHandle)
	local var19, var20, var21 = calculateAllPartsBoundsData(var18, findMeshHandle, p19)
	
	if not var19 then
		return var19, var20
	end
	local t = {}
	
	for i, v in var21 do
		t[i] = { boundsData = v, cframe = var18[i] }
	end
	return true, nil, t
end

function t.calculateIndividualFullBodyPartsData(p20, p21, p22, p23)
	-- upvalues: assetCalculatorModule (ref), getFFlagUGCValidateLegFullBodySeparationModule (ref), orientFullBodyArmsLegsToWorldAxes (ref), calculateAllPartsBoundsData (ref)
	local function findMeshHandle(p24)
		-- upvalues: p20 (ref)
		return p20[p24]
	end
	
	local var22 = assetCalculatorModule.calculateAllTransformsForFullBody(p20)
	
	if not getFFlagUGCValidateLegFullBodySeparationModule() then
		orientFullBodyArmsLegsToWorldAxes(var22, findMeshHandle)
	elseif p23 then
		orientFullBodyArmsLegsToWorldAxes(var22, findMeshHandle)
	end
	local var23, var24, var25 = calculateAllPartsBoundsData(var22, findMeshHandle, p21, p22)
	
	if not var23 then
		return var23, var24
	end
	local t = {}
	
	for i, v in var25 do
		t[i] = { boundsData = v, cframe = var22[i] }
	end
	return true, nil, t
end

function t.calculateFullBodyBounds(p24, p25)
	-- upvalues: assetCalculatorModule (ref), orientFullBodyArmsLegsToWorldAxes (ref), calculateTotalBoundsForAsset (ref)
	local function findMeshHandle(p26)
		-- upvalues: p24 (ref)
		return p24[p26]
	end
	
	local var26 = assetCalculatorModule.calculateAllTransformsForFullBody(p24)
	orientFullBodyArmsLegsToWorldAxes(var26, findMeshHandle)
	local var27, var28, var29 = calculateTotalBoundsForAsset(var26, findMeshHandle, p25)
	
	if var27 then
		return true, nil, var29
	end
	return var27, var28
end

function t.calculateAssetBoundsFromData(value, p24, p25)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), buildValidationContextFromRenderMeshes (ref), t (ref)
	assert(getFFlagUGCValidateMigrateBodyPartBoundsModule(), "calculateAssetBoundsFromData requires FFlagUGCValidateMigrateBodyPartBounds")
	
	return t.calculateAssetBounds(value, buildValidationContextFromRenderMeshes(value, p24, p25))
end

function t.calculateFullBodyBoundsFromData(p24, p25)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), buildValidationContextFromRenderMeshes (ref), t (ref)
	assert(getFFlagUGCValidateMigrateBodyPartBoundsModule(), "calculateFullBodyBoundsFromData requires FFlagUGCValidateMigrateBodyPartBounds")
	local var26 = next(p24)
	
	if var26 then
		return t.calculateFullBodyBounds(p24, buildValidationContextFromRenderMeshes(p24[var26].Parent, nil, p25))
	end
	return false, { "No body parts provided" }
end

function t.calculateIndividualAssetPartsDataFromData(value, p24, p25)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), buildValidationContextFromRenderMeshes (ref), t (ref)
	assert(getFFlagUGCValidateMigrateBodyPartBoundsModule(), "calculateIndividualAssetPartsDataFromData requires FFlagUGCValidateMigrateBodyPartBounds")
	
	return t.calculateIndividualAssetPartsData(value, buildValidationContextFromRenderMeshes(value, p24, p25))
end

return t