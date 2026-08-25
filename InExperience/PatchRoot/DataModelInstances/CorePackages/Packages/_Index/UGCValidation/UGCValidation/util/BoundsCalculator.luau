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

local function orientSingleAssetToWorldAxes(value, p0, p1)
	-- upvalues: assetCalculatorModule (ref)
	if p0 ~= Enum.AssetType.LeftArm and p0 ~= Enum.AssetType.RightArm and (p0 ~= Enum.AssetType.LeftLeg and p0 ~= Enum.AssetType.RightLeg) then return end
	for i, v in assetCalculatorModule.calculateStraightenedLimb(p0, value, p1) do
		value[i] = v
	end
end

local function orientFullBodyArmsLegsToWorldAxes(p2, p3)
	-- upvalues: orientSingleAssetToWorldAxes (ref), getPartNamesInHierarchyOrderModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local function orientAndMoveParts(p4, p5)
		-- upvalues: orientSingleAssetToWorldAxes (copy), p2 (ref), p3 (ref), getPartNamesInHierarchyOrderModule (copy), constantsInterfaceModule (copy), r15plusUtilsModule (copy), getAttachmentCFrameInPartSpaceModule (copy)
		orientSingleAssetToWorldAxes(p2, p4, p3)
		local var21 = getPartNamesInHierarchyOrderModule(p4)
		local var22 = p3(var21[1])
		local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p4, var22.Name)
		local var24 = var22:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var24)
		local var25 = p2[var22.Name] * getAttachmentCFrameInPartSpaceModule(var24)
		local var26 = p3(p5)
		assert(var26)
		local var27 = var26:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var27)
		local var28 = (p2[var26.Name] * getAttachmentCFrameInPartSpaceModule(var27)).Position - var25.Position
		
		for i, v in var21 do
			p2[v] = CFrame.new(p2[v].Position + var28) * p2[v].Rotation
		end
	end
	
	orientAndMoveParts(Enum.AssetType.LeftArm, "UpperTorso")
	orientAndMoveParts(Enum.AssetType.RightArm, "UpperTorso")
	orientAndMoveParts(Enum.AssetType.LeftLeg, "LowerTorso")
	orientAndMoveParts(Enum.AssetType.RightLeg, "LowerTorso")
end

local function calculateBoundsDataForPart(p6, p7, p8, p9, p10)
	-- upvalues: getExpectedPartSizeModule (ref), getMeshVertsModule (ref), boundsDataUtilsModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	assert(p6 ~= nil ~= (p10 ~= nil))
	local var29 = getExpectedPartSizeModule(p7, p9) / p7.MeshSize
	local var30 = nil
	
	if p10 then
		if p10.meshData and p10.meshData[p7.MeshId] then
			local verts = p10.meshData[p7.MeshId].verts
			
			if verts then
				var30 = verts
			end
		end
		if not var30 then
			return false, { "Verts not found in data cache" }
		elseif not var30 then
			local var31, var32, var33 = getMeshVertsModule(p6, p9)
			
			if not var31 then
				return var31, var32
			end
			var30 = var33
		end
		local t = {}
		
		for i, v in var30 do
			boundsDataUtilsModule.expandMeshBounds(t, p8:PointToWorldSpace(v * var29))
		end
		for i, v_1 in constantsInterfaceModule.getAttachments(nil, p7.Name) do
			if string.match(v_1, "RigAttachment$") ~= nil then
				local var35 = p7:FindFirstChild(v_1, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
				assert(var35)
				boundsDataUtilsModule.expandRigAttachmentBounds(t, (p8 * getAttachmentCFrameInPartSpaceModule(var35)).Position)
			end
		end
		boundsDataUtilsModule.setOverallBounds(t)
		
		return true, nil, t
	end
end

local function buildValidationContextFromRenderMeshes(p11, p12, p13)
	local t = {}
	local descendants = p11:GetDescendants()
	table.insert(descendants, p11)
	
	for i, v in descendants do
		local name = p13[v.Name]
		
		if name and name.editable then
			t[v] = {
				MeshId = {
					instance = name.editable,
					created = name.createdInValidation or false
				}
			}
		end
	end
	return { assetTypeEnum = p12, editableMeshes = t }
end

local function calculateAllPartsBoundsData(p14, p15, p16, p17)
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), calculateBoundsDataForPart (ref)
	local t = {}
	
	for i, v in p14 do
		local var41
		local var39 = p15(i)
		local var40 = nil
		
		if not p17 then
			var41 = nil
			local _ = nil
			local _ = nil
			local var42, var43, var44 = getMeshInfoModule(var39, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p16)
			var41 = var42
			local var45 = var43
			local var46 = var44
			
			if var41 then
				var40 = var46
			end
			return var41, var45
		end
		var41, var47, var48 = calculateBoundsDataForPart(var40, var39, v, p16, p17)
		
		if var41 then
			t[i] = var48
			continue
		end
		return var41, var47
	end
	return true, nil, t
end

local function calculateTotalBoundsForAsset(value, p18, p19)
	-- upvalues: calculateAllPartsBoundsData (ref), boundsDataUtilsModule (ref)
	local var49, var50, var51 = calculateAllPartsBoundsData(value, p18, p19)
	
	if not var49 then
		return var49, var50
	end
	local t = {}
	
	for i, v in var51 do
		t = boundsDataUtilsModule.combineBounds(t, v)
	end
	return true, nil, t
end

