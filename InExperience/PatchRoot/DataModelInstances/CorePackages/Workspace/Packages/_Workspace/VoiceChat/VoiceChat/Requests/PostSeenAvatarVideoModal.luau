local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%s/v1/settings/record-user-seen-avatar-video-upsell-modal", Url.VOICE_URL), "POST", { postBody = "{}" })
end