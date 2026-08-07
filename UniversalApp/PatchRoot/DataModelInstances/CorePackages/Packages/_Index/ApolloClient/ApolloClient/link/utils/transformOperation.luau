local t = {}
local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local _ = require(script.Parent.Parent.core.types)
local getOperationName = require(script.Parent.Parent.Parent.utilities).getOperationName

function t.transformOperation(p0) --[[ line: 20 ]]
	-- upvalues: boolean (ref), getOperationName (ref)
	local t = {
		variables = if boolean.toJSBoolean(p0.variables) then p0.variables else {},
		extensions = if boolean.toJSBoolean(p0.extensions) then p0.extensions else {},
		operationName = p0.operationName,
		query = p0.query
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