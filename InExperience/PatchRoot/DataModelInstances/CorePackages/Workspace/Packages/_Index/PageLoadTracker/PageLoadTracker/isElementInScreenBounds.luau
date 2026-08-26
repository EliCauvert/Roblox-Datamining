local pageLoadConfigModule = require(script.Parent.PageLoadConfig)

function isElementInScreenBounds(p1, p2, p3)
	-- upvalues: pageLoadConfigModule (ref)
	local absolutePosition = p1.AbsolutePosition
	local absoluteSize = p1.AbsoluteSize
	
	return if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then false else absoluteSize.X * pageLoadConfigModule.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= math.max(0, math.min(absolutePosition.X + absoluteSize.X, p2.X) - math.max(absolutePosition.X, 0)) and absoluteSize.Y * pageLoadConfigModule.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= math.max(0, math.min(absolutePosition.Y + absoluteSize.Y, p2.Y) - math.max(absolutePosition.Y, p3))
end

return isElementInScreenBounds