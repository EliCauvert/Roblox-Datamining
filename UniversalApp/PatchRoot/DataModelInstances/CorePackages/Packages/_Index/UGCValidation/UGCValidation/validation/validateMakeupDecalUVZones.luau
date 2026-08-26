local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateMakeupZoneIncludeToleranceHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneIncludeToleranceHundredthsPercent", 100)
local validateMakeupZoneExcludeHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneExcludeHundredthsPercent", 200)

local function createIncludeError(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	local assetTypeEnum = p3.assetTypeEnum
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_UVZoneError, nil, p3)
	
	return false, {
		string.format("Opaque area of ColorMap for %s does not fall within allowed UV area of [%s] and [%s] for asset type %s", p1.Name, tostring(p2.MinBound), tostring(p2.MaxBound), assetTypeEnum.Name)
	}
end

local function createExcludeError(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	local assetTypeEnum = p3.assetTypeEnum
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_UVZoneError, nil, p3)
	
	return false, {
		string.format("Opaque pixels in ColorMap for %s were found within a restricted UV area of [%s] and [%s] for asset type %s", p1.Name, tostring(p2.MinBound), tostring(p2.MaxBound), assetTypeEnum.Name)
	}
end

local function validateCoverageOutsideIncludeBounds(p1, p2, p3, p4, p5, p6)
	-- upvalues: validateMakeupZoneIncludeToleranceHundredthsPercent (ref), createIncludeError (ref)
	local var1 = (p4.X - p3.X) * (p4.Y - p3.Y) * validateMakeupZoneIncludeToleranceHundredthsPercent / 10000 * 255
	local var2 = 0
	local var3 = p2:ReadPixelsBuffer(Vector2.new(0, 0), p2.Size)
	local var4 = 0
	local var5 = p2.Size.Y - 1
	
	for i = 0, buffer.len(var3) - 1, 4 do
		if var4 == p2.Size.X then
			var4 = 0
			var5 -= 1
		end
		local value = buffer.readu8(var3, i + 3)
		
		if value > 0 and (var4 < p3.X or var5 < p3.Y or (p4.X < var4 or p4.Y < var5)) then
			var2 += value
		end
		var4 += 1
	end
	return if var1 < var2 then createIncludeError(p1, p5, p6) else true
end

local function validateCoverageInsideExcludeBounds(p7, p8, p9, p10, p11, p12)
	-- upvalues: validateMakeupZoneExcludeHundredthsPercent (ref), createExcludeError (ref)
	local var6 = (p10.X - p9.X) * (p10.Y - p9.Y) * validateMakeupZoneExcludeHundredthsPercent / 10000 * 255
	local var7 = 0
	local var8 = p8:ReadPixelsBuffer(Vector2.new(0, 0), p8.Size)
	local var9 = 0
	local var10 = p8.Size.Y - 1
	
	for i = 0, buffer.len(var8) - 1, 4 do
		if var9 == p8.Size.X then
			var9 = 0
			var10 -= 1
		end
		local value = buffer.readu8(var8, i + 3)
		
		if value > 0 and p9.X < var9 and (p9.Y < var10 and var9 < p10.X) and var10 < p10.Y then
			var7 += value
		end
		var9 += 1
	end
	return if var6 < var7 then createExcludeError(p7, p11, p12) else true
end

return function(p13, p14, p15, p16, p17)
	-- upvalues: failureReasonsAccumulatorModule (ref), validateCoverageOutsideIncludeBounds (ref), validateCoverageInsideExcludeBounds (ref)
	local var11 = p15.UVMaxBound - p15.UVMinBound
	local var12 = failureReasonsAccumulatorModule.new()
	
	for i, v in p16 do
		local var13 = (v.MinBound - p15.UVMinBound) / var11 * p14.Size
		local var14 = (v.MaxBound - p15.UVMinBound) / var11 * p14.Size
		
		if v.isIncludeBound then
			var12:updateReasons(validateCoverageOutsideIncludeBounds(p13, p14, var13, var14, v, p17))
		else
			var12:updateReasons(validateCoverageInsideExcludeBounds(p13, p14, var13, var14, v, p17))
		end
	end
	return var12:getFinalResults()
end