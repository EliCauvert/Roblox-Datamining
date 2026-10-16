local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

return function(p1, p2) --[[ Line: 24 | Named "intersect" ]]
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local RectModule = ToRectModule(p1)
	local RectModule1 = ToRectModule(p2)
	
	return ReturnValueModule(math.abs(RectModule.Min.X - RectModule1.Min.X) * 2 < RectModule.Width + RectModule1.Width and math.abs(RectModule.Min.Y - RectModule1.Min.Y) * 2 < RectModule.Height + RectModule1.Height, "Intersects the element", "Does not intersect the element")
end