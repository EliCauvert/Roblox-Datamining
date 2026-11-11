local Boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local _ = require(script.Parent.Parent.core.types)

return {
	selectURI = function(p1, Callback)
		-- upvalues: Boolean (copy)
		local Uri = p1:getContext().uri
		
		return if Boolean.toJSBoolean(Uri) then Uri elseif typeof(Callback) == "function" then Callback(p1) else Boolean.toJSBoolean(Callback) and Callback or "/graphql"
	end
}