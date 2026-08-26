local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p1)
	-- upvalues: url (ref)
	return p1(string.format("%s/v1/settings/", url.VOICE_URL), "GET")
end