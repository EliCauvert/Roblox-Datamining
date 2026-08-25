local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p0, p1, p2)
	-- upvalues: url (ref)
	assert(type(p2) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string")
	assert(type(p1) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string")
	
	return p0(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s", url.VOICE_URL, if p2 == "" or p2 == nil then p1 else p1 .. "?placeId=" .. p2), "GET")
end