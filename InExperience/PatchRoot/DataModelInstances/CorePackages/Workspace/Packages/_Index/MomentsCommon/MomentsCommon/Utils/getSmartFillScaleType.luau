local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local resolveMaxCropFractionModule = require(momentsCommon.Utils.resolveMaxCropFraction)
local fFlagMomentsSmartVideoFillLandscapeModule = require(momentsCommon.Flags.FFlagMomentsSmartVideoFillLandscape)
local fIntMomentsMaxVideoCropPercentModule = require(momentsCommon.Flags.FIntMomentsMaxVideoCropPercent)

return function(p1, p2, p3, p4)
	-- upvalues: resolveMaxCropFractionModule (ref), fIntMomentsMaxVideoCropPercentModule (ref), fFlagMomentsSmartVideoFillLandscapeModule (ref)
	if p1 ~= Enum.ScaleType.Fit or p3 == nil or (p3.X == 0 or p3.Y == 0) then
		return p1
	end
	local var1 = resolveMaxCropFractionModule(p2, p3, p4 or math.clamp(fIntMomentsMaxVideoCropPercentModule, 0, 100) / 100, fFlagMomentsSmartVideoFillLandscapeModule)
	
	if var1 <= 0 then
		return p1
	elseif var1 >= 1 then
		return Enum.ScaleType.Crop
	end
	local var2 = p2.X / p2.Y
	local var3 = p3.X / p3.Y
	
	return if math.max(var2 / var3, var3 / var2) <= 1 / (1 - var1) then Enum.ScaleType.Crop else p1
end