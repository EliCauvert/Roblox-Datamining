local Url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(Callback, Text, Text1)
	-- upvalues: Url (copy)
	assert(type(Text1) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string")
	assert(type(Text) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string")
	
	return Callback(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s", Url.VOICE_URL, if Text1 == "" or Text1 == nil then Text else Text .. "?placeId=" .. Text1), "GET")
end