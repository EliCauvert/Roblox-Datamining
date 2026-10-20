local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NewResult = require(Modules.LuaApp.Http.UrlBuilder).new({
	path = "/v2/passwords/validate",
	query = "request.username={username}&request.password={password}",
	base = require(Modules.LuaApp.Http.Url).AUTH_URL
})

return function(Callback, Username, Password)
	-- upvalues: NewResult (copy)
	return Callback(NewResult({ username = Username, password = Password }), "GET", { maxRetryCount = 0 })
end