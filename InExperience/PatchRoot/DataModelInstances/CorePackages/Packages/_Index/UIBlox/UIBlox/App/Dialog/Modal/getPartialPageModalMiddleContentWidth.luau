local getModalWindowWidthModule = require(script.Parent.getModalWindowWidth)

return function(p1, p2)
	-- upvalues: getModalWindowWidthModule (ref)
	return getModalWindowWidthModule(p1) - 2 * (p2 or 24)
end