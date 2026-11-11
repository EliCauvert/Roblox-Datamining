local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlModule = require(Modules.LuaApp.Http.Url)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)

return function(Callback)
	-- upvalues: UrlBuilderModule (copy), UrlModule (copy)
	return Callback(UrlBuilderModule.new({
		path = "users/authenticated/roles",
		base = UrlModule.USERS_URL
	})(), "GET")
end