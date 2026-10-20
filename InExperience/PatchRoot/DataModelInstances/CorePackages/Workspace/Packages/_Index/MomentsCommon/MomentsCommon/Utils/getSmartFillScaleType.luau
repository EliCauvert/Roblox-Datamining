local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ResolveMaxCropFractionModule = require(MomentsCommon.Utils.resolveMaxCropFraction)
local FFlagMomentsSmartVideoFillLandscapeModule = require(MomentsCommon.Flags.FFlagMomentsSmartVideoFillLandscape)
local FIntMomentsMaxVideoCropPercentModule = require(MomentsCommon.Flags.FIntMomentsMaxVideoCropPercent)

return function(ScaleType, Vector, Vector1, p1)
	-- upvalues: ResolveMaxCropFractionModule (copy), FIntMomentsMaxVideoCropPercentModule (copy), FFlagMomentsSmartVideoFillLandscapeModule (copy)
	if ScaleType ~= Enum.ScaleType.Fit or Vector1 == nil or Vector1.X == 0 or Vector1.Y == 0 then
		return ScaleType
	end
	local ResolveMaxCropFractionModuleResult: number = ResolveMaxCropFractionModule(Vector, Vector1, p1 or math.clamp(FIntMomentsMaxVideoCropPercentModule, 0, 100) / 100, FFlagMomentsSmartVideoFillLandscapeModule)
	
	if ResolveMaxCropFractionModuleResult <= 0 then
		return ScaleType
	elseif ResolveMaxCropFractionModuleResult >= 1 then
		return Enum.ScaleType.Crop
	else
		local XRatio = Vector.X / Vector.Y
		local XRatio1 = Vector1.X / Vector1.Y
		
		return if math.max(XRatio / XRatio1, XRatio1 / XRatio) <= 1 / (1 - ResolveMaxCropFractionModuleResult) then Enum.ScaleType.Crop else ScaleType
	end
end