local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%sv1/moderation/informed-of-ban", Url.VOICE_URL), "GET")
end