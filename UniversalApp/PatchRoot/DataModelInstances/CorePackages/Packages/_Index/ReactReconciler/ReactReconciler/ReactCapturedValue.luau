local _ = require(script.Parent.ReactInternalTypes)
local getStackByFiberInDevAndProd = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd

return {
	createCapturedValue = function(p0, p1)
		-- upvalues: getStackByFiberInDevAndProd (ref)
		return {
			value = p0,
			source = p1,
			stack = getStackByFiberInDevAndProd(p1)
		}
	end
}