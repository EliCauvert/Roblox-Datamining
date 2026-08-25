local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local kind = require(parent.GraphQL).Kind

function t.isDocumentNode(p0)
	-- upvalues: boolean (ref), kind (ref)
	return boolean.toJSBoolean(p0) and (typeof(p0) == "table" and (boolean.toJSBoolean(p0.kind) and p0.kind == kind.DOCUMENT))
end

return t