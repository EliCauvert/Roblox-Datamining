local url = require(script.Parent.Parent.Parent.Http).Url
local httpService = game:GetService("HttpService")

return function(p1, p2, p3)
	-- upvalues: url (ref), httpService (ref)
	assert(type(p2) == "string", "FollowingsPostFollow request expects userId to be a string")
	assert(type(p3) == "string", "FollowingsPostFollow request expects universeId to be a string")
	
	return p1(string.format("%s/v1/users/%s/universes/%s", url.FOLLOWINGS_URL, p2, p3), "POST", { postBody = httpService:JSONEncode({}) })
end