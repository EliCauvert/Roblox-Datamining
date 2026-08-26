local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url
local httpService = game:GetService("HttpService")

return function(p1, p2)
	-- upvalues: httpService (ref), url (ref)
	assert(type(p2) == "string", "PostRecordUserSeenGeneralModal request expects modalId to be a string")
	
	return p1(string.format("%s/v1/settings/record-user-seen-modal", url.VOICE_URL), "POST", httpService:JSONEncode({ modalId = p2 }))
end