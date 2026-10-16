local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

return function(p1, p2, HorizontalAlignment) --[[ Line: 28 | Named "alignedHorizontally" ]]
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local RectModule = ToRectModule(p1)
	local RectModule1 = ToRectModule(p2)
	
	return if HorizontalAlignment == Enum.HorizontalAlignment.Left then ReturnValueModule(RectModule.Min.X == RectModule1.Min.X, "", "") elseif HorizontalAlignment == Enum.HorizontalAlignment.Center then ReturnValueModule(((RectModule.Min + RectModule.Max) / 2).X == ((RectModule1.Min + RectModule1.Max) / 2).X, "", "") elseif HorizontalAlignment == Enum.HorizontalAlignment.Right then ReturnValueModule(RectModule.Max.X == RectModule1.Max.X, "", "") else ReturnValueModule(false, "Invalid horizontal alignment!")
end