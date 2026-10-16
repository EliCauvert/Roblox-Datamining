local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local _ = require(Parent.luaUtils.Response)
local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.core.types)
local ThrowServerErrorFunction = require(script.Parent.Parent.utils).throwServerError
local HasOwnPropertyModule = require(Parent.luaUtils.hasOwnProperty)

return {
	parseAndCheckHttpResponse = function(p1) --[[ Line: 34 ]]
		-- upvalues: HttpService (copy), Error1 (copy), ThrowServerErrorFunction (copy), Array (copy), HasOwnPropertyModule (copy)
		return function(Response) --[[ Line: 35 ]]
			-- upvalues: HttpService (upval), Error1 (upval), ThrowServerErrorFunction (upval), Array (upval), HasOwnPropertyModule (upval), p1 (copy)
			return Response:text():andThen(function(Result) --[[ Line: 38 ]]
				-- upvalues: HttpService (upval), Error1 (upval), Response (copy)
				local Success, Result1 = pcall(function() --[[ Line: 39 ]]
					-- upvalues: HttpService (upval), Result (copy)
					return HttpService:JSONDecode(Result), true
				end)
				
				if not Success then
					local NewError = Error1.new(Result1)
					NewError.name = "ServerParseError"
					NewError.response = Response
					NewError.statusCode = Response.status
					NewError.bodyText = Result
					error(NewError)
				end
				return Result1
			end):andThen(function(Result) --[[ Line: 54 ]]
				-- upvalues: Response (copy), ThrowServerErrorFunction (upval), Array (upval), HasOwnPropertyModule (upval), p1 (upval)
				if Response.status ~= nil and Response.status >= 300 then
					ThrowServerErrorFunction(Response, Result, ("Response not successful: Received status code %s"):format((tostring(Response.status))))
				end
				if not Array.isArray(Result) and not HasOwnPropertyModule(Result, "data") and not HasOwnPropertyModule(Result, "errors") then
					ThrowServerErrorFunction(Response, Result, ("Server response was missing for query '%s'."):format(Array.isArray(p1) and Array.join(Array.map(p1, function(p2) --[[ Line: 77 ]]
						return p2.operationName
					end), ", ") or p1.operationName))
				end
				return Result
			end)
		end
	end
}