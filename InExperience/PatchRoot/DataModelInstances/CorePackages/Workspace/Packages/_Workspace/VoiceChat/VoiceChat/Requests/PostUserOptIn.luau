local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url

return function(p1, p2, p3)
	-- upvalues: url (ref), httpService (ref)
	local var1
	assert(type(p2) == "boolean", "UserOptIn request expects isUserOptIn to be a boolean")
	local formattedText = string.format("%sv1/settings/user-opt-in/", url.VOICE_URL)
	local _ = nil
	
	if p3 == nil then
		var1 = httpService:JSONEncode({ isUserOptIn = p2 })
	else
		assert(type(p3) == "boolean", "UserOptIn request expects isOptedInThroughUpsell to be a boolean")
		var1 = httpService:JSONEncode({ isUserOptIn = p2, isOptedInThroughUpsell = p3 })
	end
	return p1(formattedText, "POST", { postBody = var1 })
end