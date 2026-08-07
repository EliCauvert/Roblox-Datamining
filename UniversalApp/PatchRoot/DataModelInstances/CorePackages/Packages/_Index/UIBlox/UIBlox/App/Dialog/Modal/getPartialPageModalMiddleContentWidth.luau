local getModalWindowWidthModule = require(script.Parent.getModalWindowWidth)

return function(p0, p1) --[[ line: 9 | named "getPartialPageModalMiddleContentWidth" ]]
	-- upvalues: getModalWindowWidthModule (ref)
	return getModalWindowWidthModule(p0) - 2 * (p1 or 24)
end