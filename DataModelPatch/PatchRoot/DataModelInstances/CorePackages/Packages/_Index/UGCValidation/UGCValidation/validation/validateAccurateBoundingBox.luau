local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local _ = require(Parent.util.Types)
local GetFStringUGCValidateBoundsInflationThresholdModule = require(Parent.flags.getFStringUGCValidateBoundsInflationThreshold)

local function _(ExtentsUnion, ExtentsUnion1)
	return {
		min = ExtentsUnion.min:Min(ExtentsUnion1.min),
		max = ExtentsUnion.max:Max(ExtentsUnion1.max)
	}
end

local function checkExtentsValid(ExtentsUnion): boolean
	for _, value in { "X", "Y", "Z" } do
		if ExtentsUnion.max[value] < ExtentsUnion.min[value] then
			return false
		end
	end
	return true
end

local _ = function(p1, p2, p3, p4, p5)
	return p4 * (p2:Inverse() * p1 / p3 * p5)
end

local function calculateAmountInflated(ExtentsUnion, ExtentsUnion1): number
	local config = {
		min = ExtentsUnion.min:Min(ExtentsUnion1.min),
		max = ExtentsUnion.max:Max(ExtentsUnion1.max)
	}
	local Largest = 0
	
	for _, value in { "X", "Y", "Z" } do
		Largest = math.max(Largest, (math.abs(math.abs(config.max[value] - config.min[value]) - math.abs(ExtentsUnion.max[value] - ExtentsUnion.min[value]))))
	end
	return Largest
end

local function getPartNamesInAsset(Object, AssetType)
	local List = {}
	
	if AssetType == Enum.AssetType.DynamicHead then
		table.insert(List, Object.Name)
		
		return List
	end
	for _, Part in Object:GetChildren() do
		if Part:IsA("MeshPart") then
			table.insert(List, Part.Name)
		end
	end
	return List
end

local function calculateMeshScales(ChildNames, p1, Callback)
	-- upvalues: GetExpectedPartSizeModule (copy)
	local t = {}
	
	for _, childName in ChildNames do
		local CallbackResult = Callback(childName)
		t[childName] = GetExpectedPartSizeModule(CallbackResult, p1) / GetExpectedPartSizeModule(CallbackResult, p1, true)
	end
	return t
end

local function checkInflatingGeo(p2, SkinnyTris, p3, p4, AssetTypeEnum, NewResult)
	-- upvalues: calculateAmountInflated (copy), GetFStringUGCValidateBoundsInflationThresholdModule (copy)
	local List = {}
	
	for _, skinnyTri in SkinnyTris do
		table.insert(List, {
			extents = skinnyTri.extents,
			inflated = calculateAmountInflated(p2, skinnyTri.extents),
			worldSpacePosition = skinnyTri.worldSpacePosition
		})
	end
	table.sort(List, function(A, B): boolean
		return B.inflated < A.inflated
	end)
	local Number: number? = tonumber(GetFStringUGCValidateBoundsInflationThresholdModule())
	local List1 = {}
	local Count = 1
	while Count <= #List and (Number < List[Count].inflated and #List1 < p3) do
		table.insert(List1, List[Count])
		Count += 1
	end
	if #List1 > 0 then
		local Text = ""
		
		for i = 1, #List1 do
			if i > 1 then
				if i == #List1 then
					Text ..= ", and "
				else
					Text ..= ", "
				end
			end
			local WorldSpacePosition = List1[i].worldSpacePosition
			Text ..= string.format("{%.4f, %.4f, %.4f}", WorldSpacePosition.X, WorldSpacePosition.Y, WorldSpacePosition.Z)
		end
		NewResult:updateReasons(false, {
			string.format("Detected %s centered around: %s that increases %s bounding box. Remove the geometry or increase its size so that it is more visible", p4, Text, AssetTypeEnum.Name)
		})
	end
end

local function getWorldPositions(p5, AllTransformsForAsset, p6, p7, ChildNames, Callback)
	local List = {}
	
	for _, childName in ChildNames do
		local CallbackResult = Callback(childName)
		local CallbackResultCFrame = CallbackResult.CFrame
		local SizeRatio = CallbackResult.Size / CallbackResult.MeshSize
		
		for _, Extents in p5[childName][p7] do
			table.insert(List, {
				extents = Extents,
				worldSpacePosition = CallbackResultCFrame * (AllTransformsForAsset[childName]:Inverse() * ((Extents.min + Extents.max) / 2) / p6[childName] * SizeRatio)
			})
		end
	end
	return List
end

return function(Object, p8)
	-- upvalues: getPartNamesInAsset (copy), AssetCalculatorModule (copy), calculateMeshScales (copy), GetEditableMeshFromContextModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), checkExtentsValid (copy), getWorldPositions (copy), FailureReasonsAccumulatorModule (copy), checkInflatingGeo (copy), AnalyticsModule (copy)
	local AssetTypeEnum = p8.assetTypeEnum
	assert(AssetTypeEnum)
	local PartNamesInAsset = getPartNamesInAsset(Object, AssetTypeEnum)
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
	local MeshScales = calculateMeshScales(PartNamesInAsset, p8, findMeshHandle)
	local t = {}
	local Object1 = nil
	
	for _, ChildName in PartNamesInAsset do
		Object1 = if AssetTypeEnum == Enum.AssetType.DynamicHead then Object else Object:FindFirstChild(ChildName)
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object1, "MeshId", p8)
		
		if not MeshId then
			return false, {
				string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", Object1.Name)
			}
		end
		t[ChildName] = MeshId2
	end
	local List = {}
	local List1 = {}
	local List2 = {}
	
	for _, value1 in PartNamesInAsset do
		table.insert(List, t[value1])
		table.insert(List1, AllTransformsForAsset[value1])
		table.insert(List2, MeshScales[value1])
	end
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), List (copy), List1 (copy), List2 (copy)
		return UGCValidationService:GetBoundingBoxManipulationData(List, List1, List2)
	end, p8)
	
	if not PcallDeferredModuleResult then
		local Formatted = string.format("Could not get bounding box manipulation metrics for %s", AssetTypeEnum.Name)
		
		if not p8.isServer then
			return false, { Formatted }
		end
		error(Formatted)
	end
	local config = {
		min = PcallDeferredModuleResult2.minValidExtents,
		max = PcallDeferredModuleResult2.maxValidExtents
	}
	
	if not checkExtentsValid(config) then
		return false, {
			string.format("%s mesh is too small or made of disconnected pieces that are too small", AssetTypeEnum.Name)
		}
	end
	local t1 = {}
	
	for i1, partsProblemGeo in PcallDeferredModuleResult2.partsProblemGeos do
		t1[PartNamesInAsset[i1]] = partsProblemGeo
	end
	local SmallIslands = getWorldPositions(t1, AllTransformsForAsset, MeshScales, "smallIslands", PartNamesInAsset, findMeshHandle)
	local SkinnyTris = getWorldPositions(t1, AllTransformsForAsset, MeshScales, "skinnyTris", PartNamesInAsset, findMeshHandle)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	checkInflatingGeo(config, SmallIslands, 3, "small geometry", AssetTypeEnum, NewFailureReasonsAccumulator)
	checkInflatingGeo(config, SkinnyTris, 3, "skinny triangle(s)", AssetTypeEnum, NewFailureReasonsAccumulator)
	
	if not NewFailureReasonsAccumulator:getFinalResults() then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAccurateBoundingBox, nil, p8)
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end