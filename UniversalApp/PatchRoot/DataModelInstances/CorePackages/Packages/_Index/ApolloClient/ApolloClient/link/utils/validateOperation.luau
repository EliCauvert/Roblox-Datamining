local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InvariantError = require(Parent.jsutils.invariant).InvariantError
local _ = require(script.Parent.Parent.core.types)

return {
	validateOperation = function(p1) --[[ Line: 19 ]]
		-- upvalues: Object (copy), Array (copy), InvariantError (copy)
		local list = {
			"query",
			"operationName",
			"variables",
			"extensions",
			"context"
		}
		
		for _, value in ipairs(Object.keys(p1)) do
			if Array.indexOf(list, value) < 0 then
				error(InvariantError.new(("illegal argument: %s"):format(value)))
			end
		end
		return p1
	end
}