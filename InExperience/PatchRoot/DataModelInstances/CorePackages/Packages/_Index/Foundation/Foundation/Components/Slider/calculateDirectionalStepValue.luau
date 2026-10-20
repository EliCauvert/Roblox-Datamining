local SliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local SliderStepSizeModule = require(script.Parent.SliderStepSize)

return function(p1, Increment, p2, p3: number, Page): number
	-- upvalues: SliderStepSizeModule (copy), SliderStepDirectionModule (copy)
	local MaxDelta = p2.Max - p2.Min
	local Largest = if Page == SliderStepSizeModule.Page then math.max(0.1 * MaxDelta, p3 or 0) elseif p3 and p3 > 0 then p3 else 0.01 * MaxDelta
	
	return (math.clamp(p1 + (if Increment == SliderStepDirectionModule.Increment then Largest else -Largest), p2.Min, p2.Max))
end