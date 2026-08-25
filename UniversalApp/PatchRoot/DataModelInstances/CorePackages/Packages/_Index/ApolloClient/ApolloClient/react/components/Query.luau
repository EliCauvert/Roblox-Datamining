local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local _ = require(parent.core)
local _ = require(script.Parent.types)
local useQuery = require(script.Parent.Parent.hooks).useQuery

function t.Query(p0)
	-- upvalues: object (ref), useQuery (ref), boolean (ref)
	local var2 = useQuery(p0.query, object.assign({}, p0, { children = object.None, query = object.None }))
	
	return if boolean.toJSBoolean(var2) then p0.children(var2) else nil
end

return t