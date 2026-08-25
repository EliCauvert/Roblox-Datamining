local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateMakeupZoneIncludeToleranceHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneIncludeToleranceHundredthsPercent", 100)
local validateMakeupZoneExcludeHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneExcludeHundredthsPercent", 200)

local function createIncludeError(p0, p1, p2)
	-- upvalues: analyticsModule (ref)
	local assetTypeEnum = p2.assetTypeEnum
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_UVZoneError, nil, p2)
	
	return false, {
		string.format("Opaque area of ColorMap for %s does not fall within allowed UV area of [%s] and [%s] for asset type %s", p0.Name, tostring(p1.MinBound), tostring(p1.MaxBound), assetTypeEnum.Name)
	}
end

local function createExcludeError(p3, p4, p5)
	-- upvalues: analyticsModule (ref)
	local assetTypeEnum = p5.assetTypeEnum
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_UVZoneError, nil, p5)
	
	return false, {
		string.format("Opaque pixels in ColorMap for %s were found within a restricted UV area of [%s] and [%s] for asset type %s", p3.Name, tostring(p4.MinBound), tostring(p4.MaxBound), assetTypeEnum.Name)
	}
end

local function validateCoverageOutsideIncludeBounds(p6, p7, p8, p9, p10, p11)
	-- upvalues: validateMakeupZoneIncludeToleranceHundredthsPercent (ref), createIncludeError (ref)
	local var8 = (p9.X - p8.X) * (p9.Y - p8.Y) * validateMakeupZoneIncludeToleranceHundredthsPercent / 10000 * 255
	local var9 = 0
	local var10 = p7:ReadPixelsBuffer(Vector2.new(0, 0), p7.Size)
	local var11 = 0
	local var12 = p7.Size.Y - 1
	
	for i = 0, buffer.len(var10) - 1, 4 do
		if var11 == p7.Size.X then
			var11 = 0
			var12 -= 1
		end
		local value = buffer.readu8(var10, i + 3)
		
		if value > 0 and (var11 < p8.X or var12 < p8.Y or (p9.X < var11 or p9.Y < var12)) then
			var9 += value
		end
		var11 += 1
	end
	return if var8 < var9 then createIncludeError(p6, p10, p11) else true
end

local function validateCoverageInsideExcludeBounds(p12, p13, p14, p15, p16, p17)
	-- upvalues: validateMakeupZoneExcludeHundredthsPercent (ref), createExcludeError (ref)
	local var14 = (p15.X - p14.X) * (p15.Y - p14.Y) * validateMakeupZoneExcludeHundredthsPercent / 10000 * 255
	local var15 = 0
	local var16 = p13:ReadPixelsBuffer(Vector2.new(0, 0), p13.Size)
	local var17 = 0
	local var18 = p13.Size.Y - 1
	
	for i = 0, buffer.len(var16) - 1, 4 do
		if var17 == p13.Size.X then
			var17 = 0
			var18 -= 1
		end
		local value = buffer.readu8(var16, i + 3)
		
		if value > 0 and p14.X < var17 and (p14.Y < var18 and var17 < p15.X) and var18 < p15.Y then
			var15 += value
		end
		var17 += 1
	end
	return if var14 < var15 then createExcludeError(p12, p16, p17) else true
end

return function(p18, p19, p20, p21, p22)
	-- upvalues: failureReasonsAccumulatorModule (ref), validateCoverageOutsideIncludeBounds (ref), validateCoverageInsideExcludeBounds (ref)
	local var20 = p20.UVMaxBound - p20.UVMinBound
	local var21 = failureReasonsAccumulatorModule.new()
	
	for i, v in p21 do
		local var22 = (v.MinBound - p20.UVMinBound) / var20 * p19.Size
		local var23 = (v.MaxBound - p20.UVMinBound) / var20 * p19.Size
		
		if v.isIncludeBound then
			var21:updateReasons(validateCoverageOutsideIncludeBounds(p18, p19, var22, var23, v, p22))
		else
			var21:updateReasons(validateCoverageInsideExcludeBounds(p18, p19, var22, var23, v, p22))
		end
	end
	return var21:getFinalResults()
end