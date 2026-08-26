local sliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local sliderStepSizeModule = require(script.Parent.SliderStepSize)

return function(p1, p2, p3, p4, p5)
	-- upvalues: sliderStepSizeModule (ref), sliderStepDirectionModule (ref)
	local var1 = p3.Max - p3.Min
	local _ = nil
	local var2 = if p5 == sliderStepSizeModule.Page then math.max(0.1 * var1, p4 or 0) elseif p4 and p4 > 0 then p4 else 0.01 * var1
	
	return math.clamp(p1 + (if p2 == sliderStepDirectionModule.Increment then var2 else -var2), p3.Min, p3.Max)
end