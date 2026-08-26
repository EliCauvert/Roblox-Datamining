local isIntegerModule = require(script.Parent.isInteger)
local MAX_SAFE_INTEGERModule = require(script.Parent.MAX_SAFE_INTEGER)

return function(p1)
	-- upvalues: isIntegerModule (ref), MAX_SAFE_INTEGERModule (ref)
	return isIntegerModule(p1) and math.abs(p1) <= MAX_SAFE_INTEGERModule
end