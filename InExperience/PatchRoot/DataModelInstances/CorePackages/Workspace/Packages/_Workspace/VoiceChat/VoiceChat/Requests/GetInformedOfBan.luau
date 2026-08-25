local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p0)
	-- upvalues: url (ref)
	return p0(string.format("%sv1/moderation/informed-of-ban", url.VOICE_URL), "GET")
end