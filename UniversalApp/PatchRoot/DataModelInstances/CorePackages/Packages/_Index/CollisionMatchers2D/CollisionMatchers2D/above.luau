local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

return function(p1, p2, MinValue: NumberRange)
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local Negated = -(ToRectModule(p1).Max - ToRectModule(p2).Min)
	
	if not MinValue then
		return ReturnValueModule(Negated.Y >= 0, "Was above the element", "Was below the element")
	end
	if typeof(MinValue) == "number" then
		MinValue = NumberRange.new(MinValue)
	end
	return ReturnValueModule(MinValue.Min <= Negated.Y and Negated.Y <= MinValue.Max, "Was within range", "Was not within range ( " .. tostring(MinValue) .. ")")
end