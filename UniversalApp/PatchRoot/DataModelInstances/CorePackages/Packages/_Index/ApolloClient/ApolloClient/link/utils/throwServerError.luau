local parent = script.Parent.Parent.Parent
local error = require(parent.Parent.LuauPolyfill).Error
local _ = require(parent.luaUtils.Response)

return {
	throwServerError = function(p1, p2, p3)
		-- upvalues: error (ref)
		local serverError = error.new(p3)
		serverError.name = "ServerError"
		serverError.response = p1
		serverError.statusCode = p1.status
		serverError.result = p2
		error(serverError)
	end
}