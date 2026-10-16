local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local GetPartNamesInHierarchyOrderModule = require(Parent.util.getPartNamesInHierarchyOrder)
local GetMeshVertsModule = require(Parent.util.getMeshVerts)
local GetMeshInfoModule = require(Parent.util.getMeshInfo)
local BoundsDataUtilsModule = require(Parent.util.BoundsDataUtils)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)

local function orientSingleAssetToWorldAxes(AllTransformsForAsset, AssetType, FindMeshHandle) --[[ Line: 32 ]]
	-- upvalues: AssetCalculatorModule (copy)
	if AssetType ~= Enum.AssetType.LeftArm and AssetType ~= Enum.AssetType.RightArm and AssetType ~= Enum.AssetType.LeftLeg and AssetType ~= Enum.AssetType.RightLeg then return end
	for i, value in AssetCalculatorModule.calculateStraightenedLimb(AssetType, AllTransformsForAsset, FindMeshHandle) do
		AllTransformsForAsset[i] = value
	end
end

local function orientFullBodyArmsLegsToWorldAxes(AllTransformsForFullBody, Callback) --[[ Line: 53 ]]
	-- upvalues: orientSingleAssetToWorldAxes (copy), GetPartNamesInHierarchyOrderModule (copy), ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy)
	local function orientAndMoveParts(AssetType, p1) --[[ Line: 54 ]]
		-- upvalues: orientSingleAssetToWorldAxes (upval), AllTransformsForFullBody (copy), Callback (copy), GetPartNamesInHierarchyOrderModule (upval), ConstantsInterfaceModule (upval), R15plusUtilsModule (upval), GetAttachmentCFrameInPartSpaceModule (upval)
		orientSingleAssetToWorldAxes(AllTransformsForFullBody, AssetType, Callback)
		local PartNamesInHierarchyOrderModule = GetPartNamesInHierarchyOrderModule(AssetType)
		local CallbackResult = Callback(PartNamesInHierarchyOrderModule[1])
		local RigAttachmentToParent = ConstantsInterfaceModule.getRigAttachmentToParent(AssetType, CallbackResult.Name)
		local RigAttachmentToParent1 = CallbackResult:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(RigAttachmentToParent1)
		local ScaledAllTransformsForFullBodyEntry = AllTransformsForFullBody[CallbackResult.Name] * GetAttachmentCFrameInPartSpaceModule(RigAttachmentToParent1)
		local CallbackResult1 = Callback(p1)
		assert(CallbackResult1)
		local RigAttachmentToParent2 = CallbackResult1:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(RigAttachmentToParent2)
		local PositionDelta = (AllTransformsForFullBody[CallbackResult1.Name] * GetAttachmentCFrameInPartSpaceModule(RigAttachmentToParent2)).Position - ScaledAllTransformsForFullBodyEntry.Position
		
		for _, value in PartNamesInHierarchyOrderModule do
			AllTransformsForFullBody[value] = CFrame.new(AllTransformsForFullBody[value].Position + PositionDelta) * AllTransformsForFullBody[value].Rotation
		end
	end
	
	orientAndMoveParts(Enum.AssetType.LeftArm, "UpperTorso")
	orientAndMoveParts(Enum.AssetType.RightArm, "UpperTorso")
	orientAndMoveParts(Enum.AssetType.LeftLeg, "LowerTorso")
	orientAndMoveParts(Enum.AssetType.RightLeg, "LowerTorso")
end

local function calculateBoundsDataForPart(p1, Object, CF, p2, p3) --[[ Line: 89 ]]
	-- upvalues: GetExpectedPartSizeModule (copy), GetMeshVertsModule (copy), BoundsDataUtilsModule (copy), ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy)
	assert(p1 ~= nil ~= (p3 ~= nil))
	local ExpectedPartSizeModuleRatio = GetExpectedPartSizeModule(Object, p2) / Object.MeshSize
	local v1 = nil
	
	if p3 then
		if p3.meshData and p3.meshData[Object.MeshId] then
			local Verts = p3.meshData[Object.MeshId].verts
			
			if Verts then
				v1 = Verts
			end
		end
		if not v1 then
			return false, { "Verts not found in data cache" }
		end
	end
	if not v1 then
		local MeshVertsModule, MeshVertsModule2, MeshVertsModule3 = GetMeshVertsModule(p1, p2)
		
		if not MeshVertsModule then
			return MeshVertsModule, MeshVertsModule2
		end
		v1 = MeshVertsModule3
	end
	local t = {}
	
	for _, value in v1 do
		BoundsDataUtilsModule.expandMeshBounds(t, CF:PointToWorldSpace(value * ExpectedPartSizeModuleRatio))
	end
	for _, ChildName in ConstantsInterfaceModule.getAttachments(nil, Object.Name) do
		if string.match(ChildName, "RigAttachment$") ~= nil then
			local ChildName1 = Object:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
			assert(ChildName1)
			BoundsDataUtilsModule.expandRigAttachmentBounds(t, (CF * GetAttachmentCFrameInPartSpaceModule(ChildName1)).Position)
		end
	end
	BoundsDataUtilsModule.setOverallBounds(t)
	
	return true, nil, t
