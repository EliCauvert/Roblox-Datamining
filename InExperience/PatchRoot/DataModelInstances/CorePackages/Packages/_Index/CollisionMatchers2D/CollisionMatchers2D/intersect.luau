local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

return function(p0, p1)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var2 = toRectModule(p0)
	local var3 = toRectModule(p1)
	
	return returnValueModule(math.abs(var2.Min.X - var3.Min.X) * 2 < var2.Width + var3.Width and math.abs(var2.Min.Y - var3.Min.Y) * 2 < var2.Height + var3.Height, "Intersects the element", "Does not intersect the element")
end