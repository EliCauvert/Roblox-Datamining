local isIntegerModule = require(script.Parent.isInteger)
local MAX_SAFE_INTEGERModule = require(script.Parent.MAX_SAFE_INTEGER)

return function(p0)
	-- upvalues: isIntegerModule (ref), MAX_SAFE_INTEGERModule (ref)
	return isIntegerModule(p0) and math.abs(p0) <= MAX_SAFE_INTEGERModule
end