local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

return function(p1, p2, MinValue: NumberRange)
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local MinDelta = ToRectModule(p1).Min - ToRectModule(p2).Min
	
	if not MinValue then
		return ReturnValueModule(MinDelta.Y >= 0, "Was not above the element", "Was too far above the element")
	end
	if typeof(MinValue) == "number" then
		MinValue = NumberRange.new(MinValue)
	end
	return ReturnValueModule(MinValue.Min <= MinDelta.Y and MinDelta.Y <= MinValue.Max, "Was within range", "Was not within range ( " .. tostring(MinValue) .. ")")
end