local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ValidateScaleTypeModule = require(Parent.validation.validateScaleType)

local function forEachMeshPart(List, Object, AssetType, Callback)
	-- upvalues: ConstantsModule (copy)
	assert(List ~= nil ~= ((Object and AssetType) ~= nil))
	
	if List then
		for _, value in List do
			if not Callback(value) then
				return false
			end
		end
	else
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
		assert(ASSETTYPE)
		
		if Enum.AssetType.DynamicHead == AssetType then
			return Callback(Object)
		end
		for subPart in pairs(ASSETTYPE.subParts) do
			local Child = Object:FindFirstChild(subPart)
			assert(Child)
			
			if not Callback(Child) then
				return false
			end
		end
	end
	return true
end

local function getScaleType(p1, p2, AssetTypeEnum, p3)
	-- upvalues: forEachMeshPart (copy), AnalyticsModule (copy), ValidateScaleTypeModule (copy)
	assert(p1 ~= nil ~= ((p2 and AssetTypeEnum) ~= nil))
	local v1 = nil
	
	if forEachMeshPart(p1, p2, AssetTypeEnum, function(Object): boolean
		-- upvalues: v1 (ref)
		local AvatarPartScaleType = Object:FindFirstChild("AvatarPartScaleType")
		assert(AvatarPartScaleType)
		
		if v1 then
			return v1.Value == AvatarPartScaleType.Value
		end
		v1 = AvatarPartScaleType
		return true
	end) then
		local ValidateScaleTypeModuleResult, ValidateScaleTypeModuleResult2 = ValidateScaleTypeModule(v1, p3)
		
		return ValidateScaleTypeModuleResult, ValidateScaleTypeModuleResult2, if ValidateScaleTypeModuleResult then v1.Value else nil
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAssetBounds_InconsistentAvatarPartScaleType, nil, p3)
		
		return false, {
			"All MeshParts must have the same value in their AvatarPartScaleType child. Please verify the values match."
		}, nil
	end
end

local function validateMinBoundsInternal(MinSize, AssetTypeEnum, p1, p2)
	-- upvalues: FailureReasonsAccumulatorModule (copy), AnalyticsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local Flag = false
	local MaxMeshCornerDelta = p1.maxMeshCorner - p1.minMeshCorner
	
	for _, value in { "X", "Y", "Z" } do
		local MaxMeshCornerDeltaEntry = MaxMeshCornerDelta[value]
		local MinSizeEntry = MinSize[value]
		local IsMaxMeshCornerDeltaEntryAbove = MaxMeshCornerDeltaEntry >= MinSizeEntry
		
		if not IsMaxMeshCornerDeltaEntryAbove and not Flag then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAssetBounds_AssetSizeTooSmall, nil, p2)
			Flag = true
		end
		NewFailureReasonsAccumulator:updateReasons(IsMaxMeshCornerDeltaEntryAbove, {
			string.format("%s meshes %s axis size of '%.2f' is smaller than the min allowed bounding box %s axis size of '%.2f'. You need to scale up the meshes.", if AssetTypeEnum then AssetTypeEnum.Name else "Full body", value, MaxMeshCornerDeltaEntry, value, MinSizeEntry)
		})
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

local function validateMaxBoundsInternal(MaxSize, AssetTypeEnum, p3, p4)
	-- upvalues: FailureReasonsAccumulatorModule (copy), AnalyticsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local Flag = false
	local MaxOverallDelta = p3.maxOverall - p3.minOverall
	
	for _, value in { "X", "Y", "Z" } do
		local MaxOverallDeltaEntry = MaxOverallDelta[value]
		local MaxSizeEntry = MaxSize[value]
		local IsMaxOverallDeltaEntryBelow = MaxOverallDeltaEntry <= MaxSizeEntry
		
		if not IsMaxOverallDeltaEntryBelow and not Flag then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateAssetBounds_AssetSizeTooBig, nil, p4)
			Flag = true
		end
		NewFailureReasonsAccumulator:updateReasons(IsMaxOverallDeltaEntryBelow, {
			string.format("%s meshes and joints %s axis size of '%.2f' is larger than the max allowed bounding box %s axis size of '%.2f'. You need to scale down the meshes/joints", if AssetTypeEnum then AssetTypeEnum.Name else "Full body", value, MaxOverallDeltaEntry, value, MaxSizeEntry)
		})
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

return function(p5, p6, p7)
	-- upvalues: BoundsCalculatorModule (copy), getScaleType (copy), FailureReasonsAccumulatorModule (copy), ConstantsModule (copy), validateMinBoundsInternal (copy), validateMaxBoundsInternal (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local AssetTypeEnum = p7.assetTypeEnum
	assert(p5 ~= nil ~= ((p6 and AssetTypeEnum) ~= nil))
	local FullBodyBounds = nil
	local FullBodyBounds2 = nil
	local FullBodyBounds3 = nil
	
	if p5 then
		FullBodyBounds, FullBodyBounds2, FullBodyBounds3 = BoundsCalculatorModule.calculateFullBodyBounds(p5, p7)
	else
		FullBodyBounds, FullBodyBounds2, FullBodyBounds3 = BoundsCalculatorModule.calculateAssetBounds(p6, p7)
	end
	if not FullBodyBounds then
		return FullBodyBounds, FullBodyBounds2
	end
	local FullBodyBounds1 = FullBodyBounds3
	local ScaleType, ScaleType2, ScaleType3 = getScaleType(p5, p6, AssetTypeEnum, p7)
	
	if not ScaleType then
		return ScaleType, ScaleType2
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local MinSize = nil
	local MaxSize = nil
	
	if p5 then
		MinSize = ConstantsModule.FULL_BODY_BOUNDS[ScaleType3].minSize
		MaxSize = ConstantsModule.FULL_BODY_BOUNDS[ScaleType3].maxSize
	else
		MinSize = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum].bounds[ScaleType3].minSize
		MaxSize = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum].bounds[ScaleType3].maxSize
	end
	NewFailureReasonsAccumulator:updateReasons(validateMinBoundsInternal(MinSize, AssetTypeEnum, FullBodyBounds1, p7))
	NewFailureReasonsAccumulator:updateReasons(validateMaxBoundsInternal(MaxSize, AssetTypeEnum, FullBodyBounds1, p7))
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p7)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end