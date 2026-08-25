local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p0)
	-- upvalues: url (ref)
	return p0(string.format("%s/v1/settings/record-user-seen-upsell-modal", url.VOICE_URL), "POST", { postBody = "{}" })
end