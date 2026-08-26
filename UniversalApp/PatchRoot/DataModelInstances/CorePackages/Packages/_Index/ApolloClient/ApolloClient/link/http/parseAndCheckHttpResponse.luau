local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local _ = require(parent.luaUtils.Response)
local httpService = game:GetService("HttpService")
local t = {}
local _ = require(script.Parent.Parent.core.types)
local throwServerError = require(script.Parent.Parent.utils).throwServerError
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)

function t.parseAndCheckHttpResponse(p1)
	-- upvalues: httpService (ref), error (ref), throwServerError (ref), array (ref), hasOwnPropertyModule (ref)
	return function(p2)
		-- upvalues: httpService (copy), error (copy), throwServerError (copy), array (copy), hasOwnPropertyModule (copy), p1 (ref)
		return p2:text():andThen(function(p3)
			-- upvalues: httpService (copy), error (copy), p2 (ref)
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p3 (ref)
				return httpService:JSONDecode(p3), true
			end)
			
			if not ok then
				local serverParseError = error.new(status)
				serverParseError.name = "ServerParseError"
				serverParseError.response = p2
				serverParseError.statusCode = p2.status
				serverParseError.bodyText = p3
				error(serverParseError)
			end
			return status
		end):andThen(function(p3)
			-- upvalues: p2 (ref), throwServerError (copy), array (copy), hasOwnPropertyModule (copy), p1 (copy)
			if p2.status ~= nil and p2.status >= 300 then
				throwServerError(p2, p3, ("Response not successful: Received status code %s"):format(tostring(p2.status)))
			end
			if not array.isArray(p3) and not hasOwnPropertyModule(p3, "data") and not hasOwnPropertyModule(p3, "errors") then
				throwServerError(p2, p3, ("Server response was missing for query '%s'."):format(array.isArray(p1) and array.join(array.map(p1, function(p4)
					return p4.operationName
				end), ", ") or p1.operationName))
			end
			return p3
		end)
	end
end

return t