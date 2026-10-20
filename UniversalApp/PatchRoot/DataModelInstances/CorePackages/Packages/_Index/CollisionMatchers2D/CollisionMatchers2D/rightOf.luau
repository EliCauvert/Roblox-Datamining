local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

return function(p1, p2, MinValue: NumberRange)
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local MinDelta = ToRectModule(p1).Min - ToRectModule(p2).Max
	
	if not MinValue then
		return ReturnValueModule(MinDelta.X >= 0, "Was not left of the element", "Was to the left of the element")
	end
	if typeof(MinValue) == "number" then
		MinValue = NumberRange.new(MinValue)
	end
	return ReturnValueModule(MinValue.Min <= MinDelta.X and MinDelta.X <= MinValue.Max, "Was within range", "Was not within range ( " .. tostring(MinValue) .. ")")
end