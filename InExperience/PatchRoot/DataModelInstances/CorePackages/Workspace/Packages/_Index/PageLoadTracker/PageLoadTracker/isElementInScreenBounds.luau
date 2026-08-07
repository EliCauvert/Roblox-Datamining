local pageLoadConfigModule = require(script.Parent.PageLoadConfig)

function isElementInScreenBounds(p0, p1, p2) --[[ line: 3 ]]
	-- upvalues: pageLoadConfigModule (ref)
	local absolutePosition = p0.AbsolutePosition
	local absoluteSize = p0.AbsoluteSize
	
	return if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then false else absoluteSize.X * pageLoadConfigModule.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= math.max(0, math.min(absolutePosition.X + absoluteSize.X, p1.X) - math.max(absolutePosition.X, 0)) and absoluteSize.Y * pageLoadConfigModule.SCREEN_BOUNDS.MIN_VISIBILITY_RATIO <= math.max(0, math.min(absolutePosition.Y + absoluteSize.Y, p1.Y) - math.max(absolutePosition.Y, p2))
end

return isElementInScreenBounds