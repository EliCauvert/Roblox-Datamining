local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url
local HttpService = game:GetService("HttpService")

return function(Callback, InformedOfBan)
	-- upvalues: Url (copy), HttpService (copy)
	assert(type(InformedOfBan) == "boolean", "PostInformedOfBan request expects informedOfBan to be a boolean")
	
	return Callback(string.format("%sv1/moderation/informed-of-ban", Url.VOICE_URL), "POST", (HttpService:JSONEncode({ informedOfBan = InformedOfBan })))
end