local function calculatePartBounds(p20, p21)
	-- upvalues: calculateTotalBoundsForAsset (ref)
	local var53, var54, var55 = calculateTotalBoundsForAsset({ [p20.Name] = CFrame.new() }, function(p22)
		-- upvalues: p20 (ref)
		assert(p22 == p20.Name)
		
		return p20
	end, p21)
	
	if var53 then
		return true, nil, var55
	end
	return var53, var54
end

function t.calculateAssetBounds(value, p23)
	-- upvalues: calculatePartBounds (ref), assetCalculatorModule (ref), orientSingleAssetToWorldAxes (ref), calculateTotalBoundsForAsset (ref)
	local assetTypeEnum = p23.assetTypeEnum
	assert(assetTypeEnum)
	
	if assetTypeEnum == Enum.AssetType.DynamicHead then
		return calculatePartBounds(value, p23)
	end
	local var56 = assetCalculatorModule.calculateAllTransformsForAsset(assetTypeEnum, value)
	
	local function findMeshHandle(p24)
		-- upvalues: value (ref)
		return value:FindFirstChild(p24)
	end
	
	orientSingleAssetToWorldAxes(var56, assetTypeEnum, findMeshHandle)
	local var58, var59, var60 = calculateTotalBoundsForAsset(var56, findMeshHandle, p23)
	
	if var58 then
		return true, nil, var60
	end
	return var58, var59
end

function t.calculateIndividualAssetPartsData(value, p25)
	-- upvalues: assetCalculatorModule (ref), orientSingleAssetToWorldAxes (ref), calculateAllPartsBoundsData (ref)
	local assetTypeEnum = p25.assetTypeEnum
	assert(assetTypeEnum)
	local var61 = assetCalculatorModule.calculateAllTransformsForAsset(assetTypeEnum, value)
	
	local function findMeshHandle(p26)
		-- upvalues: assetTypeEnum (ref), value (ref)
		return if assetTypeEnum == Enum.AssetType.DynamicHead then value else value:FindFirstChild(p26)
	end
	
	orientSingleAssetToWorldAxes(var61, assetTypeEnum, findMeshHandle)
	local var63, var64, var65 = calculateAllPartsBoundsData(var61, findMeshHandle, p25)
	
	if not var63 then
		return var63, var64
	end
	local t = {}
	
	for i, v in var65 do
		t[i] = { boundsData = v, cframe = var61[i] }
	end
	return true, nil, t
end

function t.calculateIndividualFullBodyPartsData(p27, p28, p29, p30)
	-- upvalues: assetCalculatorModule (ref), getFFlagUGCValidateLegFullBodySeparationModule (ref), orientFullBodyArmsLegsToWorldAxes (ref), calculateAllPartsBoundsData (ref)
	local function findMeshHandle(p31)
		-- upvalues: p27 (ref)
		return p27[p31]
	end
	
	local var68 = assetCalculatorModule.calculateAllTransformsForFullBody(p27)
	
	if not getFFlagUGCValidateLegFullBodySeparationModule() then
		orientFullBodyArmsLegsToWorldAxes(var68, findMeshHandle)
	elseif p30 then
		orientFullBodyArmsLegsToWorldAxes(var68, findMeshHandle)
	end
	local var69, var70, var71 = calculateAllPartsBoundsData(var68, findMeshHandle, p28, p29)
	
	if not var69 then
		return var69, var70
	end
	local t = {}
	
	for i, v in var71 do
		t[i] = { boundsData = v, cframe = var68[i] }
	end
	return true, nil, t
end

function t.calculateFullBodyBounds(p32, p33)
	-- upvalues: assetCalculatorModule (ref), orientFullBodyArmsLegsToWorldAxes (ref), calculateTotalBoundsForAsset (ref)
	local function findMeshHandle(p34)
		-- upvalues: p32 (ref)
		return p32[p34]
	end
	
	local var74 = assetCalculatorModule.calculateAllTransformsForFullBody(p32)
	orientFullBodyArmsLegsToWorldAxes(var74, findMeshHandle)
	local var75, var76, var77 = calculateTotalBoundsForAsset(var74, findMeshHandle, p33)
	
	if var75 then
		return true, nil, var77
	end
	return var75, var76
end

function t.calculateAssetBoundsFromData(value, p35, p36)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), buildValidationContextFromRenderMeshes (ref), t (ref)
	assert(getFFlagUGCValidateMigrateBodyPartBoundsModule(), "calculateAssetBoundsFromData requires FFlagUGCValidateMigrateBodyPartBounds")
	
	return t.calculateAssetBounds(value, buildValidationContextFromRenderMeshes(value, p35, p36))
end

function t.calculateFullBodyBoundsFromData(p37, p38)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), buildValidationContextFromRenderMeshes (ref), t (ref)
	assert(getFFlagUGCValidateMigrateBodyPartBoundsModule(), "calculateFullBodyBoundsFromData requires FFlagUGCValidateMigrateBodyPartBounds")
	local var78 = next(p37)
	
	if var78 then
		return t.calculateFullBodyBounds(p37, buildValidationContextFromRenderMeshes(p37[var78].Parent, nil, p38))
	end
	return false, { "No body parts provided" }
end

function t.calculateIndividualAssetPartsDataFromData(value, p39, p40)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), buildValidationContextFromRenderMeshes (ref), t (ref)
	assert(getFFlagUGCValidateMigrateBodyPartBoundsModule(), "calculateIndividualAssetPartsDataFromData requires FFlagUGCValidateMigrateBodyPartBounds")
	
	return t.calculateIndividualAssetPartsData(value, buildValidationContextFromRenderMeshes(value, p39, p40))
end

return t