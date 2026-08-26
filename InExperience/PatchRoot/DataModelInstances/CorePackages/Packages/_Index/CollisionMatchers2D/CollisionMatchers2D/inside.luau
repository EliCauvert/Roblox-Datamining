local toRectModule = require(script.Parent.toRect)
local returnValueModule = require(script.Parent.returnValue)

local function _(p1, p2)
	return p2.Min.X <= p1.X and (p1.X <= p2.Max.X and (p2.Min.Y <= p1.Y and p1.Y <= p2.Max.Y))
end

return function(p1, p2)
	-- upvalues: toRectModule (ref), returnValueModule (ref)
	local var1 = toRectModule(p1)
	local var2 = toRectModule(p2)
	local min = var1.Min
	local var3 = var2.Min.X <= min.X and (min.X <= var2.Max.X and (var2.Min.Y <= min.Y and min.Y <= var2.Max.Y))
	
	if var3 then
		local max = var1.Max
		var3 = var2.Min.X <= max.X and (max.X <= var2.Max.X and (var2.Min.Y <= max.Y and max.Y <= var2.Max.Y))
	end
	return returnValueModule(var3, "Is inside the element", "Is not inside the element")
end