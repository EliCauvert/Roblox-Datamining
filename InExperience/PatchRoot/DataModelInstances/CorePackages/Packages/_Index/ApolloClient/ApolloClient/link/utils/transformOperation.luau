local t = {}
local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local _ = require(script.Parent.Parent.core.types)
local getOperationName = require(script.Parent.Parent.Parent.utilities).getOperationName

function t.transformOperation(p1)
	-- upvalues: boolean (ref), getOperationName (ref)
	local t = {
		variables = if boolean.toJSBoolean(p1.variables) then p1.variables else {},
		extensions = if boolean.toJSBoolean(p1.extensions) then p1.extensions else {},
		operationName = p1.operationName,
		query = p1.query
	}
	
	if not boolean.toJSBoolean(t.operationName) then
		if typeof(t.query) ~= "string" then
			t.operationName = boolean.toJSBoolean(getOperationName(t.query)) and getOperationName(t.query) or nil
			
			return t
		end
		t.operationName = ""
	end
	return t
end

return t