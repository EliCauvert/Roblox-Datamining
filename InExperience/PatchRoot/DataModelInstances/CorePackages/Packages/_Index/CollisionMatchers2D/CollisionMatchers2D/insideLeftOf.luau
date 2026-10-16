local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

return function(p1, p2, MinValue: NumberRange) --[[ Line: 26 | Named "insideLeftOf" ]]
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local Negated = -(ToRectModule(p1).Max - ToRectModule(p2).Max)
	
	if not MinValue then
		return ReturnValueModule(Negated.X >= 0, "Was not right of the element", "Was too far right of the element")
	end
	if typeof(MinValue) == "number" then
		MinValue = NumberRange.new(MinValue)
	end
	return ReturnValueModule(MinValue.Min <= Negated.X and Negated.X <= MinValue.Max, "Was within range", "Was not within range ( " .. tostring(MinValue) .. ")")
end