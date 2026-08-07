local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p0) --[[ line: 10 ]]
	-- upvalues: url (ref)
	return p0(string.format("%s/v1/settings/user-opt-in", url.VOICE_URL), "GET")
end