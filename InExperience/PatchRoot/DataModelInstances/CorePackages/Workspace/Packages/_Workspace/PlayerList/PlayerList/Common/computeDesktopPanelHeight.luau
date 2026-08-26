local constantsModule = require(script.Parent.Parent.Common.Constants)

return function(p1, p2, p3)
	-- upvalues: constantsModule (ref)
	return math.max(math.min(p2, p1 * constantsModule.DESKTOP_MAX_VIEWPORT_FRACTION), p3)
end