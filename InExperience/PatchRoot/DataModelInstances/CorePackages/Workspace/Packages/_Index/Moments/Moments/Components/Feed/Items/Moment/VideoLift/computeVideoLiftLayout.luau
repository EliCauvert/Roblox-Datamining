local moments = script:FindFirstAncestor("Moments")
local momentsCommonModule = require(moments.Parent.MomentsCommon)
local _ = require(moments.Components.Comments.Sheet.getCommentsVideoLift)
local tweenService = game:GetService("TweenService")
local getFitSize = momentsCommonModule.Utils.getFitSize
local quad = Enum.EasingStyle.Quad

local function _(p1)
	-- upvalues: getFitSize (ref)
	local resolution = p1.resolution
	
	return if p1.scaleType == Enum.ScaleType.Fit and resolution ~= nil then p1.itemSize.Y * getFitSize(p1.itemSize, resolution).Y.Scale else p1.itemSize.Y
end

return function(p1)
	-- upvalues: getFitSize (ref), tweenService (ref), quad (ref)
	local lift = p1.lift
	local itemSize = p1.itemSize
	
	if lift.progress <= 0 or itemSize.X <= 0 or itemSize.Y <= 0 then
		return nil
	end
	local var1 = lift.bandTop + p1.padding
	local var2 = lift.bandBottom - p1.padding - var1
	
	if var2 <= 0 then
		return nil
	end
	local resolution = p1.resolution
	local minValue = math.min(var2 / (if p1.scaleType == Enum.ScaleType.Fit and resolution ~= nil then p1.itemSize.Y * getFitSize(p1.itemSize, resolution).Y.Scale else p1.itemSize.Y), 1)
	local progressValue = tweenService:GetValue(math.min(lift.progress, 1), quad, Enum.EasingDirection.In)
	
	return {
		scale = 1 + (minValue - 1) * progressValue,
		offsetY = (var1 + var2 / 2 - (p1.itemTop + itemSize.Y / 2)) * progressValue,
		cornerRadius = if minValue < 1 then p1.cornerRadius * progressValue else 0
	}
end