local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p0, p1, p2) --[[ line: 26 | named "insideLeftOf" ]]
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var2 = -(toRectModule(p0).Max - toRectModule(p1).Max)
	
	if not p2 then
		return returnValueModule(var2.X >= 0, "Was not right of the element", "Was too far right of the element")
	elseif typeof(p2) == "number" then
		p2 = NumberRange.new(p2)
	end
	return returnValueModule(p2.Min <= var2.X and var2.X <= p2.Max, "Was within range", "Was not within range ( " .. tostring(p2) .. ")")
end