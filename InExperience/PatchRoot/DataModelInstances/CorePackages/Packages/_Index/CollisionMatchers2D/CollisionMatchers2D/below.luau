local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p1, p2, p3)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var1 = toRectModule(p1).Min - toRectModule(p2).Max
	
	if not p3 then
		return returnValueModule(var1.Y >= 0, "Was below the element", "Was above the element")
	elseif typeof(p3) == "number" then
		p3 = NumberRange.new(p3)
	end
	return returnValueModule(p3.Min <= var1.Y and var1.Y <= p3.Max, "Was within range", "Was not within range ( " .. tostring(p3) .. ")")
end