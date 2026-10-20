local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sv1/themes/User/%d", UrlModule.ACCOUNT_SETTINGS, p1), "GET")
end