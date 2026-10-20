local Boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local config = { __value = "null" }

return {
	NULL = config,
	toJSBoolean = function(p1): boolean
		-- upvalues: Boolean (copy), config (copy)
		return Boolean.toJSBoolean(p1) and p1 ~= config
	end
}