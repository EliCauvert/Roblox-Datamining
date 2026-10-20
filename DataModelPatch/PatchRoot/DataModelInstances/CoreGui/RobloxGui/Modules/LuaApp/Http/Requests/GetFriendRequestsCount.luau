local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%s/user/friend-requests/count", UrlModule.FRIEND_URL), "GET")
end