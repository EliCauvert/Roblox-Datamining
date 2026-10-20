local ConstantsModule = require(script.Parent.Parent.Common.Constants)

return function(p1, p2: number, p3: number): number
	-- upvalues: ConstantsModule (copy)
	return (math.max(math.min(p2, p1 * ConstantsModule.DESKTOP_MAX_VIEWPORT_FRACTION), p3))
end