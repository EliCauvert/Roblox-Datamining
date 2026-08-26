local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local kind = require(parent.GraphQL).Kind

function t.isDocumentNode(p1)
	-- upvalues: boolean (ref), kind (ref)
	return boolean.toJSBoolean(p1) and (typeof(p1) == "table" and (boolean.toJSBoolean(p1.kind) and p1.kind == kind.DOCUMENT))
end

return t