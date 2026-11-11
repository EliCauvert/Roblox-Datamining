local Parent = script.Parent.Parent.Parent.Parent
local Boolean = require(Parent.LuauPolyfill).Boolean
local _ = require(Parent.GraphQL)

return {
	graphQLResultHasError = function(p1): boolean
		-- upvalues: Boolean (copy)
		return if Boolean.toJSBoolean(p1.errors) then #p1.errors > 0 else false
	end
}