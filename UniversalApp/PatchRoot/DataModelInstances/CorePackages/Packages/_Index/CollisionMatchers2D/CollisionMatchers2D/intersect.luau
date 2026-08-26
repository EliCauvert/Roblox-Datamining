local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p1, p2)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var1 = toRectModule(p1)
	local var2 = toRectModule(p2)
	
	return returnValueModule(math.abs(var1.Min.X - var2.Min.X) * 2 < var1.Width + var2.Width and math.abs(var1.Min.Y - var2.Min.Y) * 2 < var1.Height + var2.Height, "Intersects the element", "Does not intersect the element")
end