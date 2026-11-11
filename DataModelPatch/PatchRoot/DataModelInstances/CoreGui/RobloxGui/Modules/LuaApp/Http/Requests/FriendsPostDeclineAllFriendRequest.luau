local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(string.format("%s/user/friend-requests/decline-all", UrlModule.FRIEND_URL), "POST", { postBody = HttpService:JSONEncode({}) })
end