end

local function buildValidationContextFromRenderMeshes(Parent, AssetTypeEnum, p4) --[[ Line: 147 ]]
	local EditableMeshes = {}
	local Descendants = Parent:GetDescendants()
	table.insert(Descendants, Parent)
	
	for _, descendant in Descendants do
		local v2 = p4[descendant.Name]
		
		if v2 and v2.editable then
			EditableMeshes[descendant] = {
				MeshId = {
					instance = v2.editable,
					created = v2.createdInValidation or false
				}
			}
		end
	end
	return {
		assetTypeEnum = AssetTypeEnum,
		editableMeshes = EditableMeshes
	}
end

local function calculateAllPartsBoundsData(AllTransformsForAsset, Callback, p5, p6) --[[ Line: 168 ]]
	-- upvalues: GetMeshInfoModule (copy), ConstantsModule (copy), calculateBoundsDataForPart (copy)
	local t = {}
	local MeshInfoModule = nil
	local BoundsDataForPart = nil
	local MeshInfoModule2 = nil
	local BoundsDataForPart2 = nil
	
	for i, value in AllTransformsForAsset do
		local CallbackResult = Callback(i)
		local v3 = nil
		
		if not p6 then
			local MeshInfoModule3
			MeshInfoModule, MeshInfoModule2, MeshInfoModule3 = GetMeshInfoModule(CallbackResult, ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p5)
			
			if not MeshInfoModule then
				return MeshInfoModule, MeshInfoModule2
			end
			v3 = MeshInfoModule3
		end
		local BoundsDataForPart3
		BoundsDataForPart, BoundsDataForPart2, BoundsDataForPart3 = calculateBoundsDataForPart(v3, CallbackResult, value, p5, p6)
		
		if not BoundsDataForPart then
			return BoundsDataForPart, BoundsDataForPart2
		end
		t[i] = BoundsDataForPart3
	end
	return true, nil, t
end

local function calculateTotalBoundsForAsset(AllTransformsForAsset, FindMeshHandle, p7) --[[ Line: 199 ]]
	-- upvalues: calculateAllPartsBoundsData (copy), BoundsDataUtilsModule (copy)
	local AllPartsBoundsData, AllPartsBoundsData2, AllPartsBoundsData3 = calculateAllPartsBoundsData(AllTransformsForAsset, FindMeshHandle, p7)
	
	if not AllPartsBoundsData then
		return AllPartsBoundsData, AllPartsBoundsData2
	end
	local CombineBoundsResult = {}
	
	for _, value in AllPartsBoundsData3 do
		CombineBoundsResult = BoundsDataUtilsModule.combineBounds(CombineBoundsResult, value)
	end
	return true, nil, CombineBoundsResult
end

local function calculatePartBounds(p8, p9) --[[ Line: 218 ]]
	-- upvalues: calculateTotalBoundsForAsset (copy)
	local TotalBoundsForAsset, TotalBoundsForAsset2, TotalBoundsForAsset3 = calculateTotalBoundsForAsset({ [p8.Name] = CFrame.new() }, function(Name) --[[ Line: 223 | Named "findMeshHandle" ]]
		-- upvalues: p8 (copy)
		assert(Name == p8.Name)
		
		return p8
	end, p9)
	
	if TotalBoundsForAsset then
		return true, nil, TotalBoundsForAsset3
	else
		return TotalBoundsForAsset, TotalBoundsForAsset2
	end
end

