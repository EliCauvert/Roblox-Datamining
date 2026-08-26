local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p1, p2, p3)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var1 = -(toRectModule(p1).Max - toRectModule(p2).Min)
	
	if not p3 then
		return returnValueModule(var1.X >= 0, "Was not right of the element", "Was to the right of the element")
	elseif typeof(p3) == "number" then
		p3 = NumberRange.new(p3)
	end
	return returnValueModule(p3.Min <= var1.X and var1.X <= p3.Max, "Was within range", "Was not within range ( " .. tostring(p3) .. ")")
end