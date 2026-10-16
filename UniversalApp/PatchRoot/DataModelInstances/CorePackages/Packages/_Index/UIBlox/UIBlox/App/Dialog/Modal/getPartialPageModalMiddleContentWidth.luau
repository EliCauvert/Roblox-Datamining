local GetModalWindowWidthModule = require(script.Parent.getModalWindowWidth)

return function(p1, p2) --[[ Line: 9 | Named "getPartialPageModalMiddleContentWidth" ]]
	-- upvalues: GetModalWindowWidthModule (copy)
	return GetModalWindowWidthModule(p1) - 2 * (p2 or 24)
end