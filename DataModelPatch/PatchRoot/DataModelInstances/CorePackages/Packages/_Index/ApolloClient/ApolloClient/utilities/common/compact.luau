local Object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object

return {
	compact = function(...)
		-- upvalues: Object (copy)
		return Object.assign({}, ...)
	end
}