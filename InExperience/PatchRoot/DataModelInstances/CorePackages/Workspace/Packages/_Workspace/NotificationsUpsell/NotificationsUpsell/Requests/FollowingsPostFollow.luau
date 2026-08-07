local url = require(script.Parent.Parent.Parent.Http).Url
local httpService = game:GetService("HttpService")

return function(p0, p1, p2) --[[ line: 14 ]]
	-- upvalues: url (ref), httpService (ref)
	assert(type(p1) == "string", "FollowingsPostFollow request expects userId to be a string")
	assert(type(p2) == "string", "FollowingsPostFollow request expects universeId to be a string")
	
	return p0(string.format("%s/v1/users/%s/universes/%s", url.FOLLOWINGS_URL, p1, p2), "POST", { postBody = httpService:JSONEncode({}) })
end