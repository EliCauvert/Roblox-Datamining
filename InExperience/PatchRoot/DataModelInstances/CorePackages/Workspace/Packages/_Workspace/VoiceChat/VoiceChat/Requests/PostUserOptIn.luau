local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p0, p1, p2)
	-- upvalues: url (ref), httpService (ref)
	local var2
	assert(type(p1) == "boolean", "UserOptIn request expects isUserOptIn to be a boolean")
	local formattedText = string.format("%sv1/settings/user-opt-in/", url.VOICE_URL)
	local _ = nil
	
	if p2 == nil then
		var2 = httpService:JSONEncode({ isUserOptIn = p1 })
	else
		assert(type(p2) == "boolean", "UserOptIn request expects isOptedInThroughUpsell to be a boolean")
		var2 = httpService:JSONEncode({ isUserOptIn = p1, isOptedInThroughUpsell = p2 })
	end
	return p0(formattedText, "POST", { postBody = var2 })
end