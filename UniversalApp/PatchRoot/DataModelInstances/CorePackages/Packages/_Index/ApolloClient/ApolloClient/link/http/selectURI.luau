local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local _ = require(script.Parent.Parent.core.types)

return {
	selectURI = function(p1, p2)
		-- upvalues: boolean (ref)
		local uri = p1:getContext().uri
		
		return if boolean.toJSBoolean(uri) then uri elseif typeof(p2) == "function" then p2(p1) elseif boolean.toJSBoolean(p2) then p2 else "/graphql"
	end
}