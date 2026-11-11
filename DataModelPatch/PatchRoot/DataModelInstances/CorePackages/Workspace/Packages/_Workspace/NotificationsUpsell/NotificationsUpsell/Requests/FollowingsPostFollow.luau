local Url = require(script.Parent.Parent.Parent.Http).Url
local HttpService = game:GetService("HttpService")

return function(Callback, p1, p2)
	-- upvalues: Url (copy), HttpService (copy)
	assert(type(p1) == "string", "FollowingsPostFollow request expects userId to be a string")
	assert(type(p2) == "string", "FollowingsPostFollow request expects universeId to be a string")
	
	return Callback(string.format("%s/v1/users/%s/universes/%s", Url.FOLLOWINGS_URL, p1, p2), "POST", { postBody = HttpService:JSONEncode({}) })
end