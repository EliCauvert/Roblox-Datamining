local Parent = script.Parent.Parent.Parent
local Error1 = require(Parent.Parent.LuauPolyfill).Error
local _ = require(Parent.luaUtils.Response)

return {
	throwServerError = function(Response, Result, p1)
		-- upvalues: Error1 (copy)
		local NewError = Error1.new(p1)
		NewError.name = "ServerError"
		NewError.response = Response
		NewError.statusCode = Response.status
		NewError.result = Result
		error(NewError)
	end
}