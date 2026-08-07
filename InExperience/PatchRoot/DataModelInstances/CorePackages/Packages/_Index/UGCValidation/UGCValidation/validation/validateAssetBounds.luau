local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateScaleTypeModule = require(parent.validation.validateScaleType)

local function forEachMeshPart(p0, p1, p2, p3) --[[ line: 16 ]]
	-- upvalues: constantsModule (ref)
	assert(p0 ~= nil ~= ((p1 and p2) ~= nil))
	
	if p0 then
		for i, v in p0 do
			if not p3(v) then
				return false
			end
		end
	else
		local var9 = constantsModule.ASSET_TYPE_INFO[p2]
		assert(var9)
		
		if Enum.AssetType.DynamicHead == p2 then
			return p3(p1)
		end
		for i in pairs(var9.subParts) do
			local var10 = p1:FindFirstChild(i)
			assert(var10)
			
			if not p3(var10) then
				return false
			end
		end
	end
	return true
end

local function getScaleType(p4, p5, p6, p7) --[[ line: 50 ]]
	-- upvalues: forEachMeshPart (ref), analyticsModule (ref), validateScaleTypeModule (ref)
	assert(p4 ~= nil ~= ((p5 and p6) ~= nil))
	local var11 = nil
	
	if forEachMeshPart(p4, p5, p6, function(p8) --[[ line: 60 ]]
		-- upvalues: var11 (write)
		local avatarPartScaleType = p8:FindFirstChild("AvatarPartScaleType")
		assert(avatarPartScaleType)
		
		if var11 then
			return var11.Value == avatarPartScaleType.Value
		end
		var11 = avatarPartScaleType
		return true
	end) then
		local var12, var13 = validateScaleTypeModule(var11, p7)
		
		return var12, var13, if var12 then var11.Value else nil
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetBounds_InconsistentAvatarPartScaleType, nil, p7)
	
	return false, {
		"All MeshParts must have the same value in their AvatarPartScaleType child. Please verify the values match."
	}, nil
end

local function validateMinBoundsInternal(a, b, p9, p10) --[[ line: 88 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var15 = failureReasonsAccumulatorModule.new()
	local var16 = false
	local var17 = p9.maxMeshCorner - p9.minMeshCorner
	
	for i, v in { "X", "Y", "Z" } do
		local var18 = var17[v]
		local var19 = a[v]
		local var20 = var19 <= var18
		
		if not var20 and not var16 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetBounds_AssetSizeTooSmall, nil, p10)
			var16 = true
		end
		var15:updateReasons(var20, {
			string.format("%s meshes %s axis size of '%.2f' is smaller than the min allowed bounding box %s axis size of '%.2f'. You need to scale up the meshes.", if b then b.Name else "Full body", v, var18, v, var19)
		})
	end
	return var15:getFinalResults()
end

local function validateMaxBoundsInternal(a, b, p11, p12) --[[ line: 126 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var21 = failureReasonsAccumulatorModule.new()
	local var22 = false
	local var23 = p11.maxOverall - p11.minOverall
	
	for i, v in { "X", "Y", "Z" } do
		local var24 = var23[v]
		local var25 = a[v]
		local var26 = var24 <= var25
		
		if not var26 and not var22 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetBounds_AssetSizeTooBig, nil, p12)
			var22 = true
		end
		var21:updateReasons(var26, {
			string.format("%s meshes and joints %s axis size of '%.2f' is larger than the max allowed bounding box %s axis size of '%.2f'. You need to scale down the meshes/joints", if b then b.Name else "Full body", v, var24, v, var25)
		})
	end
	return var21:getFinalResults()
end

return function(value, p13, p14) --[[ line: 164 | named "validateAssetBounds" ]]
	-- upvalues: boundsCalculatorModule (ref), getScaleType (ref), failureReasonsAccumulatorModule (ref), constantsModule (ref), validateMinBoundsInternal (ref), validateMaxBoundsInternal (ref), analyticsModule (ref)
	local var31, var32, var33
	local currentTime = tick()
	local assetTypeEnum = p14.assetTypeEnum
	assert(value ~= nil ~= ((p13 and assetTypeEnum) ~= nil))
	local _ = nil
	local _ = nil
	local _ = nil
	
	if value then
		local var34, var35, var36 = boundsCalculatorModule.calculateFullBodyBounds(value, p14)
		var31 = var34
		var32 = var35
		var33 = var36
	else
		local var28, var29, var30 = boundsCalculatorModule.calculateAssetBounds(p13, p14)
		var31 = var28
		var32 = var29
		var33 = var30
	end
	if not var31 then
		return var31, var32
	end
	local _ = nil
	local var37, var38, var39 = getScaleType(value, p13, assetTypeEnum, p14)
	
	if not var37 then
		return var37, var38
	end
	local minSize
	local var40 = failureReasonsAccumulatorModule.new()
	local _ = nil
	local _ = nil
	
	if value then
		minSize = constantsModule.FULL_BODY_BOUNDS[var39].minSize
		var39 = constantsModule.FULL_BODY_BOUNDS[var39].maxSize
	else
		minSize = constantsModule.ASSET_TYPE_INFO[assetTypeEnum].bounds[var39].minSize
		var39 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum].bounds[var39].maxSize
	end
	var40:updateReasons(validateMinBoundsInternal(minSize, assetTypeEnum, var33, p14))
	var40:updateReasons(validateMaxBoundsInternal(var39, assetTypeEnum, var33, p14))
	analyticsModule.recordScriptTime(script.Name, currentTime, p14)
	
	return var40:getFinalResults()
end