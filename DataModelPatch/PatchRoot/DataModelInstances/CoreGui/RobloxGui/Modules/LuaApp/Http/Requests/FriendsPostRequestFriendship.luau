local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1, FriendshipOriginSourceType)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(string.format("%s/users/%s/request-friendship", UrlModule.FRIEND_URL, p1), "POST", {
		postBody = HttpService:JSONEncode({ friendshipOriginSourceType = FriendshipOriginSourceType })
	})
end