local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local t = { __value = "null" }

return {
	NULL = t,
	toJSBoolean = function(p1)
		-- upvalues: boolean (ref), t (ref)
		return boolean.toJSBoolean(p1) and p1 ~= t
	end
}