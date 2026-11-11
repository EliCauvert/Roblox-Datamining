local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

return function(p1, p2, VerticalAlignment)
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local RectModule = ToRectModule(p1)
	local RectModule1 = ToRectModule(p2)
	
	return if VerticalAlignment == Enum.VerticalAlignment.Top then ReturnValueModule(RectModule.Min.Y == RectModule1.Min.Y, "", "") elseif VerticalAlignment == Enum.VerticalAlignment.Center then ReturnValueModule(((RectModule.Min + RectModule.Max) / 2).Y == ((RectModule1.Min + RectModule1.Max) / 2).Y, "", "") elseif VerticalAlignment == Enum.VerticalAlignment.Bottom then ReturnValueModule(RectModule.Max.Y == RectModule1.Max.Y, "", "") else ReturnValueModule(false, "Invalid VerticalAlignment!")
end