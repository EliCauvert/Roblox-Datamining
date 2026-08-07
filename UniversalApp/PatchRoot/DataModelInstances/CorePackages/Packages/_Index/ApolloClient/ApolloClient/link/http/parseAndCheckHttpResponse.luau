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

function t.parseAndCheckHttpResponse(p0) --[[ line: 34 ]]
	-- upvalues: httpService (ref), error (ref), throwServerError (ref), array (ref), hasOwnPropertyModule (ref)
	return function(p1) --[[ line: 35 ]]
		-- upvalues: httpService (copy), error (copy), throwServerError (copy), array (copy), hasOwnPropertyModule (copy), p0 (ref)
		return p1:text():andThen(function(p4) --[[ line: 38 ]]
			-- upvalues: httpService (copy), error (copy), p1 (ref)
			local ok, status = pcall(function() --[[ line: 39 ]]
				-- upvalues: httpService (copy), p4 (ref)
				return httpService:JSONDecode(p4), true
			end)
			
			if not ok then
				local serverParseError = error.new(status)
				serverParseError.name = "ServerParseError"
				serverParseError.response = p1
				serverParseError.statusCode = p1.status
				serverParseError.bodyText = p4
				error(serverParseError)
			end
			return status
		end):andThen(function(p2) --[[ line: 54 ]]
			-- upvalues: p1 (ref), throwServerError (copy), array (copy), hasOwnPropertyModule (copy), p0 (copy)
			if p1.status ~= nil and p1.status >= 300 then
				throwServerError(p1, p2, ("Response not successful: Received status code %s"):format(tostring(p1.status)))
			end
			if not array.isArray(p2) and not hasOwnPropertyModule(p2, "data") and not hasOwnPropertyModule(p2, "errors") then
				throwServerError(p1, p2, ("Server response was missing for query '%s'."):format(array.isArray(p0) and array.join(array.map(p0, function(p3) --[[ line: 77 ]]
					return p3.operationName
				end), ", ") or p0.operationName))
			end
			return p2
		end)
	end
end

return t