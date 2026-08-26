local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p1, p2, p3)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var1 = toRectModule(p1)
	local var2 = toRectModule(p2)
	
	return if p3 == Enum.HorizontalAlignment.Left then returnValueModule(var1.Min.X == var2.Min.X, "", "") elseif p3 == Enum.HorizontalAlignment.Center then returnValueModule(((var1.Min + var1.Max) / 2).X == ((var2.Min + var2.Max) / 2).X, "", "") elseif p3 == Enum.HorizontalAlignment.Right then returnValueModule(var1.Max.X == var2.Max.X, "", "") else returnValueModule(false, "Invalid horizontal alignment!")
end