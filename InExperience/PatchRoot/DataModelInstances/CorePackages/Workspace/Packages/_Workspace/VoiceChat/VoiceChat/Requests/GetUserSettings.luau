local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(Callback) --[[ Line: 10 ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%s/v1/settings/", Url.VOICE_URL), "GET")
end