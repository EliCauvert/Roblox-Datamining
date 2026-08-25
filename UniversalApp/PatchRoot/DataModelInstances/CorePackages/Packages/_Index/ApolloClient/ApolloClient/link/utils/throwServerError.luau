local parent = script.Parent.Parent.Parent
local error = require(parent.Parent.LuauPolyfill).Error
local _ = require(parent.luaUtils.Response)

return {
	throwServerError = function(p0, p1, p2)
		-- upvalues: error (ref)
		local serverError = error.new(p2)
		serverError.name = "ServerError"
		serverError.response = p0
		serverError.statusCode = p0.status
		serverError.result = p1
		error(serverError)
	end
}