local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateScaleTypeModule = require(parent.validation.validateScaleType)

local function forEachMeshPart(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref)
	assert(p1 ~= nil ~= ((p2 and p3) ~= nil))
	
	if p1 then
		for i, v in p1 do
			if not p4(v) then
				return false
			end
		end
	else
		local var1 = constantsModule.ASSET_TYPE_INFO[p3]
		assert(var1)
		
		if Enum.AssetType.DynamicHead == p3 then
			return p4(p2)
		end
		for i in pairs(var1.subParts) do
			local var2 = p2:FindFirstChild(i)
			assert(var2)
			
			if not p4(var2) then
				return false
			end
		end
	end
	return true
end

local function getScaleType(p5, p6, p7, p8)
	-- upvalues: forEachMeshPart (ref), analyticsModule (ref), validateScaleTypeModule (ref)
	assert(p5 ~= nil ~= ((p6 and p7) ~= nil))
	local var3 = nil
	
	if forEachMeshPart(p5, p6, p7, function(p9)
		-- upvalues: var3 (write)
		local avatarPartScaleType = p9:FindFirstChild("AvatarPartScaleType")
		assert(avatarPartScaleType)
		
		if var3 then
			return var3.Value == avatarPartScaleType.Value
		end
		var3 = avatarPartScaleType
		return true
	end) then
		local var4, var5 = validateScaleTypeModule(var3, p8)
		
		return var4, var5, if var4 then var3.Value else nil
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetBounds_InconsistentAvatarPartScaleType, nil, p8)
	
	return false, {
		"All MeshParts must have the same value in their AvatarPartScaleType child. Please verify the values match."
	}, nil
end

local function validateMinBoundsInternal(a, b, p5, p6)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var3 = failureReasonsAccumulatorModule.new()
	local var4 = false
	local var5 = p5.maxMeshCorner - p5.minMeshCorner
	
	for i, v in { "X", "Y", "Z" } do
		local var6 = var5[v]
		local var7 = a[v]
		local var8 = var7 <= var6
		
		if not var8 and not var4 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetBounds_AssetSizeTooSmall, nil, p6)
			var4 = true
		end
		var3:updateReasons(var8, {
			string.format("%s meshes %s axis size of '%.2f' is smaller than the min allowed bounding box %s axis size of '%.2f'. You need to scale up the meshes.", if b then b.Name else "Full body", v, var6, v, var7)
		})
	end
	return var3:getFinalResults()
end

local function validateMaxBoundsInternal(a, b, p7, p8)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var9 = failureReasonsAccumulatorModule.new()
	local var10 = false
	local var11 = p7.maxOverall - p7.minOverall
	
	for i, v in { "X", "Y", "Z" } do
		local var12 = var11[v]
		local var13 = a[v]
		local var14 = var12 <= var13
		
		if not var14 and not var10 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetBounds_AssetSizeTooBig, nil, p8)
			var10 = true
		end
		var9:updateReasons(var14, {
			string.format("%s meshes and joints %s axis size of '%.2f' is larger than the max allowed bounding box %s axis size of '%.2f'. You need to scale down the meshes/joints", if b then b.Name else "Full body", v, var12, v, var13)
		})
	end
	return var9:getFinalResults()
end

return function(value, p9, p10)
	-- upvalues: boundsCalculatorModule (ref), getScaleType (ref), failureReasonsAccumulatorModule (ref), constantsModule (ref), validateMinBoundsInternal (ref), validateMaxBoundsInternal (ref), analyticsModule (ref)
	local var15, var16, var17
	local currentTime = tick()
	local assetTypeEnum = p10.assetTypeEnum
	assert(value ~= nil ~= ((p9 and assetTypeEnum) ~= nil))
	local _ = nil
	local _ = nil
	local _ = nil
	
	if value then
		local var18, var19, var20 = boundsCalculatorModule.calculateFullBodyBounds(value, p10)
		var15 = var18
		var16 = var19
		var17 = var20
	else
		local var21, var22, var23 = boundsCalculatorModule.calculateAssetBounds(p9, p10)
		var15 = var21
		var16 = var22
		var17 = var23
	end
	if not var15 then
		return var15, var16
	end
	local _ = nil
	local var24, var25, var26 = getScaleType(value, p9, assetTypeEnum, p10)
	
	if not var24 then
		return var24, var25
	end
	local minSize
	local var27 = failureReasonsAccumulatorModule.new()
	local _ = nil
	local _ = nil
	
	if value then
		minSize = constantsModule.FULL_BODY_BOUNDS[var26].minSize
		var26 = constantsModule.FULL_BODY_BOUNDS[var26].maxSize
	else
		minSize = constantsModule.ASSET_TYPE_INFO[assetTypeEnum].bounds[var26].minSize
		var26 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum].bounds[var26].maxSize
	end
	var27:updateReasons(validateMinBoundsInternal(minSize, assetTypeEnum, var17, p10))
	var27:updateReasons(validateMaxBoundsInternal(var26, assetTypeEnum, var17, p10))
	analyticsModule.recordScriptTime(script.Name, currentTime, p10)
	
	return var27:getFinalResults()
end