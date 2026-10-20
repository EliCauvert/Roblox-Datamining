local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url
local HttpService = game:GetService("HttpService")

return function(Callback, ModalId)
	-- upvalues: HttpService (copy), Url (copy)
	assert(type(ModalId) == "string", "PostRecordUserSeenGeneralModal request expects modalId to be a string")
	
	return Callback(string.format("%s/v1/settings/record-user-seen-modal", Url.VOICE_URL), "POST", (HttpService:JSONEncode({ modalId = ModalId })))
end