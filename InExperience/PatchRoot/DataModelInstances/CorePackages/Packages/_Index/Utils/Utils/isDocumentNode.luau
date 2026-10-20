local Parent = script.Parent.Parent
local Boolean = require(Parent.LuauPolyfill).Boolean
local Kind = require(Parent.GraphQL).Kind

return {
	isDocumentNode = function(p1): boolean
		-- upvalues: Boolean (copy), Kind (copy)
		return Boolean.toJSBoolean(p1) and (typeof(p1) == "table" and (Boolean.toJSBoolean(p1.kind) and p1.kind == Kind.DOCUMENT))
	end
}