local sliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local sliderStepSizeModule = require(script.Parent.SliderStepSize)

return function(p1, p2, p3, p4, p5)
	-- upvalues: sliderStepDirectionModule (ref), sliderStepSizeModule (ref)
	local var1 = p3.Max - p3.Min
	local var2 = p2 == sliderStepDirectionModule.Increment
	
	if p4 and p4 > 0 then
		local var3 = if p5 == sliderStepSizeModule.Page then math.max(1, math.round(0.1 * var1 / p4)) else 1
		local var4 = (p1 - p3.Min) / p4
		local var5 = math.max(1, math.abs(var4)) * 0.000001
		
		return math.clamp(p3.Min + (if var2 then math.floor(var4 + var5) + var3 else math.ceil(var4 - var5) - var3) * p4, p3.Min, p3.Max)
	end
	local var6 = if p5 == sliderStepSizeModule.Page then 0.1 * var1 else 0.01 * var1
	
	return math.clamp(p1 + (if var2 then var6 else -var6), p3.Min, p3.Max)
end