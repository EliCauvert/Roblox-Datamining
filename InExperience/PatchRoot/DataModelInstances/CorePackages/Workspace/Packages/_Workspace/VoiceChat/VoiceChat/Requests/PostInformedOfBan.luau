local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url
local httpService = game:GetService("HttpService")

return function(p1, p2)
	-- upvalues: url (ref), httpService (ref)
	assert(type(p2) == "boolean", "PostInformedOfBan request expects informedOfBan to be a boolean")
	
	return p1(string.format("%sv1/moderation/informed-of-ban", url.VOICE_URL), "POST", httpService:JSONEncode({ informedOfBan = p2 }))
end