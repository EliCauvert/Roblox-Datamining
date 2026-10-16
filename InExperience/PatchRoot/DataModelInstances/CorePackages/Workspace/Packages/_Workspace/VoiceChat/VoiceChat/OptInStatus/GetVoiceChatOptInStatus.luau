local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(Callback) --[[ Line: 10 ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%s/v1/settings/user-opt-in", Url.VOICE_URL), "GET")
end