local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NewResult = require(Modules.LuaApp.Http.UrlBuilder).new({
	path = "v3/signup/bundles",
	base = require(Modules.LuaApp.Http.Url).AUTH_URL
})

return function(Callback)
	-- upvalues: NewResult (copy)
	return Callback(NewResult(), "GET")
end