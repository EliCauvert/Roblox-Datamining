local PageLoadConfigModule = require(script.Parent.PageLoadConfig)

function isElementInScreenBounds(Frame: Frame, Vector, p1: number): boolean --[[ Line: 3 ]]
	-- upvalues: PageLoadConfigModule (copy)
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	
	if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
		return false
	else
		local IsYBelow = AbsoluteSize.Y * PageLoadConfigModule.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= math.max(0, math.min(AbsolutePosition.Y + AbsoluteSize.Y, Vector.Y) - math.max(AbsolutePosition.Y, p1))
		
		return AbsoluteSize.X * PageLoadConfigModule.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= math.max(0, math.min(AbsolutePosition.X + AbsoluteSize.X, Vector.X) - math.max(AbsolutePosition.X, 0)) and IsYBelow
	end
end

return isElementInScreenBounds