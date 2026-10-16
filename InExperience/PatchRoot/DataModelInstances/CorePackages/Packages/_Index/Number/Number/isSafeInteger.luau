local IsIntegerModule = require(script.Parent.isInteger)
local MAXSAFEINTEGERModule = require(script.Parent.MAX_SAFE_INTEGER)

return function(Value: number): boolean --[[ Line: 20 ]]
	-- upvalues: IsIntegerModule (copy), MAXSAFEINTEGERModule (copy)
	return IsIntegerModule(Value) and math.abs(Value) <= MAXSAFEINTEGERModule
end