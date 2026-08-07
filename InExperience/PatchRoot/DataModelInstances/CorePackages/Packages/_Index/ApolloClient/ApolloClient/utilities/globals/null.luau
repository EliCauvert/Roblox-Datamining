local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local t = { __value = "null" }

return {
	NULL = t,
	toJSBoolean = function(p0) --[[ line: 19 ]]
		-- upvalues: boolean (ref), t (ref)
		return boolean.toJSBoolean(p0) and p0 ~= t
	end
}