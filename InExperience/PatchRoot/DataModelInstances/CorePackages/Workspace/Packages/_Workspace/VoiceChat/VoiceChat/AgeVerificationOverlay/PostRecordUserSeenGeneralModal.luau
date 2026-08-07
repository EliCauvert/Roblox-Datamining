local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url
local httpService = game:GetService("HttpService")

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: httpService (ref), url (ref)
	assert(type(p1) == "string", "PostRecordUserSeenGeneralModal request expects modalId to be a string")
	
	return p0(string.format("%s/v1/settings/record-user-seen-modal", url.VOICE_URL), "POST", httpService:JSONEncode({ modalId = p1 }))
end