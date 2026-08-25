local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p0, p1, p2)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var2 = toRectModule(p0).Min - toRectModule(p1).Max
	
	if not p2 then
		return returnValueModule(var2.Y >= 0, "Was below the element", "Was above the element")
	elseif typeof(p2) == "number" then
		p2 = NumberRange.new(p2)
	end
	return returnValueModule(p2.Min <= var2.Y and var2.Y <= p2.Max, "Was within range", "Was not within range ( " .. tostring(p2) .. ")")
end