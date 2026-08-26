local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p1, p2, p3)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var1 = toRectModule(p1)
	local var2 = toRectModule(p2)
	
	return if p3 == Enum.VerticalAlignment.Top then returnValueModule(var1.Min.Y == var2.Min.Y, "", "") elseif p3 == Enum.VerticalAlignment.Center then returnValueModule(((var1.Min + var1.Max) / 2).Y == ((var2.Min + var2.Max) / 2).Y, "", "") elseif p3 == Enum.VerticalAlignment.Bottom then returnValueModule(var1.Max.Y == var2.Max.Y, "", "") else returnValueModule(false, "Invalid VerticalAlignment!")
end