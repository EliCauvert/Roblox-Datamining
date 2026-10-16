local Object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object

return {
	compact = function(...) --[[ Line: 13 ]]
		-- upvalues: Object (copy)
		return Object.assign({}, ...)
	end
}