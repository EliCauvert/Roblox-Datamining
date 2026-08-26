local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local _ = require(parent.core)
local _ = require(script.Parent.types)
local useQuery = require(script.Parent.Parent.hooks).useQuery

function t.Query(p1)
	-- upvalues: object (ref), useQuery (ref), boolean (ref)
	local var1 = useQuery(p1.query, object.assign({}, p1, { children = object.None, query = object.None }))
	
	return if boolean.toJSBoolean(var1) then p1.children(var1) else nil
end

return t