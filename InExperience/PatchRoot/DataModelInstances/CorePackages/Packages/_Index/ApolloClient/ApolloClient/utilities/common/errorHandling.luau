local t = {}
local parent = script.Parent.Parent.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local _ = require(parent.GraphQL)

function t.graphQLResultHasError(p1)
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p1.errors) then true else false
end

return t