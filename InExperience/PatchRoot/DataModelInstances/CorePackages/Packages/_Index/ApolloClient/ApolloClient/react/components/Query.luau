local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local _ = require(Parent.core)
local _ = require(script.Parent.types)
local UseQueryFunction = require(script.Parent.Parent.hooks).useQuery

return {
	Query = function(p1) --[[ Line: 27 ]]
		-- upvalues: Object (copy), UseQueryFunction (copy), Boolean (copy)
		local ChildrenFunction = p1.children
		local UseQueryResult = UseQueryFunction(p1.query, (Object.assign({}, p1, { children = Object.None, query = Object.None })))
		
		return if Boolean.toJSBoolean(UseQueryResult) then ChildrenFunction(UseQueryResult) else nil
	end
}