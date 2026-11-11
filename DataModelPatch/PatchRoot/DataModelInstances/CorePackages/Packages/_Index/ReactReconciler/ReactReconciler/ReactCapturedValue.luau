local _ = require(script.Parent.ReactInternalTypes)
local GetStackByFiberInDevAndProdFunction = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd

return {
	createCapturedValue = function(Value, Source)
		-- upvalues: GetStackByFiberInDevAndProdFunction (copy)
		return {
			value = Value,
			source = Source,
			stack = GetStackByFiberInDevAndProdFunction(Source)
		}
	end
}