local BoundsCalculatorModule = {
	calculateAssetBounds = function(Object, p8) --[[ Line: 237 ]]
		-- upvalues: calculatePartBounds (copy), AssetCalculatorModule (copy), orientSingleAssetToWorldAxes (copy), calculateTotalBoundsForAsset (copy)
		local AssetTypeEnum = p8.assetTypeEnum
		assert(AssetTypeEnum)
		
		if AssetTypeEnum == Enum.AssetType.DynamicHead then
			return calculatePartBounds(Object, p8)
		end
		local AllTransformsForAsset = AssetCalculatorModule.calculateAllTransformsForAsset(AssetTypeEnum, Object)
		
		local function findMeshHandle(ChildName) --[[ Line: 250 ]]
			-- upvalues: Object (copy)
			return (Object:FindFirstChild(ChildName))
		end
		
		orientSingleAssetToWorldAxes(AllTransformsForAsset, AssetTypeEnum, findMeshHandle)
		local TotalBoundsForAsset, TotalBoundsForAsset2, TotalBoundsForAsset3 = calculateTotalBoundsForAsset(AllTransformsForAsset, findMeshHandle, p8)
		
		if TotalBoundsForAsset then
			return true, nil, TotalBoundsForAsset3
		else
			return TotalBoundsForAsset, TotalBoundsForAsset2
		end
	end,
	calculateIndividualAssetPartsData = function(Object, p8) --[[ Line: 266 ]]
		-- upvalues: AssetCalculatorModule (copy), orientSingleAssetToWorldAxes (copy), calculateAllPartsBoundsData (copy)
		local AssetTypeEnum = p8.assetTypeEnum
		assert(AssetTypeEnum)
		local AllTransformsForAsset = AssetCalculatorModule.calculateAllTransformsForAsset(AssetTypeEnum, Object)
		
		local function findMeshHandle(ChildName) --[[ Line: 275 ]]
			-- upvalues: AssetTypeEnum (copy), Object (copy)
			return if AssetTypeEnum == Enum.AssetType.DynamicHead then Object else Object:FindFirstChild(ChildName)
		end
		
		orientSingleAssetToWorldAxes(AllTransformsForAsset, AssetTypeEnum, findMeshHandle)
		local AllPartsBoundsData, AllPartsBoundsData2, AllPartsBoundsData3 = calculateAllPartsBoundsData(AllTransformsForAsset, findMeshHandle, p8)
		
		if not AllPartsBoundsData then
			return AllPartsBoundsData, AllPartsBoundsData2
		end
		local t = {}
		
		for i, BoundsData in AllPartsBoundsData3 do
			t[i] = {
				boundsData = BoundsData,
				cframe = AllTransformsForAsset[i]
			}
		end
		return true, nil, t
	end,
	calculateIndividualFullBodyPartsData = function(p9, p10, p11, p12) --[[ Line: 300 ]]
		-- upvalues: AssetCalculatorModule (copy), orientFullBodyArmsLegsToWorldAxes (copy), calculateAllPartsBoundsData (copy)
		local function findMeshHandle(p13) --[[ Line: 306 ]]
			-- upvalues: p9 (copy)
			return p9[p13]
		end
		
		local AllTransformsForFullBody = AssetCalculatorModule.calculateAllTransformsForFullBody(p9)
		
		if p12 then
			orientFullBodyArmsLegsToWorldAxes(AllTransformsForFullBody, findMeshHandle)
		end
		local AllPartsBoundsData, AllPartsBoundsData2, AllPartsBoundsData3 = calculateAllPartsBoundsData(AllTransformsForFullBody, findMeshHandle, p10, p11)
		
		if not AllPartsBoundsData then
			return AllPartsBoundsData, AllPartsBoundsData2
		end
		local t = {}
		
		for i, BoundsData in AllPartsBoundsData3 do
			t[i] = {
				boundsData = BoundsData,
				cframe = AllTransformsForFullBody[i]
			}
		end
		return true, nil, t
	end,
	calculateFullBodyBounds = function(p13, p14) --[[ Line: 329 ]]
		-- upvalues: AssetCalculatorModule (copy), orientFullBodyArmsLegsToWorldAxes (copy), calculateTotalBoundsForAsset (copy)
		local function findMeshHandle(p15) --[[ Line: 333 ]]
			-- upvalues: p13 (copy)
			return p13[p15]
		end
		
		local AllTransformsForFullBody = AssetCalculatorModule.calculateAllTransformsForFullBody(p13)
		orientFullBodyArmsLegsToWorldAxes(AllTransformsForFullBody, findMeshHandle)
		local TotalBoundsForAsset, TotalBoundsForAsset2, TotalBoundsForAsset3 = calculateTotalBoundsForAsset(AllTransformsForFullBody, findMeshHandle, p14)
		
		if TotalBoundsForAsset then
			return true, nil, TotalBoundsForAsset3
		else
			return TotalBoundsForAsset, TotalBoundsForAsset2
		end
	end
}

function BoundsCalculatorModule.calculateAssetBoundsFromData(p13, AssetTypeEnum, p14) --[[ Line: 347 ]]
	-- upvalues: buildValidationContextFromRenderMeshes (copy), BoundsCalculatorModule (copy)
	return BoundsCalculatorModule.calculateAssetBounds(p13, (buildValidationContextFromRenderMeshes(p13, AssetTypeEnum, p14)))
end

function BoundsCalculatorModule.calculateFullBodyBoundsFromData(p13, p14) --[[ Line: 356 ]]
	-- upvalues: buildValidationContextFromRenderMeshes (copy), BoundsCalculatorModule (copy)
	local NextEntry = next(p13)
	
	if NextEntry then
		return BoundsCalculatorModule.calculateFullBodyBounds(p13, (buildValidationContextFromRenderMeshes(p13[NextEntry].Parent, nil, p14)))
	else
		return false, { "No body parts provided" }
	end
end

function BoundsCalculatorModule.calculateIndividualAssetPartsDataFromData(p13, AssetTypeEnum, p14) --[[ Line: 369 ]]
	-- upvalues: buildValidationContextFromRenderMeshes (copy), BoundsCalculatorModule (copy)
	return BoundsCalculatorModule.calculateIndividualAssetPartsData(p13, (buildValidationContextFromRenderMeshes(p13, AssetTypeEnum, p14)))
end

return BoundsCalculatorModule