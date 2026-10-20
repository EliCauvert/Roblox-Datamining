local SliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local SliderStepSizeModule = require(script.Parent.SliderStepSize)

return function(p1, Increment, p2, p3: number, Page): number
	-- upvalues: SliderStepDirectionModule (copy), SliderStepSizeModule (copy)
	local MaxDelta = p2.Max - p2.Min
	local IsIncrementMatch = Increment == SliderStepDirectionModule.Increment
	
	if p3 and p3 > 0 then
		local Largest: number = if Page == SliderStepSizeModule.Page then math.max(1, (math.round(0.1 * MaxDelta / p3))) else 1
		local MinRatio = (p1 - p2.Min) / p3
		local ScaledLargest = math.max(1, (math.abs(MinRatio))) * 0.000001
		
		return (math.clamp(p2.Min + (if IsIncrementMatch then math.floor(MinRatio + ScaledLargest) + Largest else math.ceil(MinRatio - ScaledLargest) - Largest) * p3, p2.Min, p2.Max))
	else
		local ScaledMaxDelta = if Page == SliderStepSizeModule.Page then 0.1 * MaxDelta else 0.01 * MaxDelta
		
		return (math.clamp(p1 + (if IsIncrementMatch then ScaledMaxDelta else -ScaledMaxDelta), p2.Min, p2.Max))
	end
end