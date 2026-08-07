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

function t.selectHttpOptionsAndBody(p0, p1, ...) --[[ line: 112 ]]
	-- upvalues: object (ref), array (ref), headersToLowerCase (write), boolean (ref), print (ref)
	local list = { ... }
	local var4 = object.assign({}, p1.options, { headers = p1.headers, credentials = p1.credentials })
	local var5 = if p1.http ~= nil then {} else p1.http
	array.forEach(list, function(p2) --[[ line: 131 ]]
		-- upvalues: var4 (write), object (copy), headersToLowerCase (copy), boolean (copy), var5 (write)
		var4 = object.assign({}, var4, p2.options, {
			headers = object.assign({}, var4.headers, headersToLowerCase(p2.headers))
		})
		
		if boolean.toJSBoolean(p2.credentials) then
			var4.credentials = p2.credentials
		end
		var5 = object.assign({}, var5, p2.http)
	end)
	local operationName = p0.operationName
	local extensions = p0.extensions
	local query = p0.query
	local t = { operationName = operationName, variables = p0.variables }
	
	if var5.includeExtensions then
		t.extensions = extensions
	end
	if var5.includeQuery then
		t.query = print(query)
	end
	return { options = var4, body = t }
end

headersToLowerCase = function(p3) --[[ line: 163 | named "headersToLowerCase" ]]
	-- upvalues: array (ref), object (ref)
	if p3 == nil then
		return p3
	end
	local t = {}
	array.forEach(object.keys(p3), function(p4) --[[ line: 166 ]]
		-- upvalues: t (ref), p3 (ref)
		t[string.lower(p4)] = p3[p4]
	end)
	
	return t
end

return t