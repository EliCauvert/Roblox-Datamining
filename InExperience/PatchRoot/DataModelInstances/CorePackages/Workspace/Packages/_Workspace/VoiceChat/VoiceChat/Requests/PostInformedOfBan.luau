local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url
local httpService = game:GetService("HttpService")

return function(p0, p1)
	-- upvalues: url (ref), httpService (ref)
	assert(type(p1) == "boolean", "PostInformedOfBan request expects informedOfBan to be a boolean")
	
	return p0(string.format("%sv1/moderation/informed-of-ban", url.VOICE_URL), "POST", httpService:JSONEncode({ informedOfBan = p1 }))
end