local Parent = script.Parent.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local PrintFunction = require(Parent.GraphQL).print
local _ = require(script.Parent.Parent.core.types)
local Callback = nil
local SelectHttpOptionsAndBodyModule = {
	fallbackHttpConfig = {
		http = { includeQuery = true, includeExtensions = false },
		headers = { accept = "*/*", ["content-type"] = "application/json" },
		options = { method = "POST" }
	},
	selectHttpOptionsAndBody = function(Body, p1, ...)
		-- upvalues: Object (copy), Array (copy), Callback (ref), Boolean (copy), PrintFunction (copy)
		local AssignResult = Object.assign({}, p1.options, { headers = p1.headers, credentials = p1.credentials })
		local T = nil
		T = if p1.http == nil then {} else p1.http
		Array.forEach({ ... }, function(p2)
			-- upvalues: AssignResult (ref), Object (upval), Callback (upval), Boolean (upval), T (ref)
			AssignResult = Object.assign({}, AssignResult, p2.options, {
				headers = Object.assign({}, AssignResult.headers, Callback(p2.headers))
			})
			
			if Boolean.toJSBoolean(p2.credentials) then
				AssignResult.credentials = p2.credentials
			end
			T = Object.assign({}, T, p2.http)
		end)
		local Extensions = Body.extensions
		local Query = Body.query
		local Body1 = {
			operationName = Body.operationName,
			variables = Body.variables
		}
		
		if T.includeExtensions then
			Body1.extensions = Extensions
		end
		if T.includeQuery then
			Body1.query = PrintFunction(Query)
		end
		return { options = AssignResult, body = Body1 }
	end
}

Callback = function(Headers)
	-- upvalues: Array (copy), Object (copy)
	if Headers == nil then
		return Headers
	else
		local t = {}
		Array.forEach(Object.keys(Headers), function(Text: string)
			-- upvalues: t (copy), Headers (copy)
			t[string.lower(Text)] = Headers[Text]
		end)
		
		return t
	end
end

return SelectHttpOptionsAndBodyModule