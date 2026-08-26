local _ = require(script.Parent.ReactInternalTypes)
local getStackByFiberInDevAndProd = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd

return {
	createCapturedValue = function(p1, p2)
		-- upvalues: getStackByFiberInDevAndProd (ref)
		return {
			value = p1,
			source = p2,
			stack = getStackByFiberInDevAndProd(p2)
		}
	end
}