local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sv2/stream-notifications/unread-count", UrlModule.NOTIFICATION_URL), "GET")
end