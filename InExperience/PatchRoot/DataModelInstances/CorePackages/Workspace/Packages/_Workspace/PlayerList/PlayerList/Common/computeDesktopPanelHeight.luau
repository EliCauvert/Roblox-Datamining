local constantsModule = require(script.Parent.Parent.Common.Constants)

return function(p0, p1, p2)
	-- upvalues: constantsModule (ref)
	return math.max(math.min(p1, p0 * constantsModule.DESKTOP_MAX_VIEWPORT_FRACTION), p2)
end