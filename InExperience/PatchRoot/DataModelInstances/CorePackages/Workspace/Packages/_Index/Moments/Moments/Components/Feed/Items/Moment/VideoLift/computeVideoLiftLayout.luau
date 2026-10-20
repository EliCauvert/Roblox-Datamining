local Moments = script:FindFirstAncestor("Moments")
local _ = require(Moments.Components.Comments.Sheet.getCommentsVideoLift)
local TweenService = game:GetService("TweenService")
local GetFitSizeFunction = require(Moments.Parent.MomentsCommon).Utils.getFitSize
local Quad = Enum.EasingStyle.Quad

local function _(p1)
	-- upvalues: GetFitSizeFunction (copy)
	local Resolution = p1.resolution
	
	return if p1.scaleType == Enum.ScaleType.Fit and Resolution ~= nil then p1.itemSize.Y * GetFitSizeFunction(p1.itemSize, Resolution).Y.Scale else p1.itemSize.Y
end

return function(p1)
	-- upvalues: GetFitSizeFunction (copy), TweenService (copy), Quad (copy)
	local Lift = p1.lift
	local ItemSize = p1.itemSize
	
	if Lift.progress <= 0 or ItemSize.X <= 0 or ItemSize.Y <= 0 then
		return nil
	end
	local NewBandTop = Lift.bandTop + p1.padding
	local BandBottomDelta = Lift.bandBottom - p1.padding - NewBandTop
	
	if BandBottomDelta <= 0 then
		return nil
	else
		local Resolution = p1.resolution
		local Smallest = math.min(BandBottomDelta / (if p1.scaleType == Enum.ScaleType.Fit and Resolution ~= nil then p1.itemSize.Y * GetFitSizeFunction(p1.itemSize, Resolution).Y.Scale else p1.itemSize.Y), 1)
		local Value = TweenService:GetValue(math.min(Lift.progress, 1), Quad, Enum.EasingDirection.In)
		
		return {
			scale = 1 + (Smallest - 1) * Value,
			offsetY = (NewBandTop + BandBottomDelta / 2 - (p1.itemTop + ItemSize.Y / 2)) * Value,
			cornerRadius = if Smallest < 1 then p1.cornerRadius * Value else 0
		}
	end
end