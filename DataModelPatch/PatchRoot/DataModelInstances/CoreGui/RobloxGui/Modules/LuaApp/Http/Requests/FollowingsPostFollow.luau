local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)
local HttpService = game:GetService("HttpService")

return function(Callback, p1, p2)
	-- upvalues: UrlModule (copy), HttpService (copy)
	assert(type(p1) == "string", "FollowingsPostFollow request expects userId to be a string")
	assert(type(p2) == "string", "FollowingsPostFollow request expects universeId to be a string")
	
	return Callback(string.format("%s/v1/users/%s/universes/%s", UrlModule.FOLLOWINGS_URL, p1, p2), "POST", { postBody = HttpService:JSONEncode({}) })
end