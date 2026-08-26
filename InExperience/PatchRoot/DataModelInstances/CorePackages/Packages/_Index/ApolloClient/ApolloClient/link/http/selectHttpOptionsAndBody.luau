local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {
	fallbackHttpConfig = {
		http = { includeQuery = true, includeExtensions = false },
		headers = { accept = "*/*", ["content-type"] = "application/json" },
		options = { method = "POST" }
	}
}
local print = require(parent.GraphQL).print
local _ = require(script.Parent.Parent.core.types)
local headersToLowerCase = nil

function t.selectHttpOptionsAndBody(p1, p2, ...)
	-- upvalues: object (ref), array (ref), headersToLowerCase (write), boolean (ref), print (ref)
	local list = { ... }
	local var1 = object.assign({}, p2.options, { headers = p2.headers, credentials = p2.credentials })
	local var2 = if p2.http ~= nil then {} else p2.http
	array.forEach(list, function(p3)
		-- upvalues: var1 (write), object (copy), headersToLowerCase (copy), boolean (copy), var2 (write)
		var1 = object.assign({}, var1, p3.options, {
			headers = object.assign({}, var1.headers, headersToLowerCase(p3.headers))
		})
		
		if boolean.toJSBoolean(p3.credentials) then
			var1.credentials = p3.credentials
		end
		var2 = object.assign({}, var2, p3.http)
	end)
	local operationName = p1.operationName
	local extensions = p1.extensions
	local query = p1.query
	local t = { operationName = operationName, variables = p1.variables }
	
	if var2.includeExtensions then
		t.extensions = extensions
	end
	if var2.includeQuery then
		t.query = print(query)
	end
	return { options = var1, body = t }
end

headersToLowerCase = function(p1)
	-- upvalues: array (ref), object (ref)
	if p1 == nil then
		return p1
	end
	local t = {}
	array.forEach(object.keys(p1), function(p2)
		-- upvalues: t (ref), p1 (ref)
		t[string.lower(p2)] = p1[p2]
	end)
	
	return t
end

return t