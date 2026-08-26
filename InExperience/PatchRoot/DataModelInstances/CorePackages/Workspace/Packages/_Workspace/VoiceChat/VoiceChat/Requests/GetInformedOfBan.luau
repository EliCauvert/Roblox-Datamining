local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p1)
	-- upvalues: url (ref)
	return p1(string.format("%sv1/moderation/informed-of-ban", url.VOICE_URL), "GET")
end