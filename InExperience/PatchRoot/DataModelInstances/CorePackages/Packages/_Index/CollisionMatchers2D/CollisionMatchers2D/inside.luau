local ToRectModule = require(script.Parent.toRect)
local ReturnValueModule = require(script.Parent.returnValue)

local function _(Vector, p1): boolean
	return p1.Min.X <= Vector.X and (Vector.X <= p1.Max.X and p1.Min.Y <= Vector.Y) and Vector.Y <= p1.Max.Y
end

return function(p1, p2)
	-- upvalues: ToRectModule (copy), ReturnValueModule (copy)
	local RectModule = ToRectModule(p1)
	local RectModule1 = ToRectModule(p2)
	local Min = RectModule.Min
	local IsYBelow: boolean = RectModule1.Min.X <= Min.X and (Min.X <= RectModule1.Max.X and (RectModule1.Min.Y <= Min.Y and Min.Y <= RectModule1.Max.Y))
	
	if IsYBelow then
		local Max = RectModule.Max
		IsYBelow = RectModule1.Min.X <= Max.X and (Max.X <= RectModule1.Max.X and RectModule1.Min.Y <= Max.Y) and Max.Y <= RectModule1.Max.Y
	end
	return ReturnValueModule(IsYBelow, "Is inside the element", "Is not inside the element")
end