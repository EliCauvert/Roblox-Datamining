local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1, p2)
	-- upvalues: UrlModule (copy)
	assert(type(p1) == "string", "FollowingsGetStatus request expects userId to be a string")
	assert(type(p2) == "string", "FollowingsGetStatus request expects universeId to be a string")
	
	return Callback(string.format("%s/v1/users/%s/universes/%s/status", UrlModule.FOLLOWINGS_URL, p1, p2), "GET")
end