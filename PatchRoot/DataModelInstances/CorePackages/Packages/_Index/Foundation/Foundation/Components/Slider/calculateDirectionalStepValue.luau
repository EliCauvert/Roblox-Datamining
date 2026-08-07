-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:08 2026 Pacific Standard Time.

local sliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local sliderStepSizeModule = require(script.Parent.SliderStepSize)

return function(p0, p1, p2, p3, p4) --[[ line: 11 | named "calculateDirectionalStepValue" ]]
	-- upvalues: sliderStepSizeModule (ref), sliderStepDirectionModule (ref)
	local var2 = p2.Max - p2.Min
	local _ = nil
	local var3 = if p4 == sliderStepSizeModule.Page then math.max(0.1 * var2, p3 or 0) elseif p3 and p3 > 0 then p3 else 0.01 * var2
	
	return math.clamp(p0 + (if p1 == sliderStepDirectionModule.Increment then var3 else -var3), p2.Min, p2.Max)
end