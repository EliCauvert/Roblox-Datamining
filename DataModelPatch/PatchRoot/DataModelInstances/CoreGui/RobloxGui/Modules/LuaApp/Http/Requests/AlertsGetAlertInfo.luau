local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%smaintenance-status/v1/alerts/alert-info", UrlModule.APIS_URL), "GET")
end